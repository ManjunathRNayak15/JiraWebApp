
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
	<link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/jumbotron/">
    <!-- Bootstrap core CSS -->
	<link href="style/welcomestyle.css" rel="stylesheet" type="text/css"/>
    <!-- Custom styles for this template -->
    <title>HomePage</title>
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
}
    </style>
  </head>
<body class="w3-light-grey">
<p style="text-align:center;"><font color='green' ><b>${successMessage}</b></font></p>

<!-- w3-content defines a container for fixed size centered content, 
and is wrapped around the whole page content, except for the footer in this example -->
<div class="w3-content" style="max-width:1400px">

<!-- Header -->
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

<!-- Grid -->
<div class="w3-row">

<!-- Blog entries -->
<div class="w3-col l8 s12">
  <!-- Blog entry -->
  <div class="w3-card-4 w3-margin w3-white">
    <img src="https://assets.entrepreneur.com/content/3x2/2000/20151215195453-business-leader-group-front-leadership-team-professionals-businesspeople.jpeg?width=700&crop=2:1" alt="Nature" style="width:100%">
    <div class="w3-container">
      <h3><b>About CRG</b></h3>
    </div>

    <div class="w3-container">
      <p>Since 1989, Corporate Renaissance Group has been delivering expert guidance and leading solutions to help 
			improve business management and performance. We are a group of business, financial and technology experts 
			helping leaders transform organizations. Globally, we have one goal: to improve enterprise performance.<br>
			<b>CRG Solutions</b> has been helping organizations transform the way they work by effectively implementing 
			business software and information solutions. We are an internationally recognized business consulting 
			firm specializing in enterprise resource planning, corporate performance management, business intelligence, 
			financial and costing principles, shared services and employee performance management.
			We have offices in Mumbai, Pune, Bengaluru & Gurgaon. Coming soon is also a dedicated delivery centre in 
			Kolkata.</p>
      <div class="w3-row">
        <div class="w3-col m8 s12">
         <p><a href="http://crgsolutions.co.in/"><button class="w3-button w3-padding-large w3-white w3-border" ><b>READ MORE »</b></button></a></p>
        </div>
      </div>
    </div>
  </div>
  <hr>

  <!-- Blog entry -->
  <div class="w3-card-4 w3-margin w3-white">
  <img src="https://developer.atlassian.com/cloud/jira/platform/images/jira-integration.png" alt="Norway" style="width:100%">
    <div class="w3-container">
      <h3><b>About This Application</b></h3>
    </div>

    <div class="w3-container">
      <p>This application is created to communicate to atlassian Jira through Rest Api.
      From this application we can perform many of the Read/Write operation on jira issues
      We can filter out the issue with respect to their projects and state(resolved or unresolved)
      and even we can update issue details from here. 
      To experience the application features click on search issue button</p>
      <div class="w3-row">
        <div class="w3-col m8 s12">
          <p><a href="/searchproject.do"><button class="w3-button w3-padding-large w3-white w3-border" ><b>Search Issue</b></button></a></p>
        </div>
      </div>
    </div>
  </div>
<!-- END BLOG ENTRIES -->
</div>

<!-- Introduction menu -->
<div class="w3-col l4">
  <!-- About Card -->
  <div class="w3-card w3-margin w3-margin-top">
  <img src="https://itplus.ae/wp-content/uploads/2018/08/Stack@2x.png" style="width:100%">
    <div class="w3-container w3-white">
      <h4><b>Our Works</b></h4>
      <p>We are a well known atlassian platinum solution partners.
      </p>
    </div>
  </div><hr>
  
  <!-- Posts -->
  <div class="w3-card w3-margin">
    <div class="w3-container w3-padding">
      <h4>Popular Atlassian Products</h4>
    </div>
    <ul class="w3-ul w3-hoverable w3-white">
     <a href="https://www.atlassian.com/software/jira" style="text-decoration:none;"> <li class="w3-padding-16">
        <img src="https://wac-cdn.atlassian.com/dam/jcr:e0cedee5-a180-40ad-b7c3-a66d6e60f483/jira-app-adg3.svg?cdnVersion=532" alt="Image" class="w3-left w3-margin-right" style="width:50px">
        <span class="w3-large">Atlassian JIRA</span><br>
        <span>Bug Tracking Tool</span>
      </li></a>
     <a href="https://www.atlassian.com/software/confluence" style="text-decoration:none;"><li class="w3-padding-16">
        <img src="data:image/jpeg;base64,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" alt="Image" class="w3-left w3-margin-right" style="width:50px">
        <span class="w3-large">Confluence</span><br>
        <span>Collaborative Tool</span>
      </li> </a>
      <a href="https://www.atlassian.com/software/bitbucket" style="text-decoration:none;"><li class="w3-padding-16">
        <img src="data:image/png;base64,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" alt="Image" class="w3-left w3-margin-right" style="width:50px">
        <span class="w3-large">Bitbucket</span><br>
        <span>Git Code Management</span>
      </li>   </a>
      <a href="https://www.atlassian.com/software/jira/service-desk" style="text-decoration:none;"><li class="w3-padding-16 w3-hide-medium w3-hide-small">
        <img src="https://pbs.twimg.com/profile_images/907268759500607489/ZUu4kQCr_400x400.jpg" alt="Image" class="w3-left w3-margin-right" style="width:50px">
        <span class="w3-large">Jira Service Desk</span><br>
        <span>Customer Interactive System</span>
      </li>  </a>
    </ul>
  </div>
  <hr> 
  
<!-- END Introduction Menu -->
</div>

<!-- END GRID -->
</div><br>

<!-- END w3-content -->
</div>
    
    <footer class="container">
      <p style="text-align:center;">&copy;CRG Solutions Pvt Ltd</p>
    </footer>
  </body>
</html>
