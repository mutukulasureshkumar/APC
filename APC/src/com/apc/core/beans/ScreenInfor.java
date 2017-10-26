/**
 * 
 */
package com.apc.core.beans;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Suresh Kumar Mutukula
 *
 */
public class ScreenInfor {
	
	private String packageName;
	private String screenName;
	private String screenTitle;
	private String screenDBTable;
	private List<FieldInfor> fieldsInfor;
	
	public ScreenInfor(){
		fieldsInfor=new ArrayList<FieldInfor>();
	}
	
	public String getPackageName() {
		return packageName;
	}
	public String getScreenName() {
		return screenName;
	}
	public String getScreenTitle() {
		return screenTitle;
	}
	public String getScreenDBTable() {
		return screenDBTable;
	}
	public List<FieldInfor> getFieldsInfor() {
		return fieldsInfor;
	}
	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}
	public void setScreenName(String screenName) {
		this.screenName = screenName;
	}
	public void setScreenTitle(String screenTitle) {
		this.screenTitle = screenTitle;
	}
	public void setScreenDBTable(String screenDBTable) {
		this.screenDBTable = screenDBTable;
	}
	public void setFieldsInfor(List<FieldInfor> fieldsInfor) {
		this.fieldsInfor = fieldsInfor;
	}
}
