package com.iot1.sql.db.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iot1.sql.db.dao.DbDAO;
import com.iot1.sql.db.dto.DbInfo;
@Service
public class DbServiceImpl implements DbService {

	@Autowired
	DbDAO dDao;
	@Override
	public List<DbInfo> getDbInfoList(DbInfo di) {
		return dDao.selectDbInfoList(di);
	}

}
