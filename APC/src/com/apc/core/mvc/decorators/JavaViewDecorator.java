package com.apc.core.mvc.decorators;

import com.apc.core.beans.ProjectInfor;
import com.apc.core.classes.Constants;
import com.apc.core.classes.CreateProjectPackage;
import com.apc.core.exceptions.FileCreationException;
import com.apc.core.mvc.interfaces.IViewBehaviour;
import com.apc.core.mvc.java.viewclasses.CreateCSSFile;
import com.apc.core.mvc.java.viewclasses.CreateJSPFile;

/**
 * @author Suresh Kumar Mutukula
 *
 */
public class JavaViewDecorator implements IViewBehaviour {

	private ProjectInfor projectInfor;
	public JavaViewDecorator(ProjectInfor projectInfor) {
		this.projectInfor=projectInfor;
	}
	/* (non-Javadoc)
	 * @see com.apc.core.interfaces.IMVC#createFile(java.lang.String)
	 */
	@Override
	public void createFile() {
		try {
			CreateProjectPackage createPackage=new CreateProjectPackage(projectInfor);
			createPackage.createFile(CreateJSPFile.create(projectInfor), buildJSPPath(createPackage));
			createPackage.createFile(CreateCSSFile.create(projectInfor), buildCSSPath(createPackage));
		} catch (FileCreationException e) {
			e.printStackTrace();
		}
		
	}
	
	private String buildJSPPath(CreateProjectPackage createPackage){
		return createPackage.viewURL()+"/"+projectInfor.getScreenInfor().getScreenName()+Constants.JSPEXTENTION;
	}
	
	private String buildCSSPath(CreateProjectPackage createPackage){
		return createPackage.viewURL()+"/"+projectInfor.getScreenInfor().getScreenName()+Constants.CSSEXTENTION;
	}
	
	private String buildJSPath(CreateProjectPackage createPackage){
		return createPackage.viewURL()+"/"+projectInfor.getScreenInfor().getScreenName()+Constants.JSEXTENTION;
	}

}
