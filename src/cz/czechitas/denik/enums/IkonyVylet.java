package cz.czechitas.denik.enums;

public enum IkonyVylet {
	HRAD(1), ZAMEK(2), ROZHLEDNA(3), LES(4), HORY(5);

	private final int ikony_urceni;

	private IkonyVylet(int ikony_vylet) {
		this.ikony_urceni = ikony_vylet;
	}

}