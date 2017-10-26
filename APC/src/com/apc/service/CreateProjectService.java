package com.apc.service;

import com.apc.builders.PatternBuilder;
import com.apc.core.beans.ProjectInfor;
import com.apc.core.interfaces.Pattern;

/**
 * @author Suresh Kumar Mutukula
 *
 */
public class CreateProjectService {
	
	public static void serve(ProjectInfor projectInfor){
		Pattern pattern=PatternBuilder.build(projectInfor);
		pattern.prepareProject();
	}
}
