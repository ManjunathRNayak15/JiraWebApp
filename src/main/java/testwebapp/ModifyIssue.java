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
/*
 * This class will get issue details to display in edit issue page*/
@WebServlet(urlPatterns = "/editissue.do")
public class ModifyIssue extends SearchIssues{
	static String issueKey = null;
	/*
	 * This Method will get the issue details to the page*/
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException {
		String issueKey =(String) request.getParameter("issueKey");
		System.out.println(issueKey + " from modify class");
		ArrayList<String> issueDetails = new ArrayList<String>();
			issueDetails = getIssue(issueKey);
			request.setAttribute("issueDetails",issueDetails);
			request.getRequestDispatcher("/WEB-INF/views/editissue.jsp").forward(request,response);
			}
	/*
	 * This Method will connect to jira and returns Issue using issue key*/
	ArrayList<String> getIssue(String issueKey){
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