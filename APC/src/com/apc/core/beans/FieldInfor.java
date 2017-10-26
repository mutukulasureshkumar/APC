/**
 * 
 */
package com.apc.core.beans;

/**
 * @author Suresh Kumar Mutukula
 *
 */
public class FieldInfor {
	private String fieldName;
	private int fieldLength;
	private String fieldDataType;
	private String fieldDBColumn;
	private String fieldReqInModes;
	private String fieldReadOnlyInModes;
	private String fieldType;
	private boolean isSearchable;
	
	public FieldInfor(){
		/*fieldReadOnlyInModes=new ArrayList<String>();
		fieldReqInModes=new ArrayList<String>();*/
	}
	
	public String getFieldName() {
		return fieldName;
	}
	public int getFieldLength() {
		return fieldLength;
	}
	public String getFieldDataType() {
		return fieldDataType;
	}
	public String getFieldDBColumn() {
		return fieldDBColumn;
	}
	public String getFieldReqInModes() {
		return fieldReqInModes;
	}
	public String getFieldReadOnlyInModes() {
		return fieldReadOnlyInModes;
	}
	public String getFieldType() {
		return fieldType;
	}
	public boolean isSearchable() {
		return isSearchable;
	}
	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}
	public void setFieldLength(int fieldLength) {
		this.fieldLength = fieldLength;
	}
	public void setFieldDataType(String fieldDataType) {
		this.fieldDataType = fieldDataType;
	}
	public void setFieldDBColumn(String fieldDBColumn) {
		this.fieldDBColumn = fieldDBColumn;
	}
	public void setFieldReqInModes(String fieldReqInModes) {
		this.fieldReqInModes = fieldReqInModes;
	}
	public void setFieldReadOnlyInModes(String fieldReadOnlyInModes) {
		this.fieldReadOnlyInModes = fieldReadOnlyInModes;
	}
	public void setFieldType(String fieldType) {
		this.fieldType = fieldType;
	}
	public void setSearchable(boolean isSearchable) {
		this.isSearchable = isSearchable;
	}
}
