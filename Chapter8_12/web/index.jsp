<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- scripting taglib directive tells the Container i am going to use this TLD
	and in this JSP when i want to use function from this TLD, i am going prefix with this name 
	The uri tells thye Container the name of the TLD (which does NOT have to be same of the FILE!!)
	, which the Container needs so it knows which method to call to call when JSP invokes the EL function-->
<%@ taglib prefix="mine" uri="DiceFunctions"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Main Page</title>
</head>
<body>
	<!--  Create a Cookie named userName and give a value -->
	<% Cookie just_made = new Cookie("userName","Andrius"); %>
	<!--  with implicit object response add a Cookie -->
	<% response.addCookie(just_made); %>
	<!--  using request object get all cookies, we cannot get just name-value pair cookie -->
	<!--  we have to go whole Cookie array and iterate it ourselves -->
	<h1>Using Scripting to get Cookie, Hard way:</h1>
	<% Cookie[] cookies = request.getCookies(); 
		
	for (int i = 0; i < cookies.length; i++){
		if(cookies[i].getName().equals("userName")){
			out.println(cookies[i].getValue());
		}
	} %>
	<hr>
	<!--  But now with EL, we got the Cookie implicit object, WAY WAY easier
	Just give it the name, and the value come back from the Map of Cookie names/values -->
	<h1>Using EL implicit object cookie:</h1>
	${cookie.userName.value}
	<hr>
	<!--  get context-param from DD using scripting -->
	<h2>Get context-param using scripting:</h2>
	email is: <%= application.getInitParameter("mainEmail")  %>
	<!-- Same thing get context param but this time using EL , no scripting -->
	<hr>
	<h2>Get context-param NO scripting just EL:</h2>
	<!--  servlet init-params are configured using init-param, but the EL implicit "initParam
	is for CONTEXT params!!! -->
	email is: ${initParam.mainEmail}
	<hr>
	<h1>Rolling a dice... </h1><br>
	${mine:rollIt()} <!-- ${prefix:name} name you define in tld file in <function><name> elements -->
</body>
</html>