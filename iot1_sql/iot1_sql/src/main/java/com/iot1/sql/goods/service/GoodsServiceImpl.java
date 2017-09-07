package com.iot1.sql.goods.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iot1.sql.goods.dao.GoodsDAO;
import com.iot1.sql.goods.dto.GoodsInfo;
@Service
public class GoodsServiceImpl  implements GoodsService{

	@Autowired
	GoodsDAO gDao;
	@Override
	public GoodsInfo getGoodsInfo(GoodsInfo gi) {
		return gDao.selectGoodsInfo(gi);
	}

	@Override
	public List<GoodsInfo> getGoodsInfoList(GoodsInfo gi) {
		return gDao.selectGoodsInfoList(gi);
	}

	@Override
	public int insertGoodsInfoList(GoodsInfo[] gi) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertGoodsInfo(GoodsInfo gi) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateGoodsInfo(GoodsInfo gi) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteGoodsInfo(GoodsInfo gi) {
		// TODO Auto-generated method stub
		return 0;
	}

}
