
package com.ggiri.root.project.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ggiri.root.member.dto.GgiriMemberDTO;
import com.ggiri.root.member.service.GgiriFreeInsertService;
import com.ggiri.root.member.service.GgiriService;
import com.ggiri.root.mybatis.member.GgiriMemberMapper;
import com.ggiri.root.project.dto.GgiriBoardLikeDTO;
import com.ggiri.root.project.dto.ProjectDTO;
import com.ggiri.root.project.dto.ProjectRepDTO;
import com.ggiri.root.project.service.ProjectService;
import com.ggiri.root.session.login.GgiriMemberSession;

@Controller
@RequestMapping("ggiriProject")
public class ProjectController implements GgiriMemberSession{
	
	@Autowired
	private ProjectService ps;
	
	@Autowired
	private GgiriFreeInsertService gfs;

	@Autowired
	private GgiriService gs;
	
	@Autowired
	private GgiriMemberMapper gmm;
	
	
    @RequestMapping("projectWrite")
    public String proWrite(HttpSession session, Model model) {
    	if(session.getAttribute(LOGIN) != null) {
			String id = (String)session.getAttribute(LOGIN);
			gs.ggiriMemberInfo(id, model);
			return "ggiriProject/projectWrite";
		} else if(session.getAttribute("kakaoMember") != null){
			GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("kakaoMember");
			gs.ggiriSnsInfo(dto.getId(), model);
			return "ggiriProject/projectWrite";
		} else if(session.getAttribute("naverMember") != null){
			GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("naverMember");
			gs.ggiriSnsInfo(dto.getId(), model);
			return "ggiriProject/projectWrite";
		} else if(session.getAttribute("googleMember") != null){
			GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("googleMember");
			gs.ggiriSnsInfo(dto.getId(), model);
			return "ggiriProject/projectWrite";
		}
        return "ggiriProject/projectWrite";
    }


    @GetMapping("projectView")
    public String projectView(@RequestParam("projectNum") int projectNum, Model model, HttpSession session) throws Exception {

    	
    		// 좋아요 하트 총 갯수
	    	GgiriBoardLikeDTO dto = new GgiriBoardLikeDTO();
	    	if(session.getAttribute(LOGIN) != null) {
		        String id = (String)session.getAttribute(LOGIN);
		        dto.setId(id);
	    	}
	    	else if(session.getAttribute("kakaoMember") != null){
	    		GgiriMemberDTO Dto = (GgiriMemberDTO)session.getAttribute("kakaoMember");	
	    		dto.setId(Dto.getId());
	    	}else if(session.getAttribute("naverMember") != null){
	    		GgiriMemberDTO Dto = (GgiriMemberDTO)session.getAttribute("naverMember");	
	    		dto.setId(Dto.getId());
	    	}else if(session.getAttribute("googleMember") != null){
	    		GgiriMemberDTO Dto = (GgiriMemberDTO)session.getAttribute("googleMember");	
	    		dto.setId(Dto.getId());
	    	}	
	        dto.setProjectNum(projectNum);
	    	dto.setLike_check(0);
	        int a = ps.select_all_heart(dto);
	        model.addAttribute("likeCount",a);
	        
	        // 좋아요 하트 여부를 위한 작업
	        GgiriBoardLikeDTO Dto = new GgiriBoardLikeDTO();
	        if(session.getAttribute(LOGIN) != null) {
	        	String Id = (String)session.getAttribute(LOGIN);
	    		Dto.setId(Id);
	        }else if(session.getAttribute("kakaoMember") != null) {
	        	GgiriMemberDTO DTo = (GgiriMemberDTO)session.getAttribute("kakaoMember");
	        	Dto.setId(DTo.getId());
	        }else if(session.getAttribute("naverMember") != null) {
	        	GgiriMemberDTO DTo = (GgiriMemberDTO)session.getAttribute("naverMember");
	        	Dto.setId(DTo.getId());
	        }else if(session.getAttribute("googleMember") != null) {
	        	GgiriMemberDTO DTo = (GgiriMemberDTO)session.getAttribute("googleMember");
	        	Dto.setId(DTo.getId());
	        }
	        Dto.setProjectNum(projectNum);
	    	Dto.setLike_check(0);
	        int b = ps.select_heart(Dto);
	        model.addAttribute("like",b);
    	

        
        
	        if(session.getAttribute(LOGIN) != null) {
	            String id = (String)session.getAttribute(LOGIN);
	            gs.ggiriMemberInfo(id, model);         
	            ps.projectView(projectNum, model);
	            ps.complete(projectNum, model);
	              return "ggiriProject/projectView";
	         } else if(session.getAttribute("kakaoMember") != null){
	            GgiriMemberDTO DTO = (GgiriMemberDTO)session.getAttribute("kakaoMember");
	            ps.projectView(projectNum, model);
	            gs.ggiriSnsInfo(DTO.getId(), model);
	            ps.complete(projectNum, model);
	              return "ggiriProject/projectView";
	         } else if(session.getAttribute("naverMember") != null){
	            GgiriMemberDTO DTO = (GgiriMemberDTO)session.getAttribute("naverMember");
	            ps.projectView(projectNum, model);
	            gs.ggiriSnsInfo(DTO.getId(), model);
	            ps.complete(projectNum, model);
	              return "ggiriProject/projectView";
	        } else if(session.getAttribute("googleMember") != null){
	           GgiriMemberDTO DTO = (GgiriMemberDTO)session.getAttribute("googleMember");
	           //ps.modalContent(projectNum, model);
	           ps.projectView(projectNum, model);
	           gs.ggiriSnsInfo(DTO.getId(), model);
	           ps.complete(projectNum, model);
	        return "ggiriProject/projectView";
	        }
	    return "ggiriProject/projectView";
    }

    @PostMapping("projectSave")
    public String projectSave(ProjectDTO dto) {
        int a = ps.insertPro(dto);
        if(a == 1) {
        	return "redirect:projectSuccess";
        }
        return "redirect:projectFail";
    }
    
    @GetMapping("projectSuccess")
    public String projectSuccess() {
    	return "ggiriProject/projectSuccess";
    }
    
    @GetMapping("projectFail")
    public String projectFail() {
    	return "ggiriProject/projectFail";
    }
    
    @GetMapping("modifyForm")
    public String modifyForm(@RequestParam("projectNum") int projectNum, Model model) {
        ps.projectView(projectNum, model);
        return "ggiriProject/modifyForm";
    }

    @PostMapping("modify")
    public String modify(ProjectDTO dto) {
    	System.out.println(dto.getProjectNum());
    	System.out.println(dto.getTitle());
    	System.out.println(dto.getProject());
    	System.out.println(dto.getContent());
    	System.out.println(dto.getId());
    	System.out.println(dto.getSkill());
    	
        int su = ps.modify(dto);
        if(su == 1) {
        	return "ggiriProject/projectModifySuccess";
        }
        return "ggiriProject/projectModifyFail";
    }

    @GetMapping("delete")
    public String delete(@RequestParam("projectNum") int projectNum) {
        ps.delete(projectNum);
        return "redirect:/ggiriProject/projectList";
    }

    @GetMapping(value = "projectList.do", produces="application/json; charset=utf-8")
    public String projectList(
        @RequestParam(value = "page", defaultValue = "1") int page,
        @RequestParam(value = "keyword", required = false) String keyword,
        @RequestParam(value = "condition", defaultValue = "title") String condition,
        Model model
    ) {
        int perPage = 10; // 한 페이지에 보여줄 프로젝트 개수

        if (keyword != null && !keyword.isEmpty()) {
            // 검색어가 입력된 경우 검색 기능 적용
            int totalCount = ps.getProjectCountBySearch(keyword, condition);
            int totalPages = (int) Math.ceil((double) totalCount / perPage);
            int startRow = (page - 1) * perPage + 1;
            int endRow = startRow + perPage - 1;
            List<ProjectDTO> projectList = ps.getProjectListBySearch(keyword, condition, startRow, endRow);
            
            model.addAttribute("keyword", keyword);
            model.addAttribute("condition", condition);
            model.addAttribute("projectList", projectList);
            model.addAttribute("currentPage", page);
            model.addAttribute("totalPages", totalPages);
        } else {
            // 검색어가 없는 경우 전체 프로젝트 목록 조회
            List<ProjectDTO> projectList = ps.getProjectList(page, perPage);
            int totalCount = ps.getProjectCount();
            int totalPages = (int) Math.ceil((double) totalCount / perPage);
            
            model.addAttribute("projectList", projectList);
            model.addAttribute("currentPage", page);
            model.addAttribute("totalPages", totalPages);
        }

        return "ggiriProject/projectList";
    }
    
    @GetMapping("projectList")
    public String projectList(Model model, HttpSession session)  {
    	
        if(session.getAttribute(LOGIN) == null) {
        	String id = (String)session.getAttribute(LOGIN);
        	List<Map<String, Object>> list = ps.selectJob(model);
        	gfs.ggiriMemberJob(model);			
	        return "ggiriProject/projectList";
        }
        if(session.getAttribute(LOGIN) != null) {
			String id = (String)session.getAttribute(LOGIN);
			List<Map<String, Object>> list = ps.selectJob(model);
			gfs.ggiriMemberJob(model);			
	        return "ggiriProject/projectList";
		} else if(session.getAttribute("kakaoMember") != null){
			GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("kakaoMember");
			List<Map<String, Object>> list = ps.selectSnsJob(dto.getId(),model);
			gfs.ggiriSnsJob(model);
	        return "ggiriProject/projectList";
		} else if(session.getAttribute("naverMember") != null){
			GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("naverMember");
			List<Map<String, Object>> list = ps.selectSnsJob(dto.getId(),model);
			gfs.ggiriSnsJob(model);
	        return "ggiriProject/projectList";
		} else if(session.getAttribute("googleMember") != null){
			GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("googleMember");
			List<Map<String, Object>> list = ps.selectSnsJob(dto.getId(),model);
			gfs.ggiriSnsJob(model);
	        return "ggiriProject/projectList";
		}
        return "ggiriProject/projectList";
    }

    
    
    // 댓글
    @PostMapping("addReply")
    @ResponseBody
	public int addReply(@RequestBody Map<String, Object> map, HttpSession session) {
		
		ProjectRepDTO dto = new ProjectRepDTO();
		
		String projectNum = (String) map.get("projectNum");
		System.out.println(projectNum);
		String id = (String)map.get("id");
		System.out.println(id);
		String content = (String)map.get("content");
		System.out.println(content);
		
		
		dto.setId((String)map.get("id"));
		dto.setMemberNum(Integer.parseInt((String)map.get("memberNum")));
		dto.setBno(Integer.parseInt((String)map.get("projectNum")));
		dto.setContent(content);
		int rep = ps.addReplyTest(dto);
		
		return rep;
	}
    
    @GetMapping("repDelete")
    @ResponseBody
    public String repDelete(@RequestParam("no") int no) {
    	ps.repDelete(no);
    	return "OK";
    }
    
	@GetMapping("replyData")
	@ResponseBody
	public List<ProjectRepDTO> replyData(@RequestParam("projectNum") int bno) {

		return ps.getRepList(bno);
		
	}
	
	// 좋아요
	@PostMapping(value="like_check/{projectNum}", produces="application/json; charset=utf-8")
	@ResponseBody
	public int like(@PathVariable("projectNum") String projectNum,HttpSession session
		    )throws Exception{
		
		
		
			GgiriBoardLikeDTO dto = new GgiriBoardLikeDTO();
			if(session.getAttribute(LOGIN) != null) {
				dto.setId((String)session.getAttribute(LOGIN));
				System.out.println("플젝 컨드롤러 토클 아이디 : "+ session.getAttribute(LOGIN));
			}
			else if(session.getAttribute("kakaoMember") != null){
				GgiriMemberDTO kakao = (GgiriMemberDTO)session.getAttribute("kakaoMember");
				dto.setId(kakao.getId());
				System.out.println("플젝 컨트롤러 토글 카카오 아이디 : " + dto.getId());
			}else if(session.getAttribute("naverMember") != null){
				GgiriMemberDTO naver = (GgiriMemberDTO)session.getAttribute("naverMember");
				dto.setId(naver.getId());
				System.out.println("플젝 컨트롤러 토글 네이버 아이디 : " + dto.getId());
			}else if(session.getAttribute("googleMember") != null){
				GgiriMemberDTO google = (GgiriMemberDTO)session.getAttribute("googleMember");
				dto.setId(google.getId());
				System.out.println("플젝 컨트롤러 토글 구글 아이디 : " + dto.getId());
			}	
			System.out.println("플젝 컨트롤러 토클 번호 : " + projectNum);
			dto.setLike_check(1);
			dto.setProjectNum(Integer.parseInt(projectNum));
			if(session.getAttribute(LOGIN)!=null) {
				ps.like_check(Integer.parseInt(projectNum), (String)session.getAttribute(LOGIN));
			
			}else if(session.getAttribute("kakaoMember") != null) {
				ps.insert_sns_heart(Integer.parseInt(projectNum), (GgiriMemberDTO)session.getAttribute("kakaoMember"));
			}else if(session.getAttribute("naverMember") != null) {
				ps.insert_sns_heart(Integer.parseInt(projectNum), (GgiriMemberDTO)session.getAttribute("naverMember"));
			}else if(session.getAttribute("googleMember") != null) {
				ps.insert_sns_heart(Integer.parseInt(projectNum), (GgiriMemberDTO)session.getAttribute("googleMember"));
			}
			return ps.select_all_heart(dto);
		

		
	}
	// 좋아요 리스트
	@GetMapping("heartList")
	public String heartList(Model model, HttpSession session)throws Exception {
		if(session.getAttribute(LOGIN) != null) {
			GgiriBoardLikeDTO dto = new GgiriBoardLikeDTO();
        	String id = (String)session.getAttribute(LOGIN);
        	dto.setId(id);
        	List<Map<String, Object>> list = ps.selectHeart(dto.getId(),model);
	        return "ggiriProject/heartList";
        }
		else if(session.getAttribute("kakaoMember") != null){
			GgiriBoardLikeDTO Dto = new GgiriBoardLikeDTO();
			GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("kakaoMember");
			Dto.setId(dto.getId());
			List<Map<String, Object>> list = ps.selectSnsHeart(Dto.getId(),model);
	        return "ggiriProject/heartList";
		} else if(session.getAttribute("naverMember") != null){
			GgiriBoardLikeDTO Dto = new GgiriBoardLikeDTO();
			GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("naverMember");
			Dto.setId(dto.getId());
			List<Map<String, Object>> list = ps.selectSnsHeart(Dto.getId(),model);
	        return "ggiriProject/heartList";
		} else if(session.getAttribute("googleMember") != null){
			GgiriBoardLikeDTO Dto = new GgiriBoardLikeDTO();
			GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("googleMember");
			Dto.setId(dto.getId());
			List<Map<String, Object>> list = ps.selectSnsHeart(Dto.getId(),model);
	        return "ggiriProject/heartList";
		}
		
		return "ggiriProject/heartList";
	}
	@GetMapping("rank")
	public void indexRank(Model model,HttpSession session) {
		if(session.getAttribute(LOGIN) == null) {
			String id = (String)session.getAttribute(LOGIN);
			List<Map<String, Object>> list = ps.indexRank(model);
		}
		if(session.getAttribute(LOGIN) != null) {
			String id = (String)session.getAttribute(LOGIN);
			List<Map<String, Object>> list = ps.indexRank(model);
		}else if(session.getAttribute("kakaoMember") != null){
			GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("kakaoMember");
			List<Map<String, Object>> list = ps.indexRank(model);
		}else if(session.getAttribute("naverMember") != null){
			GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("naverMember");
			List<Map<String, Object>> list = ps.indexRank(model);
		}else if(session.getAttribute("googleMember") != null){
			GgiriMemberDTO dto = (GgiriMemberDTO)session.getAttribute("googleMember");
			List<Map<String, Object>> list = ps.indexRank(model);
		}
	}
	
	@PostMapping("modifyModalRep")
	@ResponseBody
	public String modifyModalRep(@RequestBody ProjectRepDTO dto) {
		ps.modifyModalRep(dto);
		return "OK";
	}
	
}