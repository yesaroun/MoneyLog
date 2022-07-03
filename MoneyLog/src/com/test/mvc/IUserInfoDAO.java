package com.test.mvc;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IUserInfoDAO
{
	// 회원이 입력한 아이디로 아이디 중복 체크 메소드
	public int checkId(String user_id) throws SQLException;
	
	// 지역 1차 리스트 메소드
	public ArrayList<UserDTO> areaFstList() throws SQLException;

	// 지역 2차 리스트 메소드
	public ArrayList<UserDTO> areaSecList() throws SQLException;

	// 직업 1차 리스트 메소드
	public ArrayList<UserDTO> jobFstList() throws SQLException;
	
	// 직업 2차 리스트 메소드
	public ArrayList<UserDTO> jobSecList() throws SQLException;
	
	// 비밀번호 찾기 메소드
	public String findPwd(String user_name, String user_id, String user_tel) throws SQLException;
	
	
	// 결혼여부 리스트 메소드 public ArrayList<UserDTO> mrgList() throws SQLException;
	
	// 자녀수 전체 리스트 메소드 public ArrayList<UserDTO> childList() throws SQLException;
	
	// 총가구구성원수 리스트 메소드 public ArrayList<UserDTO> fmlList() throws SQLException;
	
	// 주거형태 리스트 메소드 public ArrayList<UserDTO> houseList() throws SQLException;
	
	// 반려동물리스트 메소드 public ArrayList<UserDTO> petList() throws SQLException;

}
