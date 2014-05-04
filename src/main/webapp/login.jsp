<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Embedding Forms sample :: login</title>
</head>
<body>
login
    <form action="j_security_check" method="POST">
        <p>
            <label>UserName</label>
            <input value="" name="j_username" class="text-input" type="text" autofocus/>
        </p>
        <br style="clear: both;"/>

        <p>
            <label>Password</label>
            <input name="j_password" class="text-input" type="password"/>
        </p>
        <br style="clear: both;"/>
        <p>
            <input class="button" type="submit" value="Sign In"/>
        </p>
    </form>
</body>
</html>