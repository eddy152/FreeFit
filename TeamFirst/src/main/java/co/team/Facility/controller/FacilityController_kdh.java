package co.team.Facility.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.team.Facility.service.impl.FacilityMapper_kdh;

@Controller
public class FacilityController_kdh {
	
	@Autowired FacilityMapper_kdh service;
	
	@RequestMapping("/getSearchFacility")
	public String getSearchFacility(Model model) {
		model.addAttribute("list", service.getSearchFacility());
		return "program/Facility/facilityList";
	}
	
}
