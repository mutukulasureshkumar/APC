/**
 * 
 */
package com.apc.core.beans;

/**
 * @author Suresh Kumar Mutukula
 *
 */
public class ProjectInfor {
	
	private String projectType;
	private String projectName;
	private String patternType;
	private String technologyType;
	private String databaseType;
	private String databaseURL;
	private String databaseUserName;
	private String databasePassword;
	private String webServerType;
	private ScreenInfor screenInfor;


	public ProjectInfor(){
		screenInfor=new ScreenInfor();	
	}
	
	public String getProjectType() {
		return projectType;
	}

	/**
	 * @return the projectName
	 */
	public String getProjectName() {
		return projectName;
	}

	/**
	 * @param projectName the projectName to set
	 */
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getPatternType() {
		return patternType;
	}

	public String getTechnologyType() {
		return technologyType;
	}

	public String getDatabaseType() {
		return databaseType;
	}

	public void setProjectType(String projectType) {
		this.projectType = projectType;
	}

	public void setPatternType(String patternType) {
		this.patternType = patternType;
	}

	public void setTechnologyType(String technologyType) {
		this.technologyType = technologyType;
	}

	public void setDatabaseType(String databaseType) {
		this.databaseType = databaseType;
	}

	public String getDatabaseURL() {
		return databaseURL;
	}
	public String getDatabaseUserName() {
		return databaseUserName;
	}
	public String getDatabasePassword() {
		return databasePassword;
	}
	public ScreenInfor getScreenInfor() {
		return screenInfor;
	}
	public void setDatabaseURL(String databaseURL) {
		this.databaseURL = databaseURL;
	}
	public void setDatabaseUserName(String databaseUserName) {
		this.databaseUserName = databaseUserName;
	}
	public void setDatabasePassword(String databasePassword) {
		this.databasePassword = databasePassword;
	}
	/**
	 * @return the webServerType
	 */
	public String getWebServerType() {
		return webServerType;
	}

	/**
	 * @param webServerType the webServerType to set
	 */
	public void setWebServerType(String webServerType) {
		this.webServerType = webServerType;
	}

	public void setScreenInfor(ScreenInfor screenInfor) {
		this.screenInfor = screenInfor;
	}
}