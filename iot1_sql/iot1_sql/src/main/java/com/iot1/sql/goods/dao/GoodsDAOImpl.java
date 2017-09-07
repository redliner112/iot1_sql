package com.iot1.sql.goods.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.iot1.sql.goods.dto.GoodsInfo;

@Repository
public class  GoodsDAOImpl extends SqlSessionDaoSupport implements GoodsDAO{

	@Override
	public GoodsInfo selectGoodsInfo(GoodsInfo gi) {
		return this.getSqlSession().selectOne("goods.SELECT_GOODS",gi);
		//sql의 goods.SELECT_GOODS란 키값에 gi라는 sql쿼리문을 value로 가지고있다.
	}

	@Override
	public List<GoodsInfo> selectGoodsInfoList(GoodsInfo gi) {
		return this.getSqlSession().selectList("goods.SELECT_GOODS",gi);
	}
	
	@Override
	public int insertGoodsInfo(GoodsInfo gi) {
		return this.getSqlSession().selectList("goods.INSERT_GOODS",gi);
	}
}
