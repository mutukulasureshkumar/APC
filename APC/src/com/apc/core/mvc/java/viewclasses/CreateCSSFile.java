package com.apc.core.mvc.java.viewclasses;

import com.apc.core.beans.ProjectInfor;
import com.apc.core.exceptions.FileCreationException;

/**
 * @author Suresh Kumar Mutukula
 *
 */
public class CreateCSSFile {

	/**
	 * @return
	 * @throws FileCreationException
	 */
	public static StringBuffer create(ProjectInfor projectInfor) throws FileCreationException{
		StringBuffer cssBuffer = null;
		try{
			cssBuffer=new StringBuffer();
			//cssBuffer.append("CSS File Created..!!!");
			System.out.println("CSS File Created..!!!");

		}catch (Exception e) {
			throw new FileCreationException("CSS File");
		}finally{
		}
		return cssBuffer;
	}
}
