package com.iot1.sql.backup;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Service;

import com.iot.erp.purchase.dto.Pmi;
import com.iot.erp.purchase.dto.PurchaseManagement;

@Service
public class PurchaseDAOImpl extends SqlSessionDaoSupport implements PurchaseDAO{

	@Override
	public PurchaseManagement selectPurchaseManagement(PurchaseManagement pm) {
		return this.getSqlSession().selectOne("purchase.SELECT_PURCHASE",pm);
	}

	@Override
	public List<PurchaseManagement> selectPurchaseManagementList(PurchaseManagement pm) {
		return this.getSqlSession().selectList("purchase.SELECT_PURCHASE",pm);
	}
	
	@Override
	public List<Pmi> selectPurchaseManagementUpdateList(Pmi pmi) {
		return this.getSqlSession().selectList("purchase.UPDATELIST_PURCHASE",pmi);
	}
	
	@Override
	public int insertPurchaseManagement(PurchaseManagement pm) {
		return this.getSqlSession().insert("purchase.INSERT_PURCHASE",pm);
	}

	@Override
	public int updatePurchaseManagement(PurchaseManagement pm) {
		return this.getSqlSession().update("purchase.UPDATE_PURCHASE",pm);
	}

	@Override
	public int deletePurchaseManagement(PurchaseManagement pm) {
		return this.getSqlSession().delete("purchase.DELETE_PURCHASE",pm);
	}

	

}
