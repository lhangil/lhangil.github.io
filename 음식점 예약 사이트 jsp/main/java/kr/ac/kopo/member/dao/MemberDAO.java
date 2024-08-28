package kr.ac.kopo.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.util.ConnectionFactory;

public class MemberDAO {

	/**
	 * 로그인여부 확인
	 * @param loginVO 조회할 id, password
	 * @return 조회된 MemberVO, 단 로그인 실패시 null 반환
	 */
	public MemberVO login(MemberVO loginVO) {
		
		StringBuilder sql = new StringBuilder();
		sql.append("select id, password, name, type ");
		sql.append("  from t_member ");
		sql.append(" where id = ? and password = ? ");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setString(1, loginVO.getId());
			pstmt.setString(2, loginVO.getPassword());
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				String id 		= rs.getString("id");
				String password = rs.getString("password");
				String name 	= rs.getString("name");
				String type 	= rs.getString("type");
				
				MemberVO member = new MemberVO();
				member.setId(id);
				member.setPassword(password);
				member.setName(name);
				member.setType(type);
				
				return member;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
}








