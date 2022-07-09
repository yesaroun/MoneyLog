package com.test.mvc;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface IAdminDAO
{
	// 게시글 신고 미처리건 카운트
	public int countPostRept();
	
	// 댓글 신고 미처리건 카운트
	public int countCmntRept();
	
	// 문의글 미처리건 카운트
	public int countQna();
	
	// 영구정지 회원 리스트
	public ArrayList<UserDTO> banList();
	
	// 게시글 신고처리 리스트
	public ArrayList<PostReptDTO> postReptList();
	
	
	// ==========================================현지 추가 
	
	// 미처리된 신고 게시글 카운트
	public int mainCountPostRept();
		
	// 댓글 신고 미처리건 카운트
	public int mainCountCmntRept();
		
	// 문의글 미처리건 카운트
	public int mainCountQna();
	
	
	// ==========================================현지 추가 
	
	// 관리자 로그인
	public AdminDTO adLogin(@Param("ad_id") String ad_id, @Param("ad_pw") String ad_pw);
	
	
	
}
