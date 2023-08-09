package com.ggiri.root.member.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ggiri.root.complete.dto.CompleteDTO;
import com.ggiri.root.member.dto.GgiriFreeInsertDTO;
import com.ggiri.root.member.dto.GgiriMemberDTO;
import com.ggiri.root.mybatis.member.GgiriFreeInsertMapper;
import com.ggiri.root.project.dto.ProjectDTO;

import edu.emory.mathcs.backport.java.util.Arrays;
@Service
public class GgiriFreeInsertServiceImpl implements GgiriFreeInsertService{
	
	@Autowired
	private GgiriFreeInsertMapper gfm;
	
	@Autowired
	private GgiriFreeInsertService gfs;
	
	@Autowired
	private GgiriMessageService gm;

	@Override
	public int writeSave(GgiriFreeInsertDTO dto) {
		
		try {
			return gfm.writeSave(dto);
		}catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@Override
	public void Info(String userid, Model model) {
		// TODO Auto-generated method stub
		GgiriFreeInsertDTO dto = gfm.getBoard(userid);
		List<CompleteDTO> Dto = gfm.getProject(userid);
		model.addAttribute("info", dto);
		model.addAttribute("list",Dto);
	}
	
	@Override
	public List<GgiriFreeInsertDTO> selectJob(String job) {
		List<GgiriFreeInsertDTO> list = gfm.selectJob(job);
		return list;
	}
	@Override
	public void boardAllList(Model model) {
		model.addAttribute("boardList", gfm.boardAllList());
	}
	
	@Override
	public void modifyForm(String userid, Model model) {
		GgiriFreeInsertDTO dto = gfm.getBoard(userid);

		model.addAttribute("info", dto);
	}

	@Override
	public int modify(GgiriFreeInsertDTO dto) {
		try {
			return gfm.writeFreeModify(dto);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public void writeFreeDelete(String userid) {
		gfm.writeFreeDelete(userid);
	}
	
	@Override
	public List<CompleteDTO> projectInfo(String usertid, Model model) {
		List<CompleteDTO> dto = gfm.getProject(usertid);
		return dto;
	}

	@Override
	public List<GgiriFreeInsertDTO> getAdminListBySearch(String keyword, String condition, int startRow, int endRow) {
        return gfs.getAdminListBySearch(keyword, condition, startRow, endRow);
	}
        
	public void freeDelete(String deleteId) {
		gfm.freeDelete(deleteId);
	}

	@Override
	public List<GgiriFreeInsertDTO> getAdminList(int page, int perPage) {
		int startRow = (page - 1) * perPage + 1;
        int endRow = startRow + perPage - 1;
        return gfs.getAdminList(startRow, endRow);	
    }

	@Override
	public int getAdminListCount() {
		return gfs.getAdminListCount();
	}

	public List<GgiriFreeInsertDTO> ajaxMemberList() {
		return gfm.ajaxMemberList();
	}
	
	@Override
	public int boardCount() {
		return gfm.boardCount();
	}
	
	
//	GgiriFreeInsertDTO dto = gfm.getBoard(userid);
//	model.addAttribute("info", dto);
		
	@Override
	public List<GgiriFreeInsertDTO> ggiriMemberJob(Model model) {
		List<GgiriFreeInsertDTO> dto = gfm.ggiriMemberJob();
		model.addAttribute("ggiriMemberJob", dto);
		return dto;
	}

	@Override
	public List<GgiriFreeInsertDTO> ggiriSnsJob(Model model) {
		List<GgiriFreeInsertDTO> dto = gfm.ggiriSnsJob();
		model.addAttribute("ggiriSnsJob", dto);
		return dto;
	}	
	
}