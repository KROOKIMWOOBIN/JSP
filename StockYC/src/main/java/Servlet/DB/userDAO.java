package Servlet.DB;

import java.lang.reflect.Member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import com.mysql.cj.Session;
import Servlet.DB.JDBCUtil;

public class userDAO 
{
	public List<userDTO> getMemberList() {
	    List<userDTO> memberList = new ArrayList<>();

	    Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
	    
	    try 
	    {
	    	conn = JDBCUtil.getConnection();
	    	String strQuery = "select * from users";
	        pstmt = conn.prepareStatement(strQuery);
	        ResultSet resultSet = pstmt.executeQuery(strQuery);
	        while (resultSet.next()) {
	            userDTO member = new userDTO();
	            member.setId(resultSet.getString("id"));
	            member.setPassword(resultSet.getString("pw"));
	            member.setName(resultSet.getString("username"));
	            member.setEmail(resultSet.getString("email"));
	            memberList.add(member);
	        }
	    } 
	    catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally 
        {
        	JDBCUtil.close(rs, pstmt, conn);
        }
	    return memberList;
	}
	
	public void loginResign(String id) 
	{
		Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
		try
		{
			conn = JDBCUtil.getConnection();
	        String strQuery = "delete from users where id = ?";
	        pstmt = conn.prepareStatement(strQuery);
	        pstmt.setString(1, id);
	        pstmt.executeUpdate();
		}
		catch(Exception ex)
		{
			System.out.println("Exception" + ex);
		}
		finally 
        {
        	JDBCUtil.close(rs, pstmt, conn);
        }
	}

	public void loginUpdate(String id, String password) 
	{
		Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try 
        {
			conn = JDBCUtil.getConnection();
            String strQuery = "update users set pw = ? where id = ?";
            pstmt = conn.prepareStatement(strQuery);
            pstmt.setString(1, password);
            pstmt.setString(2, id);
            pstmt.executeUpdate();
        } 
        catch (Exception ex) 
        {
            System.out.println("Exception" + ex);
        } 
        finally 
        {
        	JDBCUtil.close(rs, pstmt, conn);
        }
	}
	
    public boolean loginCheck(String id, String password) 
    {
    	Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean loginCon = false;
        try 
        {
			conn = JDBCUtil.getConnection();
            String strQuery = "select id, pw from users where id = ? and pw = ?";

            pstmt = conn.prepareStatement(strQuery);
            pstmt.setString(1, id);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();
            loginCon = rs.next();
        } 
        catch (Exception ex) 
        {
            System.out.println("Exception" + ex);
        } 
        finally 
        {
        	JDBCUtil.close(rs, pstmt, conn);
        }
        return loginCon;
    }	
	
	
    public boolean memberInsert(userDTO mDTO) 
    {
    	Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean flag = false;
        try 
        {
        	conn = JDBCUtil.getConnection();
            String strQuery = "insert into users values(?,?,?,?)";
            pstmt = conn.prepareStatement(strQuery);
            pstmt.setString(1, mDTO.getId());
            pstmt.setString(2, mDTO.getPassword());
            pstmt.setString(3, mDTO.getName());
            pstmt.setString(4, mDTO.getEmail());

            int count = pstmt.executeUpdate();

            if (count == 1) 
            {
                flag = true;
            }

        } 
        catch (Exception ex) 
        {
            System.out.println("Exception" + ex);
        }
        finally 
        {
        	JDBCUtil.close(rs, pstmt, conn);
        }
        return flag;
    }		
    
    public userDTO getData(String id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        userDTO dto = null;
        try {
            conn = JDBCUtil.getConnection();
            // 쿼리 작성
            String strQuery = "SELECT id, pw, username, email FROM users WHERE id = ?";
            pstmt = conn.prepareStatement(strQuery);
            pstmt.setString(1, id);
            // 쿼리 실행
            rs = pstmt.executeQuery();

            if (rs.next()) {
                // 결과값을 DTO 객체에 저장
                dto = new userDTO();
                dto.setName(rs.getString("username"));
                dto.setId(rs.getString("id"));
                dto.setPassword(rs.getString("pw"));
                dto.setEmail(rs.getString("email"));
            }
        } catch (Exception ex) {
        	System.out.println("Exception" + ex);
        } finally {
            // 사용한 자원들을 정리
        	JDBCUtil.close(rs, pstmt, conn);
        }

        return dto;
    }
}