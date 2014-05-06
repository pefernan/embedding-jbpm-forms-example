<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Embedding forms :: index</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">

    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/jbpm-rest-integration.js"></script>
    <script type="text/javascript">
        $(function() {
            var baseURL = '<%=request.getContextPath()%>/content/';
            //load content for first tab and initialize
            $('#startProcess').load(baseURL+'startProcess.jsp', function() {
                $('#myTabs').tab(); //initialize tabs
            });
            $('#myTabs').bind('show', function(e) {
                var pattern=/#.+/gi //use regex to get anchor(==selector)
                var contentID = e.target.toString().match(pattern)[0]; //get anchor
                //load content for selected tab
                $(contentID).load(baseURL+contentID.replace('#','')+".jsp", function(){
                    $('#myTabs').tab(); //reinitialize tabs
                });
            });
        });
    </script>
</head>
<body>
    <%
        String login = request.getRemoteUser();
        if (StringUtils.isEmpty(login)) {
            response.sendRedirect("login.jsp");
        } else {
    %>
    <div class="navbar navbar navbar-fixed-top">
        <div class="navbar-inner">
            <div class="nav pull-right">
                <p class="navbar-text" style="padding-right: 20px;o "><b>Hi katy (<a href="logout.jsp" class="navbar-link">logout</a>)</b></p>
            </div>
        </div>
    </div>
    <div class="tabbable">
        <ul class="nav nav-tabs" id="myTabs">
            <li class="active">
                <a href="#startProcess" data-toggle="tab">Start process</a>
            </li>
            <li>
                <a href="#taskList" data-toggle="tab">Task list</a>
            </li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="startProcess"></div>
            <div class="tab-pane" id="taskList"></div>
        </div>
    </div>
    <%
    }
    %>
</body>
</html>