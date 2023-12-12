package Servlet.Login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login.do")
public class LoginC extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("loginId");
		String pw = request.getParameter("loginPassword");
		Servlet.DB.userDAO mDao = new Servlet.DB.userDAO();		
		boolean loginCheck = mDao.loginCheck(id, pw);
		HttpSession session = request.getSession();
		request.setAttribute("loginCheck", loginCheck);
		RequestDispatcher dispatcher;
	    if(loginCheck)
	    {
			session.setAttribute("idKey", id);
			dispatcher = request.getRequestDispatcher("Index.jsp");
		}
	    else
		{
	    	session.setAttribute("idKey", null);
	    	dispatcher = request.getRequestDispatcher("Login.jsp");
		}
	    dispatcher.forward(request, response);
	}
}
