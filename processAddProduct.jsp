<%@page import="DAO.ProductRepository"%>
<%@page import="DTO.Product"%>
<%@page import="org.eclipse.jdt.internal.compiler.parser.ParserBasicInformation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String productId = request.getParameter("productId");
	String name = request.getParameter("name");
	String unitPrice = request.getParameter("unitPrice");
	int unitPrice_i = Integer.parseInt(unitPrice);
	
	String description = request.getParameter("description");
	String manufacturer = request.getParameter("manufacturer");
	String category = request.getParameter("category");
	String unitsInStock = request.getParameter("unitsInStock");
	int unitsInStock_i = Integer.parseInt(unitsInStock);
	String[] condition = request.getParameterValues("condition");
	String conditions = "";
	for(String c : condition){
		conditions += (c+", ");
	}
	

	Product product = new Product(
							productId, name,  unitPrice, description, manufacturer, category,
							unitsInStock, condition	);
	
	// 상품 정보 저장
	// ProductRepository 객체 생성을 제한 (싱글턴 패턴)
	ProductRepository pr = ProductRepository.getInstance();
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		try{
			if(productId.length() == 0)				throw new IllegalArgumentException("상품 코드 공란");	
			else if(productId.length() != 5)		throw new IllegalArgumentException("상품 코드 부적절");
			else if(name.length()==0) 				throw new IllegalArgumentException("상품명 공란");
			else if(name.length() > 255)			throw new IllegalArgumentException("상품명 부적절");
			else if(unitsInStock.length() == 0)		throw new IllegalArgumentException("재고 수 공란");
			else if(unitsInStock_i < 0) throw new IllegalArgumentException("재고 수 부적절");
			else if(unitPrice.length() == 0) 		throw new IllegalArgumentException("가격 공란");
			else if(0 <= unitPrice_i && unitPrice_i <= 100000) throw new IllegalArgumentException("가격 부적절");
			else{
%>
			
			<p>productId = <%=productId %></p>
			<p>name = <%=name %></p>
			<p>unitprice = <%=unitPrice %></p>
			<p>unitsInStock = <%=unitsInStock %></p>
				
<% 
			}
		}catch(IllegalArgumentException e){
			// 상품의 정보를 올바르게 입력하지 않았을 경우
			// 1. 상품의 정볼르 입력하지 않았다
			// 2. 상품의 코드는 5자여야 합니다.
			// 3. 상품명은 255자 이하여야 합니다.
			// 4. 가격은 0원 이상 1천만원 이하여야 합니다.
			// 5. 재고 수는 0 개 이상이어야 합니다.
			
			
			out.println("<p>상품 정보가 올바르지 않습니다. <a href=\"./addProduct.jsp\">되돌아가기</a></p>");
		}
%>		


</body>
</html>