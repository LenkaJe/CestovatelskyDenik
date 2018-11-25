package cz.czechitas.denik.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cz.czechitas.denik.enums.IkonyUrceni;
import cz.czechitas.denik.enums.IkonyVylet;

public class InsertController {
	public void handle(HttpServletRequest request, HttpServletResponse response) {
		Integer idzapis = Integer.parseInt(request.getParameter("idzapis"));
		String nazev_vylet = String request.getParameter("nazev_vylet");
		String zapis = String request.getParameter("zapis");
		IkonyUrceni ikony_urceni;
		IkonyVylet ikony_vylet;
		String odkaz_misto;
		String odkaz_restaurace;
		Double longlat;
		Integer hodnoceni;
	};
}
