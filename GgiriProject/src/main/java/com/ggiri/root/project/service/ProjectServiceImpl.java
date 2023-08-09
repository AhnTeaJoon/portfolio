package com.ggiri.root.project.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ggiri.root.member.dto.GgiriMemberDTO;
import com.ggiri.root.mybatis.member.GgiriMemberMapper;
import com.ggiri.root.mybatis.project.ProjectMapper;
import com.ggiri.root.project.dto.GgiriBoardLikeDTO;
import com.ggiri.root.project.dto.ProjectDTO;
import com.ggiri.root.project.dto.ProjectRepDTO;

@Service
public class ProjectServiceImpl implements ProjectService {

    @Autowired
    private ProjectMapper pm;
    @Autowired
	private GgiriMemberMapper gmm;
    
    
    @Override
    public void projectView(int projectNum, Model model) {
        model.addAttribute("data", pm.projectView(projectNum));
        pm.proHit(projectNum);
    }

    @Override
    public int insertPro(ProjectDTO dto) {
    	return pm.insertPro(dto);
    }

    @Override
    public int modify(ProjectDTO dto) {
    	return pm.modify(dto);
    }

    @Override
    public void delete(int projectNum) {
        pm.delete(projectNum);
    }

    @Override
    public List<ProjectDTO> search(String keyword, String searchType) {
        return pm.search(keyword, searchType);
    }

    @Override
    public int getProjectCountBySearch(String keyword, String searchType) {
        return pm.getProjectCountBySearch(keyword, searchType);
    }

    @Override
    public List<ProjectDTO> getProjectListBySearch(String keyword, String searchType, int startRow, int endRow) {
        return pm.getProjectListBySearch(keyword, searchType, startRow, endRow);
    }


    @Override
    public List<ProjectDTO> getProjectList(int page, int perPage) {
        int startRow = (page - 1) * perPage + 1;
        int endRow = startRow + perPage - 1;
        return pm.getProjectList(startRow, endRow);
    }
    
    @Override
    public int getProjectCount() {
        return pm.getProjectCount();
    }	
    
    
    @Override
    public void getProjectInfo(int projectNum, Model model) {
    	 model.addAttribute("getProjectInfo",pm.getProjectInfo(projectNum));
    }
    
    
    // 관리자 페이지
    @Override
    public void adminProjectList(Model model) {
    	model.addAttribute("adminProjectList", pm.adminProjectList());
    }

    
    @Override
    public void proDelete(int projectNum) {
    	pm.proDelete(projectNum);
    }
    
    @Override
    public void adminReplyList(Model model) {
    	model.addAttribute("adminReplyList", pm.adminReplyList());
    }
    
    
    // 댓글
    @Override
    public int addReplyTest(ProjectRepDTO dto) {
    	
    	return pm.addReplyTest(dto);
    }
    
	@Override
	public List<ProjectRepDTO> getRepList(int bno) {
		return pm.getRepList(bno);
	}
    
	@Override
	public void repDelete(int no) {
		pm.repDelete(no);
	}
	
	@Override
	public int modifyModalRep(ProjectRepDTO dto) {
		return pm.modifyModalRep(dto);
	}
	
//	@Override
//	public void modalContent(int projectNum, Model model) {
//		model.addAttribute("modalContent", pm.modalContent(projectNum));
//	}
	// 프리랜서 리스트
	@Override
	public List<Map<String, Object>> selectJob(Model model) {
		model.addAttribute("list",pm.selectJob());
		return pm.selectJob();
	}

	@Override
	public List<Map<String, Object>> selectSnsJob(String id,Model model) {
		model.addAttribute("snsList", pm.selectSnsJob());
		return pm.selectSnsJob();
	}
	@Override
	public List<Map<String, Object>> projectList(Model model) {
		model.addAttribute("projectList", pm.projectList());
		return pm.projectList();
		
	}

	// 좋아요 리스트
	
	
	
	@Override
	public List<Map<String, Object>> selectHeart(String id,Model model) {
		model.addAttribute("heartlist", pm.selectHeart(id));
		return pm.selectHeart(id);
	}
	
	@Override
	public List<Map<String, Object>> selectSnsHeart(String id,Model model) {
		model.addAttribute("heartSnslist", pm.selectSnsHeart(id));
		return pm.selectSnsHeart(id);
	}
	
	//좋아요
	
	

	@Override
	public void like_check(int projectNum, String id) {
		try {
			GgiriBoardLikeDTO dto = new GgiriBoardLikeDTO();
			dto.setId(id);
			dto.setProjectNum(projectNum);
			System.out.println("맴버  : " + id);
			System.out.println("플젝 넘버 : " + projectNum);
			int a = pm.select_heart(dto);
			
			if(a == 0) {
				pm.insert_heart(dto);
			}else
				pm.deleteHeart(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
	}
	
	
	
	
	
	

	

	@Override
	public void insert_sns_heart(int projectNum, GgiriMemberDTO dto) {
		try {
			GgiriBoardLikeDTO Dto = new GgiriBoardLikeDTO();
			
			Dto.setId(dto.getId());
			Dto.setProjectNum(projectNum);
			System.out.println("맴버  : " + dto.getId());
			System.out.println("플젝 넘버 : " + projectNum);
			int a = pm.select_heart(Dto);
			
			if(a == 0) {
				pm.insert_heart(Dto);
			}else
				pm.deleteHeart(Dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public int select_heart(GgiriBoardLikeDTO dto) {
		// TODO Auto-generated method stub
		return pm.select_heart(dto);
	}

	@Override
	public int select_all_heart(GgiriBoardLikeDTO dto) {
		// TODO Auto-generated method stub
		return pm.select_all_heart(dto);
	}

	
	
	
	// 인덱스 좋아요 리스트
	@Override
	public List<Map<String, Object>> indexRank(Model model) {
		model.addAttribute("rank",pm.indexRank());
		return pm.indexRank();
	}
	// 완성된 프로젝트 막기
	@Override
	public void complete(int prjectNum, Model model) {
		model.addAttribute("compro", pm.complete(prjectNum));
		
	}
}

