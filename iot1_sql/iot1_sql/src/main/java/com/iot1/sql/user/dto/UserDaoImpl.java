package com.iot1.sql.user.dto;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.iot1.sql.user.dao.sql.UserDao;

@Repository
public class UserDaoImpl extends SqlSessionDaoSupport implements UserDao{
	//extends SqlSessionDaoSupport  뭐였지?


	@Override
	public UserInfo selectUser(UserInfo user) {
		return this.getSqlSession().selectOne("userinfo.SELECT_USER",user);
	}

	@Override
	public List<UserInfo> selectUserList(Map hm) {
		return this.getSqlSession().selectList("userinfo.SELECT_USER_LIST",hm);
	}
}
