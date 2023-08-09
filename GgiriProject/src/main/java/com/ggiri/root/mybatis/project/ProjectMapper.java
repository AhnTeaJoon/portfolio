package com.ggiri.root.mybatis.project;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

import com.ggiri.root.complete.dto.CompleteDTO;
import com.ggiri.root.member.dto.GgiriMemberDTO;
import com.ggiri.root.project.dto.GgiriBoardLikeDTO;
import com.ggiri.root.project.dto.ProjectDTO;
import com.ggiri.root.project.dto.ProjectRepDTO;

public interface ProjectMapper {

	public List<Map<String, Object>> projectList();
    
    public ProjectDTO projectView(int projectNum);
    
    public int insertPro(ProjectDTO dto);
    
    public void proHit(int projectNum);
    
    public int modify(ProjectDTO dto);
    
    public void delete(int projectNum);

    public List<ProjectDTO> search(@Param("keyword") String keyword, @Param("condition") String condition);

    public int getProjectCountBySearch(@Param("keyword") String keyword, @Param("condition") String condition);

    public List<ProjectDTO> getProjectListBySearch(@Param("keyword") String keyword, @Param("condition") String condition,
                                           @Param("startRow") int startRow, @Param("endRow") int endRow);

    public List<ProjectDTO> getProjectList(@Param("startRow") int startRow, @Param("endRow") int endRow);

    public int getProjectCount();

    public List<ProjectDTO> getProjectList(Map<String, Object> params);

    public int getProjectCountBySearch(Map<String, Object> searchParams);

    public List<ProjectDTO> getProjectListBySearch(Map<String, Object> searchParams);
    
    public List<ProjectDTO> searchByTitleAndContent(@Param("keyword") String keyword);

    public List<ProjectDTO> searchByTitle(@Param("keyword") String keyword);

    public List<ProjectDTO> searchByAuthor(@Param("keyword") String keyword);

    public void setLikeCount(@Param("projectNum") int projectNum, @Param("likeCount") int likeCount);

    public void likeUp(@Param("board_no") int board_no, @Param("user_no") int user_no);

    public void likeDown(@Param("board_no") int board_no, @Param("user_no") int user_no);

    public int isProjectLikedByUser(@Param("projectNum") int projectNum, @Param("user_no") int user_no);

    public void insertLike(@Param("projectNum") int projectNum, @Param("user_no") int user_no);

    public void deleteLike(@Param("projectNum") int projectNum, @Param("user_no") int user_no);
    
    public ProjectDTO getProjectInfo(int projectNum);
    
    public int getLikeCount(int projectNum);
    
    // 댓글
    public int addReplyTest(ProjectRepDTO dto);
    
	public List<ProjectRepDTO> getRepList(int bno);
	
	public void repDelete(int no);
	
	public int modifyModalRep(ProjectRepDTO dto);
	
    public void increaseLikeCount(int projectNum);
    
    public void increaseLikeCountByUser(@Param("projectNum") int projectNum, @Param("id") String id);
    
	public int getLikeIdByUser(int projectNum, String id);

	
    // 관리자 페이지
    public List<ProjectDTO> adminProjectList();
    
    public void proDelete(int projectNum);
    
    public List<ProjectRepDTO> adminReplyList();
    
    
    // 프로젝트 리스트
    public List<Map<String, Object>> selectJob();
	
	public List<Map<String, Object>> selectSnsJob();
	
	// 좋아요
	public void insert_heart(GgiriBoardLikeDTO dto);
	
	public void insert_sns_heart(GgiriBoardLikeDTO dto);
	
    public int select_heart(GgiriBoardLikeDTO dto);
    
    public void deleteHeart(GgiriBoardLikeDTO dto);
    
    public int select_all_heart(GgiriBoardLikeDTO dto);
    
    // 좋아요 리스트
    
    
    public List<Map<String, Object>> selectHeart(String id);
    
    public List<Map<String, Object>> selectSnsHeart(String id);
    
    // 좋아요 인덱스 리스트
    
    public List<Map<String, Object>> indexRank();
    
    // 완성된 프로젝트 중복막기
    public CompleteDTO complete(int projectNum);
    
}
