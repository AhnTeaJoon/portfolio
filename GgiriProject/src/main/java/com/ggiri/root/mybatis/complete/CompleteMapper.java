package com.ggiri.root.mybatis.complete;

import java.util.List;

import com.ggiri.root.complete.dto.CompleteDTO;

public interface CompleteMapper {

	public List<CompleteDTO> completeList();
	
	public CompleteDTO comView(int completeNum);
	
	public int comSave(CompleteDTO dto);
	
	public void comHit(int completeNum);
	
	public int modify(CompleteDTO dto);
	
	public void delete(int completeNum);
	
	//관리자 페이지
	public List<CompleteDTO> adminCompleteList();
	public void comDelete(int completeNum);
}
