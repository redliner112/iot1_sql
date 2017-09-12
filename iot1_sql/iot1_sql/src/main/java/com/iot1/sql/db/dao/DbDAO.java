package com.iot1.sql.db.dao;

import java.util.List;

import com.iot1.sql.db.dto.DbInfo;

public interface DbDAO {

	public List<DbInfo> selectDbInfoList(DbInfo di);
}
