package cz.czechitas.denik.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cz.czechitas.denik.bean.Record;
import cz.czechitas.denik.dao.JdbcDao;
import cz.czechitas.denik.enums.IkonyUrceni;
import cz.czechitas.denik.enums.IkonyVylet;

public class InsertController {
	public void handle(HttpServletRequest request, HttpServletResponse response) {
		Record recordToInsertDb = new Record();
		System.out.println("debug_Ver�a 1za�atek controller");
		//recordToInsertDb.setIdzapis(Integer.parseInt(request.getParameter("id_zapis")));
		recordToInsertDb.setNazev_vylet(request.getParameter("nazev_vylet"));
		recordToInsertDb.setJmeno_autor(request.getParameter("jmeno_autor"));
		recordToInsertDb.setZapis(request.getParameter("zapis"));
		recordToInsertDb.setOdkaz_misto(request.getParameter("odkaz_misto"));
		recordToInsertDb.setOdkaz_restaurace(request.getParameter("odkaz_restaurace"));
		recordToInsertDb.setHodnoceni(Integer.parseInt(request.getParameter("hodnoceni")));
		if(request.getParameter("ikona_urceni") == null) {
			recordToInsertDb.setIkony_urceni(IkonyUrceni.DEFAULT);
		} else {
			recordToInsertDb.setIkony_urceni(IkonyUrceni.valueOf(request.getParameter("ikona_urceni").toUpperCase()));
		}
		if(request.getParameter("ikona_vylet") == null) {
			recordToInsertDb.setIkony_vylet(IkonyVylet.DEFAULT);
		} else { recordToInsertDb.setIkony_vylet(IkonyVylet.valueOf(request.getParameter("ikona_vylet").toUpperCase()));
		}
		recordToInsertDb.setOkres(request.getParameter("okres"));
		System.out.println(recordToInsertDb);
		JdbcDao jdbcDao = new JdbcDao();
		jdbcDao.insertSingleRecordIntoDb(recordToInsertDb);
		System.out.println("debug_Ver�a insert controller");
	
	};
}
