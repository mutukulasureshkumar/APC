package com.apc.core.classes;

import java.util.ArrayList;

import com.apc.core.interfaces.IMVC;
import com.apc.core.interfaces.Pattern;

/**
 * @author Suresh Kumar Mutukula
 *
 */
public class MVC implements Pattern{
	
	private ArrayList<IMVC> mvcFileList=new ArrayList<IMVC>();
	
	public void addFile(IMVC mvcFile){
		mvcFileList.add(mvcFile);
	}
	
	@Override
	public void prepareProject() {
		for(IMVC mvcFile:mvcFileList){
			mvcFile.createFile();
		}
	}
}
