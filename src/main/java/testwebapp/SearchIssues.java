package testwebapp;

import com.atlassian.jira.rest.client.api.AuthenticationHandler;
import com.atlassian.jira.rest.client.api.JiraRestClient;
import com.atlassian.jira.rest.client.api.RestClientException;
import com.atlassian.jira.rest.client.api.domain.Issue;
import com.atlassian.jira.rest.client.api.domain.SearchResult;
import com.atlassian.jira.rest.client.auth.BasicHttpAuthenticationHandler;
import com.atlassian.jira.rest.client.internal.async.AsynchronousJiraRestClientFactory;
import com.atlassian.util.concurrent.Promise;

import java.io.IOException;
import java.net.URI;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/searchissue.do")
public class SearchIssues extends SearchProject {

    public static void main(String[] args) {
    	/*try {
    		System.out.println("hey hey hey");
			ArrayList<String> list = searchResult("project=RAP");
			Iterator it = list.iterator();
			while(it.hasNext()) {
				System.out.println(it.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}*/
	}
    
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException {
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException {
		ArrayList<ArrayList> list;
		String projectName=request.getParameter("project");
		System.out.println(projectName);
		String issueState = null;
		if(request.getParameter("issuestate").equals("Resolved")) {
			issueState = "resolution is not EMPTY";
		}else {
			issueState = "resolution is EMPTY";
		}
		String jql = "project in ( '"+projectName+"') AND "+issueState;
		System.out.println(jql);
			list = searchResult(jql);
			request.setAttribute("list",list);
			request.getRequestDispatcher("/WEB-INF/views/issuesearch.jsp").forward(request,response);
	}
	public static  ArrayList<ArrayList> searchResult(String jql) {
		ArrayList<ArrayList> list = new ArrayList<ArrayList>();
        try {   
		System.setProperty("javax.net.ssl.trustStore", "C:/Demo/myTrustStore");
        String url = TestUserValidator.url;
        String userName = TestUserValidator.name;
        String password = TestUserValidator.password;
        URI jiraServerUri = URI.create(url);
        AsynchronousJiraRestClientFactory factory = new AsynchronousJiraRestClientFactory();
        AuthenticationHandler auth = new BasicHttpAuthenticationHandler(userName, password);
        JiraRestClient restClient = factory.create(jiraServerUri, auth);  
        	ArrayList<String> issueKey=new ArrayList<String>();	
        	ArrayList<String> summary = new ArrayList<String>();
        	ArrayList<String> status = new ArrayList<String>();
        	ArrayList<String> issueType = new ArrayList<String>();
        	ArrayList<String> description = new ArrayList<String>();
        	Promise<SearchResult> searchJqlPromiseTest = restClient.getSearchClient().searchJql(jql);
        	for (Issue issue : searchJqlPromiseTest.claim().getIssues()) {
        		issueKey.add(issue.getKey());
        	    summary.add( issue.getSummary());
        	    description.add( issue.getDescription());
        	    status.add( issue.getStatus().getName());
        	    issueType.add( issue.getIssueType().getName());
        	}
        	list.add(issueKey);
        	list.add(summary);
        	list.add(description);
        	list.add(status);
        	list.add(issueType);
        	return list;
        }catch(RestClientException r) {
        	return list;
        }
        catch(Exception e) {
        	return list;
        }
	}
}