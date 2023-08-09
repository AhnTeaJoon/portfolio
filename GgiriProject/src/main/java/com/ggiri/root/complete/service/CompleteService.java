
package com.ggiri.root.complete.service;

import org.springframework.ui.Model;

import com.ggiri.root.complete.dto.CompleteDTO;

public interface CompleteService {

	public void completeList(Model model);
	
	public void comView(int completeNum, Model model);
	
	public int comSave(CompleteDTO dto);
	
	public int modify(CompleteDTO dto);
	
	public void delete(int completeNum);
	
	// 관리자 페이지
	public void adminCompleteList(Model model);
	
	public void comDelete(int completeNum);
	
}
