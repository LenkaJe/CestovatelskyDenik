package cz.czechitas.denik.bean;

import java.util.ArrayList;

public class RecordList {
private ArrayList <Record> listOfRecordsFromDb;

public ArrayList <Record> getListOfRecordsFromDb() {
	return listOfRecordsFromDb;
}

public void setListOfRecordsFromDb(ArrayList <Record> listOfRecordsFromDb) {
	this.listOfRecordsFromDb = listOfRecordsFromDb;
}

}
