/**
 * 
 */
package com.apc.core.classes;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.apc.core.beans.ProjectInfor;

/**
 * @author Suresh Kumar Mutukula
 *
 */
public class CreateProjectPackage {
	
	private String baseURL=null;
	private String tomcatWEBXMLPath=null;
	private String tomcatClassesPath=null;
	
	
	public CreateProjectPackage(ProjectInfor projectInfor){
		if(Constants.TOMCAT.equals(projectInfor.getWebServerType()))
			createTomcatStructure(projectInfor);
	}
	
	public String viewURL(){
		return baseURL;
	}
	
	public String ModelURL(){
		return baseURL+"/WEB-INF/classes";
	}
	
	public FileWriter createFile(StringBuffer buffer, String fileLocation){
		FileWriter fileWriter = null;
		try{
			File file=new File(fileLocation);
			if(!file.exists())
				file.createNewFile();
			fileWriter = new FileWriter(fileLocation);
			fileWriter.write(buffer.toString());
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				fileWriter.flush();
				fileWriter.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return fileWriter;
	}
	
	public void createTomcatStructure(ProjectInfor projectInfor){
		InputStreamReader isr = null;
		BufferedReader reader = null;
		BufferedWriter out = null;
		FileWriter fw = null;
		try{
			baseURL=Constants.TOMCATBASELOCATION+projectInfor.getProjectName();
			setTomcatClassesPath(baseURL+"/WEB-INF/classes");
			setTomcatWEBXMLPath(baseURL+"/WEB-INF/web.xml");
			Path path=Paths.get(baseURL);
			if(!Files.exists(path)){
				path=Paths.get(getTomcatClassesPath());
				Files.createDirectories(path);
				isr = new InputStreamReader(Thread.currentThread().getContextClassLoader().getResourceAsStream("WEB_XML_TEMPLATE"));
		        reader = new BufferedReader(isr);
				String line = "", oldtext = "";
				while((line = reader.readLine()) != null)
				{
					oldtext += line + "\r\n";
				}
				File f1=new File(getTomcatWEBXMLPath());
				fw = new FileWriter(f1);
	            out = new BufferedWriter(fw);
	            out.write(oldtext);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				
				if(out != null){
					out.close();
					fw.close();
					reader.close();
					isr.close();
				}

			} catch (IOException e) {
			}
		}
	}
	
	public void createModifyWEBXML(ProjectInfor projectInfor){
		
		try {
            File f1 = new File(getTomcatWEBXMLPath());
            FileReader fr = new FileReader(f1);
            BufferedReader br = new BufferedReader(fr);
            String line=null;    List<String> lines = new ArrayList<String>();
            String rplaceString="<servlet>\n <servlet-name>"+projectInfor.getScreenInfor().getScreenName()+"</servlet-name>\n"
            		+ "<servlet-class>"+projectInfor.getScreenInfor().getPackageName()+projectInfor.getScreenInfor().getScreenName()+"</servlet-class>\n</servlet>\n"
            		+ "<servlet-mapping>\n <servlet-name>"+projectInfor.getScreenInfor().getScreenName()+"</servlet-name>\n <url-pattern></url-pattern>"+projectInfor.getScreenInfor().getScreenName()+"</servlet-mapping>";
            while ((line = br.readLine()) != null) {
                if (line.contains("</web-app>"))
                    line = line.replace("</web-app>", rplaceString);
                lines.add(line);
            }
            fr.close();
            br.close();

            FileWriter fw = new FileWriter(f1);
            BufferedWriter out = new BufferedWriter(fw);
            for(String s : lines)
                 out.write(s);
            out.flush();
            out.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
		
	}

	/**
	 * @return the tomcatClassesPath
	 */
	public String getTomcatClassesPath() {
		return tomcatClassesPath;
	}

	/**
	 * @param tomcatClassesPath the tomcatClassesPath to set
	 */
	public void setTomcatClassesPath(String tomcatClassesPath) {
		this.tomcatClassesPath = tomcatClassesPath;
	}

	/**
	 * @return the tomcatWEBXMLPath
	 */
	public String getTomcatWEBXMLPath() {
		return tomcatWEBXMLPath;
	}

	/**
	 * @param tomcatWEBXMLPath the tomcatWEBXMLPath to set
	 */
	public void setTomcatWEBXMLPath(String tomcatWEBXMLPath) {
		this.tomcatWEBXMLPath = tomcatWEBXMLPath;
	}

	

}
