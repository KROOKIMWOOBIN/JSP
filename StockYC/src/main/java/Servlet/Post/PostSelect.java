package Servlet.Post;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Servlet.DB.postDAO;
import Servlet.DB.postDTO;

@WebServlet("/postselect.do")
public class PostSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<postDTO> postList = null;
		postDAO dao = new postDAO();
		try 
		{
			postList = dao.getPostSelect();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
        request.setAttribute("postList", postList);
        
        // JSP로 포워딩
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Community.jsp");
        dispatcher.forward(request, response);
	}

}
