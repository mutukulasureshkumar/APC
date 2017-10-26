/**
 * 
 */
package com.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.apc.core.beans.ProjectInfor;
import com.apc.service.CreateProjectService;

/**
 * @author Suresh Kumar Mutukula
 *
 */
@Controller
public class ProjectMainController {

	@RequestMapping("/projectMain")
	public ModelAndView register() {
		ProjectInfor projectInfor=new ProjectInfor();
		projectInfor.setProjectType("NEW");
		projectInfor.getScreenInfor();
		ModelAndView mv = new ModelAndView("projectMain","command", projectInfor);
		return mv;
	}

	@RequestMapping(value = "/projectInfo", method = RequestMethod.POST)
	public ModelAndView createProject(@ModelAttribute("projectInfor") ProjectInfor projectInfor) {
		CreateProjectService.serve(projectInfor);
		ModelAndView mv=new ModelAndView("projectDetails");
		return mv;
	}

	@ModelAttribute("patternType")
	public List<String> patternsType() {
		List<String> patternType = new ArrayList<String>();
		patternType.add("JAVAMVC");
		patternType.add("SPRINGMVC");
		return patternType;
	}

	@ModelAttribute("technologyType")
	public List<String> technologyType() {
		List<String> technologyType = new ArrayList<String>();
		technologyType.add("JAVA");
		return technologyType;
	}

	@ModelAttribute("databaseType")
	public List<String> databaseType() {
		List<String> databaseType = new ArrayList<String>();
		databaseType.add("ORACLE");
		databaseType.add("MYSQL");
		return databaseType;
	}
	
	@ModelAttribute("webServerType")
	public List<String> webServerType() {
		List<String> webServerType = new ArrayList<String>();
		webServerType.add("TOMCAT");
		return webServerType;
	}
	
	@ModelAttribute("screenModes")
	public List<String> screenModes() {
		List<String> screenModes = new ArrayList<String>();
		screenModes.add("NEW");
		screenModes.add("FIND");
		screenModes.add("UPDATE");
		screenModes.add("DELETE");
		screenModes.add("NONE");
		return screenModes;
	}

	@ModelAttribute("screenFieldType")
	public List<String> screenFieldType() {
		List<String> screenFieldType = new ArrayList<String>();
		screenFieldType.add("TEXT");
		screenFieldType.add("PASSWORD");
		screenFieldType.add("TEXTAREA");
		screenFieldType.add("DROPDOWN");
		screenFieldType.add("RADIOBUTTON");
		screenFieldType.add("SELECT");
		return screenFieldType;
	}

}
