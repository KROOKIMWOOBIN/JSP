package Servlet.Manager;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/memberdel")
public class MemberDel extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		Servlet.DB.userDAO mDao = new Servlet.DB.userDAO();
		mDao.loginResign(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Manager.jsp");
		dispatcher.forward(request, response);
	}

}
