package com.ggiri.root.help.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ggiri.root.help.dto.GgiriHelpDTO;
import com.ggiri.root.help.service.GgiriHelpService;
import com.ggiri.root.member.dto.GgiriMemberDTO;
import com.ggiri.root.member.service.GgiriService;
import com.ggiri.root.project.service.ProjectService;
import com.ggiri.root.session.login.GgiriMemberSession;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("ggiriHelp")
public class GgiriHelpController implements GgiriMemberSession{
	
	@Autowired
	private GgiriHelpService ghs;
	@Autowired
	private ProjectService ps;
	@Autowired
	private GgiriService gs;
	
	
	@GetMapping("helpList")
	public String AllList(Model model) {
		ghs.HelpList(model);
		gs.ggiriMemberInfo(LOGIN, model);
		
		return "ggiriHelp/helpList";
	}
	
	@GetMapping("helpWrite")
	public String helpWriter(HttpSession session, Model model) {
		
		if(session.getAttribute(LOGIN) != null) {
			String id = (String)session.getAttribute(LOGIN);
			gs.ggiriMemberInfo(id, model);
			return "ggiriHelp/helpWrite";
		} else if(session.getAttribute("kakaoMember") != null){
			GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("kakaoMember");
			gs.ggiriSnsInfo(dto.getId(), model);
			return "ggiriHelp/helpWrite";
		} else if(session.getAttribute("naverMember") != null){
			GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("naverMember");
			gs.ggiriSnsInfo(dto.getId(), model);
			return "ggiriHelp/helpWrite";
		} else if(session.getAttribute("googleMember") != null){
			GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("googleMember");
			gs.ggiriSnsInfo(dto.getId(), model);
			return "ggiriHelp/helpWrite";
		}
		return "ggiriHelp/helpWrite";
	}
	
	@GetMapping("helpWriteFail")
	public String helpWriteFail() {
		return "ggiriHelp/helpWriteFail";
	}
	@GetMapping("helpWriteSuccess")
	public String helpWriteSuccess() {
		return "ggiriHelp/helpWriteSuccess";
	}
	
	@RequestMapping("writeSave")
	public String helWrite(GgiriHelpDTO dto) {
		
		int result = ghs.helpWrite(dto);
		if(result == 1) {
			return "redirect:helpList";
		}
		return "ggiriHelp/helpWriteFail";
	}
	
	@GetMapping("helpView")
	public String helpView(@RequestParam("helpNo") int helpNo, Model model, HttpSession session) throws Exception  {
		
		if(session.getAttribute(LOGIN) != null) {
			String id = (String)session.getAttribute(LOGIN);
			gs.ggiriMemberInfo(id, model);			
			ghs.helpView(helpNo, model);
	        return "ggiriHelp/helpView";
		} else if(session.getAttribute("kakaoMember") != null){
			GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("kakaoMember");
			ghs.helpView(helpNo, model);
			gs.ggiriSnsInfo(dto.getId(), model);
	        return "ggiriHelp/helpView";
		} else if(session.getAttribute("naverMember") != null){
			GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("naverMember");
			ghs.helpView(helpNo, model);
			gs.ggiriSnsInfo(dto.getId(), model);
	        return "ggiriHelp/helpView";
		} else if(session.getAttribute("googleMember") != null){
			GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("googleMember");
			ghs.helpView(helpNo, model);
			gs.ggiriSnsInfo(dto.getId(), model);
	        return "ggiriHelp/helpView";
		}
		return "ggiriHelp/helpView";
	}
	@GetMapping("helpModifyForm")
	public String helpModifyForm(@RequestParam("helpNo") int helpNo, Model model, HttpSession session) throws Exception {
		if(session.getAttribute(LOGIN) != null) {
			String id = (String)session.getAttribute(LOGIN);
			gs.ggiriMemberInfo(id, model);			
			ghs.helpView(helpNo, model);
	        return "ggiriHelp/helpModifyForm";
		} else if(session.getAttribute("kakaoMember") != null){
			GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("kakaoMember");
			ghs.helpView(helpNo, model);
			gs.ggiriSnsInfo(dto.getId(), model);
	        return "ggiriHelp/helpModifyForm";
		} else if(session.getAttribute("naverMember") != null){
			GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("naverMember");
			ghs.helpView(helpNo, model);
			gs.ggiriSnsInfo(dto.getId(), model);
	        return "ggiriHelp/helpModifyForm";
		} else if(session.getAttribute("googleMember") != null){
			GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("googleMember");
			ghs.helpView(helpNo, model);
			gs.ggiriSnsInfo(dto.getId(), model);
	        return "ggiriHelp/helpModifyForm";
		}
		
		
		return "ggiriHelp/helpModifyForm";
	}
	@PostMapping("modify")
	public String modify(GgiriHelpDTO dto) {
		ghs.modify(dto);
		return "redirect:/ggiriHelp/helpList";
	}
	@GetMapping("helpDelete")
	public String delete(@RequestParam("helpNo") int helpNo) {
		ghs.helpDelete(helpNo);
		return "/ggiriHelp/helpDelete";
	}
	
}
