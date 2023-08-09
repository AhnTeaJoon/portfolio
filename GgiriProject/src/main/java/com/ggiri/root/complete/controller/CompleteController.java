
package com.ggiri.root.complete.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ggiri.root.complete.dto.CompleteDTO;
import com.ggiri.root.complete.service.CompleteService;
import com.ggiri.root.member.dto.GgiriMemberDTO;
import com.ggiri.root.member.service.GgiriService;
import com.ggiri.root.project.dto.ProjectDTO;
import com.ggiri.root.project.service.ProjectService;
import com.ggiri.root.session.login.GgiriMemberSession;

@Controller
@RequestMapping("ggiriComplete")
public class CompleteController implements GgiriMemberSession {

	@Autowired
	private CompleteService cs;
	
	@Autowired
	private ProjectService ps;
	
	@Autowired
	private GgiriService gs;
	
	@GetMapping("completeList")
	public String completeList(Model model) {
		cs.completeList(model);
		return "ggiriComplete/completeList";
	}
	
	@RequestMapping("completeWrite")
	public String comWrite(@RequestParam("projectNum") int projectNum, HttpSession session, Model model) {
		//System.out.println(projectNum);
		if(session.getAttribute(LOGIN) != null) {
			String id = (String)session.getAttribute(LOGIN);
			gs.ggiriMemberInfo(id, model);
			ps.getProjectInfo(projectNum, model);
			return "ggiriComplete/completeWrite";
		} else if(session.getAttribute("kakaoMember") != null){
			GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("kakaoMember");
			gs.ggiriSnsInfo(dto.getId(), model);
			ps.getProjectInfo(projectNum, model);
			return "ggiriComplete/completeWrite";
		} else if(session.getAttribute("naverMember") != null){
			GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("naverMember");
			gs.ggiriSnsInfo(dto.getId(), model);
			ps.getProjectInfo(projectNum, model);
			return "ggiriComplete/completeWrite";
		} else if(session.getAttribute("googleMember") != null){
			GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("googleMember");
			gs.ggiriSnsInfo(dto.getId(), model);
			ps.getProjectInfo(projectNum, model);	
			return "ggiriComplete/completeWrite";
		}
		return "ggiriComplete/completeWrite";
	}
	
	@GetMapping("completeView")
	public String comView(@RequestParam("completeNum") int completeNum, Model model) {
		cs.comView(completeNum, model);
		return "ggiriComplete/completeView";
	}
	
	
	@PostMapping("comSave")
	   @ResponseBody
	   public int comSave(@RequestBody CompleteDTO dto, HttpSession session) {
	      
//	      CompleteDTO cdto = new CompleteDTO();
	      
//	      String memberNum = (String) map.get("memberNum");
//	      System.out.println(memberNum);
//	      String id = (String)map.get("id");
//	      System.out.println(id);
	      
	      
//	      dto.setMemberNum(Integer.parseInt((String)map.get("memberNum")));
//	      dto.setTitle((String)map.get("title"));
//	      dto.setContent((String)map.get("content"));
//	      dto.setSkill((String)map.get("skill"));
//	      dto.setMembers((String)map.get("members"));
//	      dto.setTag((String)map.get("tag"));
//	      dto.setId((String)map.get("id"));
	      
	      
	      int projectCom = cs.comSave(dto);
	      
	      return projectCom;
	}
	
	@GetMapping("completeSuccess")
    public String completeSuccess() {
    	return "ggiriComplete/completeSuccess";
    }
    
    @GetMapping("completeFail")
    public String completeFail() {
    	return "ggiriComplete/completeFail";
    }
	
	
	@GetMapping("completeModify")
	public String modify(@RequestParam("completeNum") int completeNum, Model model) {
		cs.comView(completeNum, model);
		return "ggiriComplete/completeModify";
	}
	
	@PostMapping("modify")
	public String modify(CompleteDTO dto) {
		cs.modify(dto);
		return "ggiriComplete/comSuccess";
	}
	
	@GetMapping("delete")
	public String delete(@RequestParam("completeNum") int completeNum) {
		cs.delete(completeNum);
		return "redirect:completeList";
	}
	
	
}
