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

public class JdbcDao implements UserDao {
	private static final String LOADALLRECORDSFROMDB = "select id_zapis,jmeno_autor,nazev_vylet,zapis,"
			+ " ikony_urceni,ikony_vylet,odkaz_misto, odkaz_restaurace, hodnoceni, okres from cestovatelskydenik.Zaznam_vyletu";
	private static final String INSERTSINGLERECORDINTODB = "INSERT INTO Zaznam_vyletu (id_zapis,jmeno_autor,nazev_vylet,zapis, "
			+ "ikony_urceni,ikony_vylet,odkaz_misto, odkaz_restaurace,longlat, hodnoceni from Zaznam_vyletu) "
			+ "VALUE (?,?,?,?,?,?,?,?,?,?)";
	
	@Override
	public boolean insertSingleRecordIntoDb(Record record) {

		DataSource ds = getDataSource();
		try (Connection con = ds.getConnection(); PreparedStatement stmt = con.prepareStatement(INSERTSINGLERECORDINTODB)) {
			stmt.setString(1, record.getJmeno_autor());
			stmt.setString(2, record.getNazev_vylet());
			stmt.setInt(3, record.getIkony_urceni().getIkony_urceni());
			stmt.setInt(4, record.getIkony_vylet().getIkony_vylet());
			stmt.setString(5, record.getOdkaz_misto());
			stmt.setString(6, record.getOdkaz_restaurace()); 
			stmt.setInt(7, record.getHodnoceni());

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
						rs.getString("nazev_vylet"), rs.getString("zapis"), null , null, rs.getString("odkaz_misto"),
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
	public Record loadSingleRecord() {
		// TODO Auto-generated method stub
		return null;
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
