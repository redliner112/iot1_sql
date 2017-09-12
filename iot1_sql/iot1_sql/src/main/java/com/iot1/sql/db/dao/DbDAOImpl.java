package com.iot1.sql.db.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iot1.sql.common.controller.DataSourceFactory;
import com.iot1.sql.db.dto.DbInfo;
@Repository
public class DbDAOImpl extends SqlSessionDaoSupport implements DbDAO{
	@Autowired
	DataSourceFactory dsf;
	@Override
	public List<DbInfo> selectDbInfoList(DbInfo di) {
		// TODO Auto-generated method stub
		return null;
		여기까지함.
	}

}
