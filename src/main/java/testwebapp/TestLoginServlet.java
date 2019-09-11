package testwebapp;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/login.do")
public class TestLoginServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException {
		request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request,response);
		
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println(username+"  "+password);
		TestUserValidator validator = new TestUserValidator(username,password);
		String val = validator.validateUser();
		System.out.println(val);
		if(val.equals("wrongusnpsw")){
			String errorMessage = "Invalid Username or Passoword";
			request.setAttribute("errorMessage", errorMessage);
			request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request,response);
		}else {
		request.getRequestDispatcher("/WEB-INF/views/welcome.jsp").forward(request,response);
		}
}
}