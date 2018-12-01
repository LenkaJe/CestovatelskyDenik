package cz.czechitas.denik.enums;

public enum IkonyUrceni {
	DEFAULT(0), PES(1), DITE(2), INVALIDA(3); 

	private final int ikony_urceni;

	private IkonyUrceni(int ikony_urceni) {
		this.ikony_urceni = ikony_urceni;
	}

	public int getIkony_urceni() {
		return ikony_urceni;
	}

	
}
