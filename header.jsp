<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String active = request.getParameter("active");
	
	String welcomeClass="";
	String productsClass="";
	
	if(active == null || active.equals("welcome")){
		welcomeClass = "class=\"active\"";
	} else if(active.equals("products")){
		productsClass = "class=\"active\"";
	}
%>


	<nav class="navbar navbar-fixed-top navbar-inverse">
		<div class="container">
			<div class="collapse navbar-collapse" id="navbar">
				<ul class="nav navbar-nav">
					<li <%=welcomeClass %>><a class="navbar-brand" href="./welcome.jsp?active=welcome">HOME</a></li>
					<li <%=productsClass %>><a class="navbar-brand" href="./products.jsp?active=products">상품목록</a></li>
					<li><a class="navbar-brand" href="#">메뉴2</a></li>
					<li><a class="navbar-brand" href="#">메뉴3</a></li>
				</ul>
			</div>
		</div>
	</nav>