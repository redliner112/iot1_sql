package com.iot1.sql.db.dto;

public class Column {

	private String columnName;
	private String dataType;
	private String charactermaximumLength;
	private String isNullable;
	public String getColumnName() {
		return columnName;
	}
	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}
	public String getDataType() {
		return dataType;
	}
	public void setDataType(String dataType) {
		this.dataType = dataType;
	}
	public String getCharactermaximumLength() {
		return charactermaximumLength;
	}
	public void setCharactermaximumLength(String charactermaximumLength) {
		this.charactermaximumLength = charactermaximumLength;
	}
	public String getIsNullable() {
		return isNullable;
	}
	public void setIsNullable(String isNullable) {
		this.isNullable = isNullable;
	}
	@Override
	public String toString() {
		return "Column [columnName=" + columnName + ", dataType=" + dataType + ", charactermaximumLength="
				+ charactermaximumLength + ", isNullable=" + isNullable + "]";
	}
	
	
}
