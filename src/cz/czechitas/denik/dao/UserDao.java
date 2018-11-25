package cz.czechitas.denik.dao;

import cz.czechitas.denik.bean.Record;
import cz.czechitas.denik.bean.RecordList;

public interface UserDao {
	boolean insertSingleRecordIntoDb(Record record);

	RecordList loadAllRecordsFromDb();
	
	Record loadSingleRecord();
	
	

}


