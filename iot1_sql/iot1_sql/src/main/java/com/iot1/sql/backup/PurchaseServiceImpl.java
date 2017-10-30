package com.iot1.sql.backup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iot.erp.purchase.dao.PurchaseDAO;
import com.iot.erp.purchase.dto.Pmi;
import com.iot.erp.purchase.dto.PurchaseManagement;
@Service
public class PurchaseServiceImpl implements PurchaseService {
	
	@Autowired
	PurchaseDAO pDao;

	@Override
	public PurchaseManagement getPurchaseManagement(PurchaseManagement pm) {
		return pDao.selectPurchaseManagement(pm);
	}

	@Override
	public List<PurchaseManagement> getPurchaseManagementList(PurchaseManagement pm) {
		return pDao.selectPurchaseManagementList(pm);
	}

	@Override
	public List<Pmi> getPurchaseManagementUpdateList(Pmi pmi) {
		return pDao.selectPurchaseManagementUpdateList(pmi);
	}
	
	@Override
	public int insertPurchaseManagementList(PurchaseManagement[] pmList) {
		int result = 0;
		for(PurchaseManagement pm : pmList){
			result += pDao.insertPurchaseManagement(pm);
		}
		return result;
	}

	@Override
	public int insertPurchaseManagementList(PurchaseManagement pm) {
		return pDao.insertPurchaseManagement(pm);
	}

	@Override
	public int updatePurchaseManagementList(PurchaseManagement pm) {
		return pDao.updatePurchaseManagement(pm);
	}

	@Override
	public int deletePurchaseManagementList(PurchaseManagement pm) {
		return pDao.deletePurchaseManagement(pm);
	}

	
	
	

}
