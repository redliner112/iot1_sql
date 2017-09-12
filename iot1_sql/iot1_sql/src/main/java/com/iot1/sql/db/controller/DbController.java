package com.iot1.sql.db.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iot1.sql.db.dto.DbInfo;
import com.iot1.sql.db.service.DbService;

@Controller
public class DbController {
	@Autowired
	DbService ds;
	
	@RequestMapping(value="/db/list/tree",method=RequestMethod.POST)
	public @ResponseBody List<DbInfo> getGoodsInfoList(@RequestBody DbInfo di){
		return ds.getDbInfoList(di);
	}
}
