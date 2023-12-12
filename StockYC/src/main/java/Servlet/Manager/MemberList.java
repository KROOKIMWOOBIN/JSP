package Servlet.Manager;

import java.io.IOException;
import java.lang.reflect.Member;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Servlet.DB.userDAO;
import Servlet.DB.userDTO;

@WebServlet("/memberlist")
public class MemberList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<userDTO> memberList = null;
		userDAO dao = new userDAO();
		try 
		{
			memberList = dao.getMemberList();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
        request.setAttribute("memberList", memberList);
        
        // JSP로 포워딩
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Manager.jsp");
        dispatcher.forward(request, response);
	}
}
