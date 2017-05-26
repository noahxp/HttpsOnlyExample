<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
out.print("<br>request.getServerName()=" + request.getServerName());

out.print("<br>request.getServerPort()=" + request.getServerPort());

out.print("<br>request.getRequestURI()=" + request.getRequestURI());

out.print("<br>request.getRequestURL()=" + request.getRequestURL().toString());

out.print("<br>request.getScheme()=" + request.getScheme());

out.print("<br>request.getLocalAddr()=" + request.getLocalAddr());

out.print("<br>request.getLocalPort()=" + request.getLocalPort());

out.print("<br>request.getLocalName()=" + request.getLocalName());

out.print("<br>request.getContextPath()=" + request.getContextPath() );

out.print("<br>request.getContentType()=" + request.getContentType());

out.print("<br>request.getMethod()=" + request.getMethod());

out.print("<br>request.getPathTranslated()=" + request.getPathTranslated());

out.print("<br>request.getPathInfo()=" + request.getPathInfo());

out.print("<br>x-forwarded-proto=" + request.getHeader("x-forwarded-proto"));

out.print("<br>getQueryString=" + request.getQueryString());


%>
<br>
<hr>
<%
Enumeration headerNames = request.getHeaderNames();
while (headerNames.hasMoreElements()) {
    String key = (String) headerNames.nextElement();
    String value = request.getHeader(key);
    out.print(key + "=" + value + "<br>");
}

%>


</body>
</html>