package testwebapp;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.atlassian.jira.rest.client.api.AuthenticationHandler;
import com.atlassian.jira.rest.client.api.IssueRestClient;
import com.atlassian.jira.rest.client.api.JiraRestClient;
import com.atlassian.jira.rest.client.api.domain.Comment;
import com.atlassian.jira.rest.client.api.domain.Issue;
import com.atlassian.jira.rest.client.api.domain.input.IssueInput;
import com.atlassian.jira.rest.client.api.domain.input.IssueInputBuilder;
import com.atlassian.jira.rest.client.auth.BasicHttpAuthenticationHandler;
import com.atlassian.jira.rest.client.internal.async.AsynchronousJiraRestClientFactory;

@WebServlet(urlPatterns = "/submitedits.do")
public class SubmitEdits extends ModifyIssue {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException {
		
		}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException {
		String summary =(String) request.getParameter("sum");
		String description =(String) request.getParameter("desc");
		System.out.println(summary +" "+description);
		String key =(String) request.getParameter("key");
		String comment = (String) request.getParameter("comment");
		modify(key,summary,description,comment);
		request.getRequestDispatcher("/WEB-INF/views/welcome.jsp").forward(request,response);
		
	}
	void modify(String issueKey,String sum, String desc, String comment){
		System.setProperty("javax.net.ssl.trustStore", "C:/Demo/myTrustStore");      
		String url =TestUserValidator.url;
        String userName =TestUserValidator.name;
        String password = TestUserValidator.password;
        String projectKey = getProjectKey(issueKey);
        long issueTypeId = getIssueTypeId(issueKey);
        System.out.println(projectKey);
        try {
        //InputStream is =  new FileInputStream("/home/manjunath/Desktop/web-appdata/1.png");
        URI jiraServerUri = URI.create(url);
        AsynchronousJiraRestClientFactory factory = new AsynchronousJiraRestClientFactory();
        AuthenticationHandler auth = new BasicHttpAuthenticationHandler(userName, password);
        JiraRestClient restClient = factory.create(jiraServerUri, auth);
        IssueRestClient issueClient = restClient.getIssueClient();
        IssueInputBuilder iib = new IssueInputBuilder(projectKey,issueTypeId);
        iib.setSummary(sum);
        iib.setDescription(desc);
		IssueInput issue = iib.build();
   	 	issueClient.updateIssue(issueKey, issue).claim();
   	 	Issue iss = issueClient.getIssue(issueKey).claim();
   	 	issueClient.addComment( iss.getCommentsUri(), Comment.valueOf(comment) ).claim();
   	 //	issueClient.addAttachment( iss.getAttachmentsUri(), is, "AScreenshot123.png");
   	 	System.out.println(iss.getSummary());
		}catch(Exception e){
			System.out.println("Exception occured while updating");
		}
	}
	private long getIssueTypeId(String issueKey) {
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
		long issueTypeId =  issue.getIssueType().getId();
		System.out.println(issueTypeId);
		return issueTypeId;
	}
	private String getProjectKey(String issueKey) {
		char c = 0;
		String projectKey = "";
		for(int i=0;i<issueKey.length();i++) {
			c = issueKey.charAt(i);
			if(c == '-') {
				break;
			}
			projectKey = projectKey + c;
		}
		return projectKey;
	}
}
