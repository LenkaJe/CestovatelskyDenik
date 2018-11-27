package cz.czechitas.denik.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cz.czechitas.denik.enums.IkonyUrceni;
import cz.czechitas.denik.enums.IkonyVylet;

public class InsertController {
	public void handle(HttpServletRequest request, HttpServletResponse response) {
		Integer idzapis = Integer.parseInt(request.getParameter("idzapis"));
		String nazev_vylet =  request.getParameter("nazev_vylet");
		String zapis =  request.getParameter("zapis");
		IkonyUrceni ikony_urceni = null;
		IkonyVylet ikony_vylet = null;
		String odkaz_misto = request.getParameter("odkaz_misto");
		String odkaz_restaurace = request.getParameter("odkaz_restaurace");
		Integer hodnoceni = Integer.parseInt(request.getParameter("hodnoceni"));;
	};
}
