package com.iot1.sql.backup;
//PurchaseManagement,item,item_middle_client3개를 합친 dto
//pm과 imc는 imcno로 item과 imc는 itemcode로 연결되어있음.
public class Pmi {
	//PurchaseManagement,
	private String orderDate;
	private int clientNo;
	private int managerNo;
	private int warehouseNo;
	private int purchaseNo;
	private int itemNo;
	//item
	private String itemName;
	private int warehouSingCost;
	//imc
	private int quantity;
	private int amount;
	//PurchaseManagement,
	private int createUser;
	private String createDate;
	private int modifiedUser;
	private String modifiedData;
	
	
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public int getClientNo() {
		return clientNo;
	}
	public void setClientNo(int clientNo) {
		this.clientNo = clientNo;
	}
	public int getManagerNo() {
		return managerNo;
	}
	public void setManagerNo(int managerNo) {
		this.managerNo = managerNo;
	}
	public int getWarehouseNo() {
		return warehouseNo;
	}
	public void setWarehouseNo(int warehouseNo) {
		this.warehouseNo = warehouseNo;
	}
	public int getPurchaseNo() {
		return purchaseNo;
	}
	public void setPurchaseNo(int purchaseNo) {
		this.purchaseNo = purchaseNo;
	}
	public int getItemNo() {
		return itemNo;
	}
	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}
	public int getCreateUser() {
		return createUser;
	}
	public void setCreateUser(int createUser) {
		this.createUser = createUser;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public int getModifiedUser() {
		return modifiedUser;
	}
	public void setModifiedUser(int modifiedUser) {
		this.modifiedUser = modifiedUser;
	}
	public String getModifiedData() {
		return modifiedData;
	}
	public void setModifiedData(String modifiedData) {
		this.modifiedData = modifiedData;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public int getWarehouSingCost() {
		return warehouSingCost;
	}
	public void setWarehouSingCost(int warehouSingCost) {
		this.warehouSingCost = warehouSingCost;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "Pmi [orderDate=" + orderDate + ", clientNo=" + clientNo + ", managerNo=" + managerNo + ", warehouseNo="
				+ warehouseNo + ", purchaseNo=" + purchaseNo + ", itemNo=" + itemNo + ", createUser=" + createUser
				+ ", createDate=" + createDate + ", modifiedUser=" + modifiedUser + ", modifiedData=" + modifiedData
				+ ", itemName=" + itemName + ", warehouSingCost=" + warehouSingCost + ", quantity=" + quantity
				+ ", amount=" + amount + "]";
	}
	
	

}
