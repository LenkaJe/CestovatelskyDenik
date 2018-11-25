package cz.czechitas.denik.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cz.czechitas.denik.dao.JdbcDao;
import cz.czechitas.denik.dao.UserDao;


public class ListController {
	private UserDao Dao = new JdbcDao();
	public void handle(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("recordList", Dao.loadAllRecordsFromDb());
	};

}

