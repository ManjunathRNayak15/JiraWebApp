<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<title>Result Issues</title>
<style>
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 80%;
  text-align:center;
}
table {
border:0px;}
#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  background-color: #4CAF50;
  color: white;
}
 table.center {
    margin-left:auto; 
    margin-right:auto;
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
.RNNXgb {
    background: #fff;
    display: flex;
    border-radius: 8px;
    border: 1px solid #dfe1e5;
    box-shadow: none;
    height: 39px;
    width: 638px;
    border-radius: 24px;
    z-index: 3;
    height: 44px;
    margin: 0 auto;
}
.SDkEP {
    flex: 1;
    display: flex;
    padding: 5px 4px 0 16px;
    padding-left: 20px;
}
.a4bIc {
    display: flex;
    flex: 1;
    flex-wrap: wrap;
}
.vdLsw {
    color: transparent;
    flex: 100%;
    white-space: pre;
}
.gLFyf {
    background-color: transparent;
    border: none;
    margin: 0;
    padding: 0;
    color: rgba(0,0,0,.87);
    word-wrap: break-word;
    outline: none;
    display: flex;
    flex: 100%;
    -webkit-tap-highlight-color: transparent;
    margin-top: -37px;
}
.gsfi, .lst {
    font: 16px arial,sans-serif;
    line-height: 34px;
    height: 34px !important;
}
.Tg7LZd {
    border-radius: 0 8px 8px 0;
    outline: none;
    flex: 0 0 auto;
    padding-right: 13px;
    background:transparent;
    border-color: transparent;
}
.rINcab {
    background: none;
    color: #4285f4;
    height: 24px;
    width: 24px;
    margin: auto;
}
.z1asCe {
    display: inline-block;
    fill: currentColor;
    height: 24px;
    line-height: 24px;
    position: relative;
    width: 24px;
}
.z1asCe svg {
    display: block;
    height: 100%;
    width: 100%;
}
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

<br><br>
<form action="/editissue.do" name="issueKey">
<div class="RNNXgb" jsname="RNNXgb">
<div class="SDkEP">
<div jscontroller="iDPoPb" class="a4bIc" jsname="gLFyf" jsaction="h5M12e;input:d3sQLd;focus:dFyQEf;blur:jI3wzf">
<div class="vdLsw gsfi" jsname="vdLsw"></div>
<input class="gLFyf gsfi" name="issueKey" maxlength="2048" name="q" type="text" 
jsaction="paste:puy29d" placeholder="Enter The Issue Key to Edit" title="Search" required></div>
 <div class="dRYYxd">
 <div jscontroller="MC8mtf" class="JC0tCe" aria-label="Search by voice" role="button" tabindex="0" jsaction="h5M12e;rcuQ6b:npT2md">
 <span class="hb2Smf"></span></div></div></div> 
<button class="Tg7LZd" jsname="Tg7LZd" aria-label="Google Search" type="submit" data-ved="0ahUKEwiE5uyE4qLkAhVIfX0KHeF8CvwQ4dUDCAo"> 
<div class="rINcab"> <span class="z1asCe MZy1Rb"><svg focusable="false" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
<path d="M15.5 14h-.79l-.28-.27A6.471 6.471 0 0 0 16 9.5 6.5 6.5 0 1 0 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path>
</svg></span> </div> </button>  </div>

<h1 style="text-align: center; color: black;
  text-shadow: 2px 2px 4px #000000;">Jira Requests List</h1>
<table align=center class="table" id="customers">
  <thead>
    <tr>
      <th scope="col">IssueKey</th>
      <th scope="col">Summary</th>
      <th scope="col">Description</th>
      <th scope="col">Status</th>
      <th scope="col">IssueType</th> 
    </tr>
  </thead>
  <tbody>
<% ArrayList<ArrayList> issueList =  (ArrayList)request.getAttribute("list"); 
Iterator issueKey=issueList.get(0).iterator();	
ArrayList<String> summary =issueList.get(1);
ArrayList<String> status = issueList.get(3);
ArrayList<String> issueType = issueList.get(4);
ArrayList<String> description = issueList.get(2);
int i = 0;
String key=null;
while(issueKey.hasNext()){%>
    <tr>
    <% key = (String) issueKey.next(); %>
      <td><%=key%></td>
      <td><%= summary.get(i)	%></td>
      <td><%= description.get(i) %></td>
      <td><%= status.get(i) %></td>
      <td><%= issueType.get(i) %></td>
    </tr>
    <% i++;
    }%>
  </tbody>
</table>
</form>
<footer class="container">
      <p style="text-align:center;">&copy;CRG Solutions Pvt Ltd</p>
    </footer>
</body>
</html>