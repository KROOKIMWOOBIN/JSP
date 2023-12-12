package Servlet.Post;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet("/postinsert.do")
public class PostInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Servlet.DB.postDTO pDTO = new Servlet.DB.postDTO();
		HttpSession session = request.getSession();
		pDTO.setUserId((String)session.getAttribute("idKey"));
		pDTO.setTitle(request.getParameter("title"));
		pDTO.setContent(request.getParameter("content"));
		
		Servlet.DB.postDAO pDao = new Servlet.DB.postDAO();
		pDao.postInsert(pDTO);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Community.jsp");
		dispatcher.forward(request, response);
	}

}
