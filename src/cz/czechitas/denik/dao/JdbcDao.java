package cz.czechitas.denik.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
	private static final String INSERTSINGLERECORDINTODB = "INSERT INTO Zaznam_vyletu (id_zapis,jmeno_autor,nazev_vylet,zapis, "
<<<<<<< HEAD
			+ "ikony_urceni,ikony_vylet,odkaz_misto, odkaz_restaurace, hodnoceni, okres from Zaznam_vyletu) "
			+ "VALUE (?,?,?,?,?,?,?,?,?)";
	private static final String LOADSINGLERECORD = "select id_zapis,jmeno_autor,nazev_vylet,zapis,"
			+ " ikony_urceni,ikony_vylet,odkaz_misto, odkaz_restaurace, hodnoceni, okres from cestovatelskydenik.Zaznam_vyletu where id_zapis = ?";

=======
			+ "ikony_urceni,ikony_vylet,odkaz_misto, odkaz_restaurace,longlat, hodnoceni from Zaznam_vyletu) "
			+ "VALUE (?,?,?,?,?,?,?,?,?,?)";
	private static final String LOADSINGLERECORD = "select zv.id_zapis,zv.jmeno_autor,zv.nazev_vylet,zv.zapis, iu.hodnoty_urceni,iv.hodnoty_ikony_vylet,zv.odkaz_misto, zv.odkaz_restaurace, zv.hodnoceni, zv.okres \r\n" + 
			"from Zaznam_vyletu zv, ikony_urceni iu, ikony_vylet iv\r\n" + 
			"			where zv.id_zapis = ?\r\n" + 
			"			and zv.ikony_urceni = iu.id_ikony_urceni\r\n" + 
			"			and zv.ikony_vylet = iv.id_ikony_vylet";
	
>>>>>>> 5e7e023d1482729da077e6bd38e4b97fbf1b45b4
	@Override
	public boolean insertSingleRecordIntoDb(Record record) {
		System.out.println("debug_Verèa_jdbcdao "+record.toString());
		DataSource ds = getDataSource();
		try (Connection con = ds.getConnection();
				PreparedStatement stmt = con.prepareStatement(INSERTSINGLERECORDINTODB)) {
			stmt.setString(1, record.getJmeno_autor());
			stmt.setString(2, record.getNazev_vylet());
			stmt.setInt(3, record.getIkony_urceni().getIkony_urceni());
			stmt.setInt(4, record.getIkony_vylet().getIkony_vylet());
			stmt.setString(5, record.getOdkaz_misto());
			stmt.setString(6, record.getOdkaz_restaurace());
			stmt.setInt(7, record.getHodnoceni());
			stmt.setString(8, record.getZapis());
			stmt.setString(9, record.getOkres());
			

			stmt.executeUpdate();
			con.commit();
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
<<<<<<< HEAD
		Record record = new Record();
		String jmeno_autor = null;
		String nazev_vylet = null;
		String zapis = null;
		String odkaz_misto = null;
		String odkaz_restaurace = null;
		int ikony_vylet = 0;
		int ikony_urceni = 0;
		String okres = null;
		int hodnoceni = 0;
		DataSource ds = getDataSource(); // volam metodu getDataSource
=======
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
>>>>>>> 5e7e023d1482729da077e6bd38e4b97fbf1b45b4
		try (Connection con = ds.getConnection(); PreparedStatement stmt = con.prepareStatement(LOADSINGLERECORD)) {
			stmt.setInt(1, id_zapis);
			ResultSet rs = stmt.executeQuery();
			rs.next();
<<<<<<< HEAD
			id_zapis = rs.getInt("id_zapis");
			jmeno_autor = rs.getString("jmeno_autor");
			nazev_vylet = rs.getString("nazev_vylet");
			zapis = rs.getString("zapis");
			odkaz_misto = rs.getString("odkaz_misto");
			odkaz_restaurace = rs.getString("odkaz_restaurace");
			ikony_vylet = rs.getInt("ikony_vylet");
			ikony_urceni = rs.getInt("ikony_urceni");
			okres = rs.getString("okres");
			hodnoceni = rs.getInt("hodnoceni");

=======
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
			
>>>>>>> 5e7e023d1482729da077e6bd38e4b97fbf1b45b4
		} catch (SQLException e) {
			e.printStackTrace();
		}
		record.setIdzapis(id_zapis);
		record.setJmeno_autor(jmeno_autor);
		record.setNazev_vylet(nazev_vylet);
		record.setZapis(zapis);
		record.setOdkaz_misto(odkaz_misto);
		record.setOdkaz_restaurace(odkaz_restaurace);
<<<<<<< HEAD

=======
		record.setIkony_urceni(ikony_urceni);
		record.setIkony_vylet(ikony_vylet);
>>>>>>> 5e7e023d1482729da077e6bd38e4b97fbf1b45b4
		record.setOkres(okres);
		record.setHodnoceni(hodnoceni);
		System.out.println(record.toString());
		return record;
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
