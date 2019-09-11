package testwebapp;

import java.net.URI;
import java.util.ArrayList;

import com.atlassian.jira.rest.client.api.JiraRestClient;
import com.atlassian.jira.rest.client.api.JiraRestClientFactory;
import com.atlassian.jira.rest.client.api.RestClientException;
import com.atlassian.jira.rest.client.api.domain.BasicProject;
import com.atlassian.jira.rest.client.api.domain.User;
import com.atlassian.jira.rest.client.internal.async.AsynchronousJiraRestClientFactory;
import com.atlassian.util.concurrent.Promise;

public class TestUserValidator extends TestLoginServlet {
	static String name, password;
	TestUserValidator(String name,String password){
		TestUserValidator.name = name;
		TestUserValidator.password = password;
	}
	/*static String name="admin";
	static String password = "admin";
	*/
	static String url = "http://ec2-54-165-176-246.compute-1.amazonaws.com:8080";
	 public TestUserValidator() {
		// TODO Auto-generated constructor stub
	}
	public String validateUser() {
        ArrayList<String> list = new ArrayList<String>();
        try {
            // Construct the JRJC client
            JiraRestClientFactory factory = new AsynchronousJiraRestClientFactory();
            URI uri = new URI(url);
            JiraRestClient client = factory.createWithBasicHttpAuthentication(uri, name,password);

            // Invoke the JRJC Client
            Promise<User> promise = client.getUserClient().getUser("admin");

            for (BasicProject project : client.getProjectClient().getAllProjects().claim()) {
                 list.add(project.getKey());
                 System.out.println("Logged In");
                 return "string";
            }  
        	}catch(RestClientException e) {
        		e.printStackTrace();
        		return "wrongusnpsw";
        	}
        catch(Exception e) {
        		return "null";
        	}
		return "null";
}
}
