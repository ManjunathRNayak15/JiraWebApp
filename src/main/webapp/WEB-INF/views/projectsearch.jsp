<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*" import="testwebapp.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
	<link rel="stylesheet" type="text/css" href="SelectProject.css">
<title>Project List</title>
<style>
  /* Style the header with a grey background and some padding */
.header {
  overflow: hidden;
  background-color: #f1f1f1;
  padding: 8px 12px;
}

/* Style the header links */
.header a {
  float: left;
  color: black;
  text-align: center;
  padding: 12px;
  text-decoration: none;
  font-size: 18px;
  line-height: 25px;
  border-radius: 4px;
}

/* Style the logo link (notice that we set the same value of line-height and font-size to prevent the header to increase when the font gets bigger */
.header a.logo {
  font-size: 25px;
  font-weight: bold;
}

/* Change the background color on mouse-over */
.header a:hover {
  background-color: #ddd;
  color: black;
}

/* Float the link section to the right */
.header-right {
  float: right;
}

/* Add media queries for responsiveness - when the screen is 500px wide or less, stack the links on top of each other */
@media screen and (max-width: 500px) {
  .header a {
    float: none;
    display: block;
    text-align: left;
  }
  .header-right {
    float: none;
  }
}</style>
</head>

<body class="w3-dark-blue">
<header>
<div class="header">
  <a href="/home.do" class="logo"><img src="https://www.crgsolutions.co.in/wp-content/uploads/2018/10/CRG-Logo.png"></a>
  <div class="header-right">
    <a  href="/searchproject.do">Search</a>
    <a href="http://ec2-54-165-176-246.compute-1.amazonaws.com:8080/">Jira</a>
  <a href="/logout.do">LogOut</a>
  </div>
</div>
</header>
<br>
<div style=text-align:center><h3>From the below drop-down tabs choose which <b>Project</b> will include the list
of issues to <b>Read</b>.</h3></div>
<div style="text-align:center">
<form action="/searchissue.do" method="post">

<%ArrayList<String> projectList = (ArrayList) request.getAttribute("list");%>
<div style="width: 20px;
    height: 31px;
    display: inline;
    float: middle;
    vertical-align: middle;
    border: transperant;">
<select name="project">
<%
// Iterating through subjectList
if(request.getAttribute("list") != null){  // Null check for the object
 Iterator<String> iterator = projectList.iterator();  // Iterator interface
 while(iterator.hasNext())  // iterate through all the data until the last record
 {
 String projectname = iterator.next(); 
 out.println(projectname);
 %>
 <option value = "<%= projectname%>"><%= projectname %></option>
 <%}
 }%>
 </select></div><div style=" width: 20px;
    height: 31px;
    display: inline;
    float: middle;
    vertical-align: middle;">
 <select name="issuestate">
 <option>Resolved</option>
 <option>Unresolved</option>
 </select></div>
 <button type="submit" href= "/searchissue.do">Search</button>
</form>
</div>
</body>
<footer class="container">
      <p style="text-align:center;">&copy;CRG Solutions Pvt Ltd</p>
</footer>
</html>