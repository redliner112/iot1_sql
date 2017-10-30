package com.iot1.sql.backup;

import java.util.List;

import com.iot.erp.purchase.dto.Pmi;
import com.iot.erp.purchase.dto.PurchaseManagement;

public interface PurchaseService {
	public PurchaseManagement getPurchaseManagement(PurchaseManagement pm);

	public List<PurchaseManagement> getPurchaseManagementList(PurchaseManagement pm);
	
	public List<Pmi> getPurchaseManagementUpdateList(Pmi pmi);
	
	public int insertPurchaseManagementList(PurchaseManagement[] pm);
	
	public int insertPurchaseManagementList(PurchaseManagement pm);
	
	public int updatePurchaseManagementList(PurchaseManagement pm);
	
	public int deletePurchaseManagementList(PurchaseManagement pm);
	

}
