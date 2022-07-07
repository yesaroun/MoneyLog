package com.test.mvc;

import java.util.ArrayList;

public interface IAdMainDAO 
{
	// 미처리된 신고 게시글 카운트
	public int mainCountPostRept();
	
	// 댓글 신고 미처리건 카운트
	public int mainCountCmntRept();
	
	// 문의글 미처리건 카운트
	public int mainCountQna();
	
}
