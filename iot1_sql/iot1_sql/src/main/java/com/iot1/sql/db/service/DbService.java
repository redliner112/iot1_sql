package com.iot1.sql.db.service;

import java.util.List;

import com.iot1.sql.db.dto.DbInfo;

public interface DbService {
	public List<DbInfo> getDbInfoList(DbInfo di);

}
