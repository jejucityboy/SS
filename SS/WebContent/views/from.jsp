<%@page import="crawl.CrawlDTO"%>
<%@page import="crawl.CrawlDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	CrawlDAO crawlDAO = CrawlDAO.getInstance();
List<CrawlDTO> list = crawlDAO.getCrawlList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴스 기사 크롤링</title>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap"
	rel="stylesheet">
<style type="text/css">
body {
	font-family: 'Nanum Myeongjo', serif;
}

a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: #881ca3;
	text-decoration: none;
}

a:hover {
	color: #349eeb;
	text-decoration: underline;
}
</style>
</head>
<body>
	<div
		style="overflow: scroll; width: 369px; height: 600px; border: 1px solid; padding: 15px;">
		
		<table border=1 align=center cellspacing=0 cellpadding=0 width=360 height=80 >
			<%
				for (CrawlDTO crawlDTO : list) {
			%>
		
			<tr>
			<td>
			<img alt="news_img" src="<%=crawlDTO.getArti_img()%>" style="width: 80px; height: 80px;" />
			
			</td>
			<td>
			<a href="<%=crawlDTO.getArti_link()%>">
			<span
				style="font-weight: bold; font-size: 14px"><%=crawlDTO.getArti_tit()%>
			</span>
			<span
				style="font-weight: bold; font-size: 14px"><%=crawlDTO.getArti_date()%>
			</span>
			</a>
			
			</td>
			</tr>
		</div>
		<% } %>
		</table>
		
</body>
</html>