package com.ggiri.root.mybatis.member;

import com.ggiri.root.member.dto.GgiriMemberDTO;
import com.ggiri.root.project.dto.ProjectDTO;

import java.util.List;
public interface GgiriMemberMapper {
	
	public int register(GgiriMemberDTO member);
	public int idCheck(String id);
	public GgiriMemberDTO loginCheck(String id);
	public int joinPhone(String userTel);
	public GgiriMemberDTO findEmail(String email);
	public int findNaver(String naverMember);
	public void naverInsert(GgiriMemberDTO naverInsert);
	public int findKakao(String kakaoMember);
	public void kakaoinsert(GgiriMemberDTO kakaoInsert);
	public int findGoogle(String googleMember);
	public void googleinsert(GgiriMemberDTO googleInsert);
	public int modifyResult(GgiriMemberDTO modifyMember);
	public GgiriMemberDTO ggiriMemberInfo(String id);
	public GgiriMemberDTO ggiriSnsInfo(String id);
	public List<GgiriMemberDTO> allMember();
	public int getProjectCount();
	public void deleteId(String id);
	public void memberWithdraw(String id);
	
	
	public List<ProjectDTO> getProjectListBySearch(String keyword, String condition);
	
	// 좋아요를 위한 작업
	public GgiriMemberDTO heartMemberInfo(int memberNum);
	
	public GgiriMemberDTO heartSnsInfo(int memberNum);
}
