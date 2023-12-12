package Servlet.Post;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/postdelect.do")
public class PostDelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		Servlet.DB.postDAO pDao = new Servlet.DB.postDAO();
		pDao.postResign(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Community.jsp");
		dispatcher.forward(request, response);
	}

}
