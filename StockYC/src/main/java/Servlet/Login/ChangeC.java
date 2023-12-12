package Servlet.Login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

import Servlet.DB.userDAO;

@WebServlet("/changeC.do")
public class ChangeC extends HttpServlet 
{
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("idKey");
		String pw = request.getParameter("password");
		Servlet.DB.userDAO mDao = new Servlet.DB.userDAO();
		mDao.loginUpdate(id, pw);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Profile.jsp");
		dispatcher.forward(request, response);
	}

}
