package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.math.BigDecimal;

import VO.Menu11VO;
import util.ConnectionFactory;

public class Menu11DAO {

    /**
     * 메뉴 조회
     * @param menuId 조회할 메뉴 ID
     * @return 조회된 Menu11VO, 단 메뉴가 없을 시 null 반환
     */
    public Menu11VO getMenuById(String menuid) {  //menuid는 변수. 다른 곳에서 호출할 것임. getMenuById는 메서드이름.
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT * ");
        sql.append("FROM menu11 ");
        sql.append("WHERE menu_id = ?");

        try (
            Connection conn = new ConnectionFactory().getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql.toString());
        ) {
            pstmt.setString(1, menuid); // menuid를 호출하고 거기 들어간 값을 menu11 데이터베이스 1번재 컬럼 자리에 넣는다는 뜻.

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                String menu_id = rs.getString("menu_id");
                String menu_name = rs.getString("menu_name");
                int price = rs.getInt("price");
               

                Menu11VO menu = new Menu11VO(menu_id, menu_name, price);

                return menu;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    // 메뉴 등록
    public void addMenu(Menu11VO menu) {
        StringBuilder sql = new StringBuilder();
        sql.append("INSERT INTO menu11 ");
        sql.append("(menu_id, menu_name, description, price) ");
        sql.append("VALUES (?, ?, ?, ?, )");

        try (
            Connection conn = new ConnectionFactory().getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql.toString());
        ) {
            pstmt.setString(1, menu.getMenu_id());
            pstmt.setString(2, menu.getMenu_name());
            pstmt.setString(3, menu.getDescription());
            pstmt.setInt(4, menu.getPrice());
            

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
