package Servlet.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class postDAO {
	public List<postDTO> getPostSelect() {
	    List<postDTO> postList = new ArrayList<>();

	    Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
	    
	    try 
	    {
	    	conn = JDBCUtil.getConnection();
	    	String strQuery = "select * from post";
	        pstmt = conn.prepareStatement(strQuery);
	        ResultSet resultSet = pstmt.executeQuery(strQuery);
	        while (resultSet.next()) {
	            postDTO post = new postDTO();
	            post.setPostId(resultSet.getInt("post_id"));
	            post.setUserId(resultSet.getString("user_id"));
	            post.setTitle(resultSet.getString("title"));
	            post.setContent(resultSet.getString("content"));
	            postList.add(post);
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
	    return postList;
	}
	public void postInsert(postDTO pDTO) 
    {
    	Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try 
        {
        	conn = JDBCUtil.getConnection();
            String strQuery = "INSERT INTO post (user_id, title, content) VALUES (?,?,?)";
            pstmt = conn.prepareStatement(strQuery);
            pstmt.setString(1, pDTO.getUserId());
            pstmt.setString(2, pDTO.getTitle());
            pstmt.setString(3, pDTO.getContent());

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
	public void postResign(String id) 
	{
		Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
		try
		{
			conn = JDBCUtil.getConnection();
	        String strQuery = "delete from post where post_id = ?";
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
	public void postUpdate(String id, String title, String content) {
		Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try 
        {
			conn = JDBCUtil.getConnection();
            String strQuery = "update post set title = ?, content = ? where post_id = ?";
            pstmt = conn.prepareStatement(strQuery);
            pstmt.setString(1, title);
            pstmt.setString(2, content);
            pstmt.setString(3, id);
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

}
