package com.iot1.sql.vendor.dto;

public class VendorInfo {
	private int viNum;
	private String viName;
	private String viDesc;
	private String viAddress;
	private int viPhone;
	private int viCredat;
	private int viCretim;
	public int getViNum() {
		return viNum;
	}
	public void setViNum(int viNum) {
		this.viNum = viNum;
	}
	public String getViName() {
		return viName;
	}
	public void setViName(String viName) {
		this.viName = viName;
	}
	public String getViDesc() {
		return viDesc;
	}
	public void setViDesc(String viDesc) {
		this.viDesc = viDesc;
	}
	public String getViAddress() {
		return viAddress;
	}
	public void setViAddress(String viAddress) {
		this.viAddress = viAddress;
	}
	public int getViPhone() {
		return viPhone;
	}
	public void setViPhone(int viPhone) {
		this.viPhone = viPhone;
	}
	public int getViCredat() {
		return viCredat;
	}
	public void setViCredat(int viCredat) {
		this.viCredat = viCredat;
	}
	public int getViCretim() {
		return viCretim;
	}
	public void setViCretim(int viCretim) {
		this.viCretim = viCretim;
	}
	@Override
	public String toString() {
		return "VendorInfo [viNum=" + viNum + ", viName=" + viName + ", viDesc=" + viDesc + ", viAddress=" + viAddress
				+ ", viPhone=" + viPhone + ", viCredat=" + viCredat + ", viCretim=" + viCretim + "]";
	}
	
	

}
