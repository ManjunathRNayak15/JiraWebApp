<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= "java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">  
<meta charset="UTF-8">
<title>Edit Issue</title>
<style>
body{}
table{
font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
  text-align:left;
}
textarea {
 width: 350px;
 height: 150px;
 font-size: 1em;;
 font-family: Verdana, Arial, Helvetica, sans-serif;
 border: .5px solid black;
}
input{
    background: transparent;
    border: none;
}
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
}
.container{
width:100%}
</style>
</head>
<body>
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
<%try{ %>
<%ArrayList<String> issueDetails=(ArrayList)request.getAttribute("issueDetails");
String summary = issueDetails.get(1); %>

<form action="/submitedits.do" method="post">
<div class="container">  
<h1 style=" text-align: center; color: black;">Issue Edit Screen</h1>  
<table class="table table-stripeds" style="width:80%">  
  <tr style="color:black;"><th>Issue Id</th><th>Summary</th><th>Description</th><th>Comment</th></tr>  
  <tr><td><input readonly value="<%=issueDetails.get(0)%>" name="key"></td>
	<td ><textarea name="sum" required><%=summary %></textarea></td>
	<td ><textarea name="desc" required><%=issueDetails.get(2)%></textarea></td>
	<td ><textarea name="comment" placeholder="Add your comment here"></textarea></td></tr>  
</table>
<div style="text-align:right;" ><button type="submit" style="background-color:blue; border-radius: 14px;">
<h4 style="color:white" onclick="alert('Issue will be Updated')">Submit</h4></button></div>
</div>
</form>

<div>
            <h3> Choose File to Upload in Server </h3>
            <form action="uploadfile.do" method="post" enctype="multipart/form-data">
                <input type="file" name="file" />
                <input type="submit" value="upload" />
            </form>          
</div>
<%}catch(Exception e){
%><p>Error occured</p>
<a href="/logout.do">Click here to go to login page</a>
<%	}%>
<footer class="container">
      <p style="text-align:center;">&copy;CRG Solutions Pvt Ltd</p>
    </footer>
</body>
</html>