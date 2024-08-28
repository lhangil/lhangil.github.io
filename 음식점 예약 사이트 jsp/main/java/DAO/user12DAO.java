package DAO;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import VO.user12VO;
import util.ConnectionFactory;


public class user12DAO { 

	/**
	 * 로그인여부 확인
	 * @param loginVO 조회할 id, password
	 * @return 조회된 MemberVO, 단 로그인 실패시 null 반환
	 */
	public user12VO login(user12VO loginVO) {
		
		StringBuilder sql = new StringBuilder();
		sql.append("select * ");
		sql.append("  from allusers ");
		sql.append(" where user_id = ? and password = ? ");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			System.out.println(loginVO.getId());
			System.out.println(loginVO);
			pstmt.setString(1, loginVO.getId());
			pstmt.setString(2, loginVO.getPassword());
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				String id 		= rs.getString("user_id");
				String name 	= rs.getString("username");
				String email 	= rs.getString("email");
				String password = rs.getString("password");
				String phone 	= rs.getString("phone_number");
				
				
				
				
				user12VO member = new user12VO();
				member.setId(id);
				member.setName(name);
				member.setEmail(email);
				member.setPassword(password);
				member.setPhone(phone);
				
				System.out.println(member);
				
				return member;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	//회원가입
	public void register(user12VO member) {
		StringBuilder sql = new StringBuilder(); // 스트링빌더는 항상 SQL과 사용 SQL이 담긴 문자열을 생성하기위해
		sql.append(" insert into allusers(user_id,username,email,password,phone_number) ");
		sql.append("  values(?, ?, ?, ?, ?) ");
		// 변수 sql에 위 2줄이 들어감 -> 이렇게 만들어진 sql 변수가 결국 prepareStatement의 매개변수로 들어감

		try( // try() <- 괄호 안에 DB 연결 관련 객체들을 생성하면 굳이 close 하러갈 필요가 없어서 편하다.
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString()); // 변수 sql의 자료형 StringBuilder -> String형으로 바꿔주기 위해서 toString()
		) { // sql문의 ?에 순서대로 값을 넣어주는 과정 -> 문자열: setString, 정수: setInt
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getPassword());
			pstmt.setString(5, member.getPhone());
//			pstmt.setInt(6, member.getReservation_count());
			
			// DB에 수정이 발생할 때는 executeUpdate() 메소드를 사용한다 <- java.sql.PreparedStatement 클래스에 정의된 메소드
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // register()

}









