package Servlet.Login;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/joinC.do")
public class JoinC extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		String name = request.getParameter("name");
		String email = request.getParameter("email");

		Servlet.DB.userDTO mDto = new Servlet.DB.userDTO();
		mDto.setId(id);
		mDto.setPassword(pw);
		mDto.setName(name);
		mDto.setEmail(email);		
		
		Servlet.DB.userDAO mDao = new Servlet.DB.userDAO();	
		boolean insertCheck = mDao.memberInsert(mDto);

	    if(insertCheck)
	    {
	    	request.setAttribute("joinResult", insertCheck);
			HttpSession session = request.getSession();
			RequestDispatcher dispatcher = request.getRequestDispatcher("Index.jsp");
			dispatcher.forward(request, response);
		}
	    else
		{
	    	request.setAttribute("joinResult", 0);
			RequestDispatcher dispatcher = request.getRequestDispatcher("Register.jsp");
			dispatcher.forward(request, response);
		}     
	}
}
