<%@page import="crawl.CrawlDTO"%>
<%@page import="crawl.CrawlDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	CrawlDAO crawlDAO = CrawlDAO.getInstance();
	List<CrawlDTO> list = crawlDAO.getCrawlList();
%>
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
</style>
</head>
<body>
	<table border="1" >
		<caption>기사 리스트</caption>
		<tr>
			<th>제목</th>
			<th>링크</th>
			<th>내용</th>
			<th>이미지</th>
			<th>작성자</th>
		</tr>
		<tr>
		<%
			for (CrawlDTO crawlDTO:list ) {
		%>
			<td><%=crawlDTO.getArti_tit()%></td>
		
			<td><%=crawlDTO.getArti_link()%></td>
		
			<td><%=crawlDTO.getArti_text()%></td>
		
			<td><%=crawlDTO.getArti_img()%></td>
		
			<td><%=crawlDTO.getArti_date()%></td>
		</tr>
		<%
			}
		%>
	</table>
	<br />
</body>
</html>