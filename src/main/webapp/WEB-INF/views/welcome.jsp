<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>Welcome</title>
</head>
<body>
<h1>
	User logged in as ${userName}
</h1>

<a href="logout"><input type="button" value="Logout"/></a>

</body>
</html>
