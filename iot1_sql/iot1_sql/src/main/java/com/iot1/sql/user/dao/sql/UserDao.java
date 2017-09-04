package com.iot1.sql.user.dao.sql;

import java.util.List;
import java.util.Map;

import com.iot1.sql.user.dto.UserInfo;

public interface UserDao {

	UserInfo selectUser(UserInfo user);
	List<UserInfo> selectUserList(Map hm);
}
