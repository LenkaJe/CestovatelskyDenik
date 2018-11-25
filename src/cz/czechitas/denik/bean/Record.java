package cz.czechitas.denik.bean;

import cz.czechitas.denik.enums.IkonyUrceni;
import cz.czechitas.denik.enums.IkonyVylet;

public class Record {

	private String idzapis;
	private String jmeno_autor;
	private String nazev_vylet;
	private String zapis;
	private IkonyUrceni ikony_urceni;
	private IkonyVylet ikony_vylet;
	private String odkaz_misto;
	private String odkaz_restaurace;
	private Double longlat;
	private Integer hodnoceni;
	public String getIdzapis() {
		return idzapis;
	}
	public void setIdzapis(String idzapis) {
		this.idzapis = idzapis;
	}
	public String getJmeno_autor() {
		return jmeno_autor;
	}
	public void setJmeno_autor(String jmeno_autor) {
		this.jmeno_autor = jmeno_autor;
	}
	public String getNazev_vylet() {
		return nazev_vylet;
	}
	public void setNazev_vylet(String nazev_vylet) {
		this.nazev_vylet = nazev_vylet;
	}
	public String getZapis() {
		return zapis;
	}
	public void setZapis(String zapis) {
		this.zapis = zapis;
	}
	public IkonyUrceni getIkony_urceni() {
		return ikony_urceni;
	}
	public void setIkony_urceni(IkonyUrceni ikony_urceni) {
		this.ikony_urceni = ikony_urceni;
	}
	public IkonyVylet getIkony_vylet() {
		return ikony_vylet;
	}
	public void setIkony_vylet(IkonyVylet ikony_vylet) {
		this.ikony_vylet = ikony_vylet;
	}
	public String getOdkaz_misto() {
		return odkaz_misto;
	}
	public void setOdkaz_misto(String odkaz_misto) {
		this.odkaz_misto = odkaz_misto;
	}
	public String getOdkaz_restaurace() {
		return odkaz_restaurace;
	}
	public void setOdkaz_restaurace(String odkaz_restaurace) {
		this.odkaz_restaurace = odkaz_restaurace;
	}
	public Double getLonglat() {
		return longlat;
	}
	public void setLonglat(Double longlat) {
		this.longlat = longlat;
	}
	public Integer getHodnoceni() {
		return hodnoceni;
	}
	public void setHodnoceni(Integer hodnoceni) {
		this.hodnoceni = hodnoceni;
	}
	
	
	
	
	
	
	
	
}
