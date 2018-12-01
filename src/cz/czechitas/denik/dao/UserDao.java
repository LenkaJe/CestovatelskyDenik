package cz.czechitas.denik.dao;

import cz.czechitas.denik.bean.Record;
import cz.czechitas.denik.bean.RecordList;
import cz.czechitas.denik.enums.IkonyUrceni;
import cz.czechitas.denik.enums.IkonyVylet;

public interface UserDao {
	boolean insertSingleRecordIntoDb(Record record);

	RecordList loadAllRecordsFromDb();
	
	Record loadSingleRecord(int id_zapis);
	
	RecordList loadFilteredRecord(String okres, IkonyVylet ikony_vylet, IkonyUrceni ikony_urceni, int hodnoceni);
	

}


