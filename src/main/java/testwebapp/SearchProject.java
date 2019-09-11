package testwebapp;

import com.atlassian.jira.rest.client.api.JiraRestClient;
import com.atlassian.jira.rest.client.api.JiraRestClientFactory;
import com.atlassian.jira.rest.client.api.domain.BasicProject;
import com.atlassian.jira.rest.client.api.domain.User;
import com.atlassian.jira.rest.client.internal.async.AsynchronousJiraRestClientFactory;
import com.atlassian.util.concurrent.Promise;

import java.io.IOException;
import java.net.URI;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = "/searchproject.do")
public class SearchProject extends TestUserValidator {

    public static void main(String[] args) {
    	System.out.println("get going");
		try{
			getProject();
		}catch(Exception e) {
			
		}
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException {
		ArrayList<String> list = getProject();
		request.setAttribute("list",list);
		request.getRequestDispatcher("/WEB-INF/views/projectsearch.jsp").forward(request,response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException {
		
	}
	public static ArrayList<String> getProject() {
		try {
	        // Construct the JRJC client
	        JiraRestClientFactory factory = new AsynchronousJiraRestClientFactory();
	        URI uri = new URI(TestUserValidator.url);
	        JiraRestClient client = factory.createWithBasicHttpAuthentication(uri,TestUserValidator.name, TestUserValidator.password);
	        Promise<User> promise = client.getUserClient().getUser(TestUserValidator.name);
	        User user = promise.claim();
	        // Invoke the JRJC Client
	        ArrayList<String> projectList = new ArrayList<String>();
	        for (BasicProject project : client.getProjectClient().getAllProjects().claim()) {
	            projectList.add(project.getName());
	        }
	        Iterator<String> it = projectList.iterator();
	        while(it.hasNext()) {
	        	System.out.println(it.next());
	        }
	        return projectList;
	    	}catch(Exception e) {
	    		e.printStackTrace();
	    	}
		return null;
	}
}