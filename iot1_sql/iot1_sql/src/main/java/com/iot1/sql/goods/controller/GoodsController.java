package com.iot1.sql.goods.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iot1.sql.goods.dto.GoodsInfo;
import com.iot1.sql.goods.service.GoodsService;
import com.iot1.sql.goods.service.GoodsServiceImpl;

@Controller
public class GoodsController {
	@Autowired
	GoodsService gs;
	@RequestMapping(value="/goods/list",method=RequestMethod.POST)
	public @ResponseBody List<GoodsInfo> getGoodsInfoList(GoodsInfo gi){
		//@RequestBody 화면에서 주는값
		//@ResponseBody 내가 service에서 받은 값을 화면으로 던저주는것. pom.xml의 jackson과 연동되서 json형태로 주고받는다.
		return gs.getGoodsInfoList(gi);
	}
}
