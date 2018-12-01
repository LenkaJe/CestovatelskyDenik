package cz.czechitas.denik.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cz.czechitas.denik.dao.JdbcDao;
import cz.czechitas.denik.dao.UserDao;
import cz.czechitas.denik.enums.IkonyUrceni;
import cz.czechitas.denik.enums.IkonyVylet;

public class FilterController {
	private UserDao Dao = new JdbcDao();
	public void handle(HttpServletRequest request, HttpServletResponse response) {
		String okres = request.getParameter("okres");
		System.out.println("Lenka:"+ request.getParameter("ikony_vylet"));
		IkonyVylet ikony_vylet = IkonyVylet.valueOf(request.getParameter("ikony_vylet").toUpperCase());
		System.out.println("Lenka:"+ request.getParameter("ikony_urceni"));
		IkonyUrceni ikony_urceni = IkonyUrceni.valueOf(request.getParameter("ikony_urceni").toUpperCase());
		int hodnoceni = (Integer.parseInt(request.getParameter("hodnoceni")));
		
		request.setAttribute("recordList", Dao.loadFilteredRecord(okres, ikony_vylet, ikony_urceni, hodnoceni));

	};
	
	};

