package cz.czechitas.denik.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import cz.czechitas.denik.bean.Record;
import cz.czechitas.denik.bean.RecordList;
import cz.czechitas.denik.enums.IkonyUrceni;
import cz.czechitas.denik.enums.IkonyVylet;


public class JdbcDao implements UserDao {
	private static final String LOADALLRECORDSFROMDB = "select zv.id_zapis,zv.jmeno_autor,zv.nazev_vylet,zv.zapis, iu.hodnoty_urceni,iv.hodnoty_ikony_vylet,zv.odkaz_misto, zv.odkaz_restaurace, zv.hodnoceni, zv.okres \r\n" + 
			" from Zaznam_vyletu zv, ikony_urceni iu, ikony_vylet iv\r\n" + 
			" where zv.ikony_urceni = iu.id_ikony_urceni\r\n" + 
			" and zv.ikony_vylet = iv.id_ikony_vylet";
	
	private static final String INSERTSINGLERECORDINTODB = "INSERT INTO Zaznam_vyletu (jmeno_autor,nazev_vylet,zapis, "
			+ "ikony_urceni,ikony_vylet,odkaz_misto, odkaz_restaurace, hodnoceni, okres) "
			+ "VALUE (?,?,?,?,?,?,?,?,?)";
	private static final String LOADSINGLERECORD = "select zv.id_zapis,zv.jmeno_autor,zv.nazev_vylet,zv.zapis, iu.hodnoty_urceni,iv.hodnoty_ikony_vylet,zv.odkaz_misto, zv.odkaz_restaurace, zv.hodnoceni, zv.okres \r\n" + 
			"from Zaznam_vyletu zv, ikony_urceni iu, ikony_vylet iv\r\n" + 
			"			where zv.id_zapis = ?\r\n" + 
			"			and zv.ikony_urceni = iu.id_ikony_urceni\r\n" + 
			"			and zv.ikony_vylet = iv.id_ikony_vylet";
	
	
	@Override
	public boolean insertSingleRecordIntoDb(Record record) {
			DataSource ds = getDataSource();
		try (Connection con = ds.getConnection(); PreparedStatement stmt = con.prepareStatement(INSERTSINGLERECORDINTODB)) {
			stmt.setString(1, record.getJmeno_autor());
			stmt.setString(2, record.getNazev_vylet());
			stmt.setString(3, record.getZapis());
			stmt.setInt(4, record.getIkony_urceni().getIkony_urceni());
			stmt.setInt(5, record.getIkony_vylet().getIkony_vylet());
			stmt.setString(6, record.getOdkaz_misto());
			stmt.setString(7, record.getOdkaz_restaurace()); 
			stmt.setInt(8, record.getHodnoceni());
			stmt.setString(9, record.getOkres());

			stmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public RecordList loadAllRecordsFromDb() {
		RecordList recordList = new RecordList();
		ArrayList<Record> listOfRecordsFromDb = new ArrayList<>();
		DataSource ds = getDataSource(); // volam metodu getDataSource 
		try (Connection con = ds.getConnection(); PreparedStatement stmt = con.prepareStatement(LOADALLRECORDSFROMDB)) {
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Record record = new Record(rs.getInt("id_zapis"), rs.getString("jmeno_autor"),
						rs.getString("nazev_vylet"), rs.getString("zapis"), IkonyUrceni.valueOf(rs.getString("iu.hodnoty_urceni").toUpperCase()), IkonyVylet.valueOf(rs.getString("iv.hodnoty_ikony_vylet").toUpperCase()), rs.getString("odkaz_misto"),
						rs.getString("odkaz_restaurace"), rs.getString("okres"), rs.getInt("hodnoceni"));
				listOfRecordsFromDb.add(record);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		recordList.setListOfRecordsFromDb(listOfRecordsFromDb);
		return recordList;

	}

	@Override
	public Record loadSingleRecord(int id_zapis) {
	Record record = new Record ();
	 String jmeno_autor = null;
	 String nazev_vylet = null;
	 String zapis = null;
	 String odkaz_misto = null;
	 String odkaz_restaurace = null;
	 IkonyUrceni ikony_urceni = null;
	 IkonyVylet ikony_vylet = null;
	 String okres = null;
	 int hodnoceni = 0;
	DataSource ds = getDataSource(); // volam metodu getDataSource 
		try (Connection con = ds.getConnection(); PreparedStatement stmt = con.prepareStatement(LOADSINGLERECORD)) {
			stmt.setInt(1, id_zapis);
			ResultSet rs = stmt.executeQuery();
			rs.next();
			 id_zapis = rs.getInt("zv.id_zapis");
			 jmeno_autor = rs.getString("zv.jmeno_autor");
			 nazev_vylet = rs.getString("zv.nazev_vylet");
			 zapis = rs.getString("zv.zapis");
			 odkaz_misto = rs.getString("zv.odkaz_misto");
			 odkaz_restaurace =rs.getString("zv.odkaz_restaurace");
//			 ikony_urceni = IkonyUrceni.(rs.getString("ikony_urceni"));
			 ikony_urceni = IkonyUrceni.valueOf(rs.getString("iu.hodnoty_urceni").toUpperCase());
			 ikony_vylet = IkonyVylet.valueOf(rs.getString("iv.hodnoty_ikony_vylet").toUpperCase());
			 okres = rs.getString("zv.okres");
			 hodnoceni = rs.getInt("zv.hodnoceni");
			
		} catch (SQLException e) {
			e.printStackTrace();	
		}
		record.setIdzapis(id_zapis);
		record.setJmeno_autor(jmeno_autor);
		record.setNazev_vylet(nazev_vylet);
		record.setZapis(zapis);
		record.setOdkaz_misto(odkaz_misto);
		record.setOdkaz_restaurace(odkaz_restaurace);
		record.setIkony_urceni(ikony_urceni);
		record.setIkony_vylet(ikony_vylet);
		record.setOkres(okres);
		record.setHodnoceni(hodnoceni);
		System.out.println(record.toString());
		return record;
	}
	
	public RecordList loadFilteredRecord(String okres, IkonyVylet ikony_vylet, IkonyUrceni ikony_urceni, int hodnoceni) {
		String FilterALLStatement = LOADALLRECORDSFROMDB;
		RecordList recordList = new RecordList();
		ArrayList<Record> listOfRecordsFromDb = new ArrayList<>();
		DataSource ds = getDataSource();
	
		if (!okres.contains("default")){
			FilterALLStatement = FilterALLStatement + " and zv.okres = '" + okres + "'";	
		}
		if (ikony_vylet != IkonyVylet.DEFAULT){
			FilterALLStatement = FilterALLStatement + " and iv.hodnoty_ikony_vylet ='"+ ikony_vylet + "'";	
		}
		if (ikony_urceni != IkonyUrceni.DEFAULT){
			FilterALLStatement = FilterALLStatement + " and iu.hodnoty_urceni ='"+ ikony_urceni + "'";	
		}	
		if (hodnoceni != 0) {
			FilterALLStatement = FilterALLStatement + " and zv.hodnoceni = "+ hodnoceni;
		}
		System.out.println(FilterALLStatement);			
		try (Connection con = ds.getConnection(); 
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(FilterALLStatement);){
			while (rs.next()) {
				Record record = new Record(rs.getInt("id_zapis"), rs.getString("jmeno_autor"),
						rs.getString("nazev_vylet"), rs.getString("zapis"), IkonyUrceni.valueOf(rs.getString("iu.hodnoty_urceni").toUpperCase()), IkonyVylet.valueOf(rs.getString("iv.hodnoty_ikony_vylet").toUpperCase()), rs.getString("odkaz_misto"),
						rs.getString("odkaz_restaurace"), rs.getString("okres"), rs.getInt("hodnoceni"));
				listOfRecordsFromDb.add(record);
			
		}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		recordList.setListOfRecordsFromDb(listOfRecordsFromDb);
		return recordList;

	}
	

	private DataSource getDataSource() {
		try {
			Context ctx = new InitialContext();
			return (DataSource) ctx.lookup("java:/comp/env/cestovatelskydenikResource"); 
		} catch (NamingException e) {
			e.printStackTrace();
		}
		return null;
	};

}
