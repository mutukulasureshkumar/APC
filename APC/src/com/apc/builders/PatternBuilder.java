package com.apc.builders;

import com.apc.core.beans.ProjectInfor;
import com.apc.core.classes.Constants;
import com.apc.core.classes.MVC;
import com.apc.core.interfaces.Pattern;
import com.apc.core.mvc.decorators.JavaViewDecorator;

/**
 * @author Suresh Kumar Mutukula
 *
 */
public class PatternBuilder {
	
	/**
	 * @Description Decides the project architecture and calls the appropriate method.
	 * @param projectInformation
	 * @return Pattern
	 */
	public static Pattern build(ProjectInfor projectInformation){
		Pattern pattern=null;
		if(Constants.JAVA.equals(projectInformation.getTechnologyType()))
			pattern=buildJavaMVC(projectInformation);
		
		return pattern;
	}
	
	/**
	 * @Description Creates the Java project with MVC architecture.
	 * @param projectInformation
	 * @return Pattern
	 */
	public static Pattern buildJavaMVC(ProjectInfor projectInfor){
		MVC mvc = new MVC();
		mvc.addFile(new JavaViewDecorator(projectInfor));
		return mvc;	
	}
}
