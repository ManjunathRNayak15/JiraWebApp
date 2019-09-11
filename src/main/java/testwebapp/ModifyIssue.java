package testwebapp;

import java.io.IOException;
import java.net.URI;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.atlassian.jira.rest.client.api.AuthenticationHandler;
import com.atlassian.jira.rest.client.api.IssueRestClient;
import com.atlassian.jira.rest.client.api.JiraRestClient;
import com.atlassian.jira.rest.client.api.domain.Issue;
import com.atlassian.jira.rest.client.auth.BasicHttpAuthenticationHandler;
import com.atlassian.jira.rest.client.internal.async.AsynchronousJiraRestClientFactory;

@WebServlet(urlPatterns = "/editissue.do")
public class ModifyIssue extends SearchIssues{
	static String issueKey = null;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException {
		String issueKey =(String) request.getParameter("issueKey");
		System.out.println(issueKey + " from modify class");
		ArrayList<String> issueDetails = new ArrayList<String>();
			issueDetails = edit(issueKey);
			request.setAttribute("issueDetails",issueDetails);
			request.getRequestDispatcher("/WEB-INF/views/editissue.jsp").forward(request,response);
			}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException {
	}
	ArrayList<String> edit(String issueKey){
		ArrayList<String> issueDetails = new ArrayList<String>();
		try {
		System.setProperty("javax.net.ssl.trustStore", "C:/Demo/myTrustStore");      
        String url =TestUserValidator.url;
        String userName =TestUserValidator.name;
        String password = TestUserValidator.password;
        URI jiraServerUri = URI.create(url);
        AsynchronousJiraRestClientFactory factory = new AsynchronousJiraRestClientFactory();
        AuthenticationHandler auth = new BasicHttpAuthenticationHandler(userName, password);
        JiraRestClient restClient = factory.create(jiraServerUri, auth);
        IssueRestClient issueClient = restClient.getIssueClient();
        Issue issue = issueClient.getIssue(issueKey).claim();
        issueDetails.add(issue.getKey());
        issueDetails.add(issue.getSummary());
        issueDetails.add(issue.getDescription());
		return issueDetails;
        }catch(NullPointerException e) {
        	System.out.println("Invalid Input");
        	return issueDetails;
        }
		catch(Exception e) {
        	e.printStackTrace();
        	return issueDetails;	
        }
	}
}