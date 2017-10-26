package com.apc.core.mvc.java.viewclasses;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import com.apc.core.beans.FieldInfor;
import com.apc.core.beans.ProjectInfor;
import com.apc.core.classes.Constants;
import com.apc.core.classes.CreateProjectPackage;
import com.apc.core.exceptions.FileCreationException;

/**
 * @author Suresh Kumar Mutukula
 *
 */
public class CreateJSPFile {

	public static StringBuffer create(ProjectInfor projectInfor) throws FileCreationException {
		StringBuffer jspBuffer = null;
		InputStreamReader isr = null;
		BufferedReader reader = null;
		BufferedWriter out = null;
		FileWriter fw = null;
		try {
			jspBuffer = new StringBuffer();
			projectInfor.getDatabaseType();
			CreateProjectPackage cp = new CreateProjectPackage(projectInfor);
			isr = new InputStreamReader(
					Thread.currentThread().getContextClassLoader().getResourceAsStream("JSP_TEMPLATE"));
			reader = new BufferedReader(isr);
			String line = "";
			while ((line = reader.readLine()) != null) {
				if (line.contains("<<Form>>"))
					line = line.replace("<<Form>>", getReplaceString(projectInfor));
				if (line.contains("<<Title>>"))
					line = line.replace("<<Title>>", projectInfor.getScreenInfor().getScreenTitle());
				jspBuffer.append(line + "\r\n");
			}
			System.out.println("JSP File Created..!!!");
		} catch (Exception e) {
			throw new FileCreationException("JSP File");
		} finally {
			if(out != null){
				try {
					out.close();
					reader.close();
					isr.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return jspBuffer;
	}

	/**
	 * @return
	 */
	private static String getReplaceString(ProjectInfor projectInfor) {
		StringBuffer sb = new StringBuffer();
		int count = 1;
		try {
			sb.append("<Form method=\"POST\" action=\"" + projectInfor.getScreenInfor().getScreenName() + "\">\n\t");
			for (FieldInfor fieldInfo : projectInfor.getScreenInfor().getFieldsInfor()) {
				sb.append("<input size=" + fieldInfo.getFieldLength() + " type=\"" + fieldInfo.getFieldType() + "\" "
						+ "id=\"\" name=\"" + fieldInfo.getFieldName() + "\"  tabindex=" + count + " maxlength="
						+ fieldInfo.getFieldLength() + "/>\n\t");
				count++;
			}
			sb.append("\n</Form>");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sb.toString();
	}

	public void buildJSPForm(ProjectInfor projectInfor) {

	}

}
