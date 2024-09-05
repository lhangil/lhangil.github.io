package DAO;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import VO.userVO;
import util.ConnectionFactory;


public class userDAO { 

	/**
	 * 로그인여부 확인
	 * @param loginVO 조회할 id, password
	 * @return 조회된 MemberVO, 단 로그인 실패시 null 반환
	 */
	public userVO login(userVO loginVO) {
		
		StringBuilder sql = new StringBuilder();
		sql.append("select * ");
		sql.append("  from users ");
		sql.append(" where id = ? and password = ? ");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			System.out.println(loginVO);
			pstmt.setString(1, loginVO.getId());
			pstmt.setString(2, loginVO.getPassword());
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				String id 		= rs.getString("id");
				String password = rs.getString("password");
				String name 	= rs.getString("name");
				String email 	= rs.getString("email");
				String address	= rs.getString("address");
				String phone 	= rs.getString("phone");
				
				userVO member = new userVO();
				member.setId(id);
				member.setPassword(password);
				member.setName(name);
				member.setEmail(email);
				member.setAddress(address);
				member.setPhone(phone);
				
				return member;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	//회원가입
	public void register(userVO member) {
		StringBuilder sql = new StringBuilder(); // 스트링빌더는 항상 SQL과 사용 SQL이 담긴 문자열을 생성하기위해
		sql.append("insert into users ");
		sql.append(" values(?, ?, ?, ?, ?, ?) ");
		// 변수 sql에 위 2줄이 들어감 -> 이렇게 만들어진 sql 변수가 결국 prepareStatement의 매개변수로 들어감

		try( // try() <- 괄호 안에 DB 연결 관련 객체들을 생성하면 굳이 close 하러갈 필요가 없어서 편하다.
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString()); // 변수 sql의 자료형 StringBuilder -> String형으로 바꿔주기 위해서 toString()
		) { // sql문의 ?에 순서대로 값을 넣어주는 과정 -> 문자열: setString, 정수: setInt
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getAddress());
			pstmt.setString(6, member.getPhone());
			// DB에 수정이 발생할 때는 executeUpdate() 메소드를 사용한다 <- java.sql.PreparedStatement 클래스에 정의된 메소드
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // register()

}









