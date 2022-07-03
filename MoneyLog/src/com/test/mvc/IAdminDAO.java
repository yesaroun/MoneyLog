package com.test.mvc;

import java.util.ArrayList;

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
}
