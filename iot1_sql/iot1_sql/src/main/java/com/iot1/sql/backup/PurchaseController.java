package com.iot1.sql.backup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iot.erp.purchase.dto.Pmi;
import com.iot.erp.purchase.dto.PurchaseManagement;
import com.iot.erp.purchase.service.PurchaseService;

@Controller
public class PurchaseController {
	
	@Autowired
	PurchaseService ps;
	
	@RequestMapping(value="/purchase/pmlist",method=RequestMethod.POST)
	public @ResponseBody List<PurchaseManagement> getPurchaseManagementList(@RequestBody PurchaseManagement pm ){
		return ps.getPurchaseManagementList(pm);
	}
	@RequestMapping(value="/purchase/pmlist",method=RequestMethod.GET)
	public String login(){
		return "purchase/pmlist";
	}
	
	@RequestMapping(value="/purchase/pmupdate",method=RequestMethod.GET)
	public String update(){
		return "purchase/pmupdate";
	}
	@RequestMapping(value="/purchase/pmupdate",method=RequestMethod.POST)
	public @ResponseBody List<Pmi> updatePurchaseManagementUpdateList(@RequestBody Pmi pmi ){
		return ps.getPurchaseManagementUpdateList(pmi);
		//pmi는 purchase_management,item_middle_client,item 3개가 같이있는 dto다.
	}
}
