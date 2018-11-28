package cz.czechitas.denik.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cz.czechitas.denik.dao.JdbcDao;
import cz.czechitas.denik.dao.UserDao;

public class DetailController {
	private UserDao Dao = new JdbcDao();
	public void handle(HttpServletRequest request, HttpServletResponse response) {
		int id_zapis = Integer.parseInt(request.getParameter("id_zapis"));
		request.setAttribute("record", Dao.loadSingleRecord(id_zapis));
	};

}



