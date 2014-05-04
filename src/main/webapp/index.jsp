<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Embedding forms :: index</title>
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"/>
</head>
<body>
    <%
        String login = request.getRemoteUser();
        if (StringUtils.isEmpty(login)) {
            response.sendRedirect("login.jsp");
        } else {
            String section = (String)session.getAttribute("section");
            if ("tasks".equals(section)) {

            } else {
%>
    <jsp:include page="startProcess.jsp"/>
<%
            }
    %>
    <%
    }
    %>
</body>
</html>