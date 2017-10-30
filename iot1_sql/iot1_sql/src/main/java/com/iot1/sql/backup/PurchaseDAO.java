package com.iot1.sql.backup;

import java.util.List;

import com.iot.erp.purchase.dto.Pmi;
import com.iot.erp.purchase.dto.PurchaseManagement;

public interface PurchaseDAO {
	
	public PurchaseManagement selectPurchaseManagement(PurchaseManagement pm);
	
	public List<PurchaseManagement> selectPurchaseManagementList(PurchaseManagement pm);
	
	public List<Pmi> selectPurchaseManagementUpdateList(Pmi pmi);
	
	public int  insertPurchaseManagement(PurchaseManagement pm);
	
	public int  updatePurchaseManagement(PurchaseManagement pm);
	
	public int deletePurchaseManagement(PurchaseManagement pm);
}
