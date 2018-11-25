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
	private static final String LOADALLRECORDSFROMDB = "select idzapis,jmeno_autor,nazev_vylet,zapis, ikony_urceni,ikony_vylet,odkza_misto, odkaz_restaurace,longlat, hodnoceni from Zaznam_vyletu"; 

	@Override
	public boolean save(Record record) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public RecordList loadAllRecordsFromDb() {
		RecordList recordList = new RecordList();
		ArrayList<Record> listOfRecordsFromDb = new ArrayList<>();
		DataSource ds = getDataSource(); // volam metodu getDataSource - neni nadefinovana
		try (Connection con = ds.getConnection(); PreparedStatement stmt = con.prepareStatement(LOADALLRECORDSFROMDB)) {
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) { 
				Record record = new Record(rs.getInt("idzapis"), rs.getString("jmeno_autor"), rs.getString("nazev_vylet"), 
											rs.getString("zapis"), null, null, 
											rs.getString("odkaz_vylet"), rs.getString("odkaz_restaurace"), null, 
											rs.getInt("hodnoceni"));
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
			return (DataSource) ctx.lookup("java:/comp/env/jdbc/cestovatelskydenik"); //pro nas projekt java:/comp/env/jdbc/cestovatelskydenik
		} catch (NamingException e) {
			e.printStackTrace();
		}
		return null;
	};
}

