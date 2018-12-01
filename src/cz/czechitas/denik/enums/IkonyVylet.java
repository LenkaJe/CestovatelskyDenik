package cz.czechitas.denik.enums;

public enum IkonyVylet {
	DEFAULT(0), HRAD(1), KOSTEL(2), ROZHLEDNA(3), LES(4), HORY(5), MESTO(6);

	private final int ikony_vylet;

	private IkonyVylet(int ikony_vylet) {
		this.ikony_vylet = ikony_vylet;
	}

	public int getIkony_vylet() {
		return ikony_vylet;
	}

}