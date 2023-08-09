package com.ggiri.root.mybatis.member;

import java.util.List;

import com.ggiri.root.complete.dto.CompleteDTO;
import com.ggiri.root.member.dto.GgiriFreeInsertDTO;
import com.ggiri.root.member.dto.GgiriMemberDTO;

public interface GgiriFreeInsertMapper {
	
	// 프리랜서 등록하기 
	public int writeSave(GgiriFreeInsertDTO dto);
	
	public List<GgiriFreeInsertDTO> selectJob(String job);
	
	public GgiriFreeInsertDTO getBoard(String userid);
	
	public List<GgiriMemberDTO> boardAllList();
	
//	public List<GgiriFreeInsertDTO> boardGetFirstList();
//	
//	public List<GgiriFreeInsertDTO> boardGetList(GgiriFreeInsertDTO dto);
	
	public int writeFreeModify(GgiriFreeInsertDTO dto);	
	
	public void writeFreeDelete(String userid);

	public List<CompleteDTO> getProject(String userid);
	
	public List<GgiriFreeInsertDTO> search(String keyword, String condition);

	public void freeDelete(String id);
	
	public List<GgiriFreeInsertDTO> ajaxMemberList();
	
	public int boardCount();
	
	public List<GgiriFreeInsertDTO> ggiriMemberJob();
	
	public List<GgiriFreeInsertDTO> ggiriSnsJob();	
	
}
