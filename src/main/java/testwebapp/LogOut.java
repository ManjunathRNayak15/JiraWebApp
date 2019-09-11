package testwebapp;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = "/logout.do")
public class LogOut extends SubmitEdits{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException {
		String name = "null";
		String password = "null";
		System.out.println("Qwatley");
		request.getSession().invalidate();
		TestUserValidator t = new TestUserValidator(name,password);
		request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request,response);
	}
}
