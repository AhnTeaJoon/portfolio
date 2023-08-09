package com.ggiri.root.member.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.ggiri.root.complete.dto.CompleteDTO;
import com.ggiri.root.member.dto.GgiriFreeInsertDTO;
import com.ggiri.root.project.dto.GgiriBoardLikeDTO;
import com.ggiri.root.project.dto.ProjectDTO;


public interface GgiriFreeInsertService {
	
	// 프리랜서 등록하기
	public int writeSave(GgiriFreeInsertDTO dto);
	
	// 리스트 버튼 
	public List<GgiriFreeInsertDTO> selectJob(String job);
	
	// 프리랜서 개인
	public void Info(String userid, Model model);
	
	// 모든 프리랜서
	public void boardAllList(Model model);
	
	
	
	// 무한 스크롤
//	public void boardGetFirstList(Model model);
//	public List<GgiriFreeInsertDTO> boardGetList(GgiriFreeInsertDTO dto);
	
	// (관리자 페이지) 프리랜서 삭제
	public void freeDelete(String deleteId);
		
	public int boardCount();
	
	public void modifyForm(String userid, Model model);	
	
	public int modify(GgiriFreeInsertDTO dto);
	
	public void writeFreeDelete(String userid);
	
	public List<CompleteDTO> projectInfo(String usertid, Model model);

//	public void adminProjectList(Model model);

	public List<GgiriFreeInsertDTO> getAdminListBySearch(String keyword, String condition, int startRow, int endRow);

	public List<GgiriFreeInsertDTO> getAdminList(int page, int perPage);

	public int getAdminListCount();
	


	public List<GgiriFreeInsertDTO> ajaxMemberList();
	
	public List<GgiriFreeInsertDTO> ggiriMemberJob(Model model);
	
	public List<GgiriFreeInsertDTO> ggiriSnsJob(Model model);	
	
}