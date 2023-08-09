
package com.ggiri.root.complete.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ggiri.root.complete.dto.CompleteDTO;
import com.ggiri.root.mybatis.complete.CompleteMapper;

@Service
public class CompleteServiceImpl implements CompleteService {

	@Autowired
	private CompleteMapper cm;
	
	@Override
	public void completeList(Model model) {
		model.addAttribute("completeList", cm.completeList());
	}
	
	
	@Override
	public void comView(int completeNum, Model model) {
		cm.comHit(completeNum);
		model.addAttribute("data", cm.comView(completeNum));
	}
	
	@Override
	public int comSave(CompleteDTO dto) {
		return cm.comSave(dto);
	}
	
	@Override
	public int modify(CompleteDTO dto) {
		return cm.modify(dto);
	}
	
	@Override
	public void delete(int completeNum) {
		cm.delete(completeNum);
	}
	
	// 관리자 페이지
	@Override
	public void adminCompleteList(Model model) {
		model.addAttribute( "adminCompleteList", cm.adminCompleteList());
	}
	
	@Override
	public void comDelete(int completeNum) {
		cm.comDelete(completeNum);
	}
	
}
