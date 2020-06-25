<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="/favicon.png">
<title>Insert title here</title>
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
	<table>
		<caption>등교 중단 학교</caption>
		<tr>
			<th>학교명</th>
			<th>경도</th>
			<th>위도</th>
			<th>운영</th>
			<th>주소</th>
		</tr>
		
		<c:forEach items="${list}" var="dto">
		<tr>
			<td>${dto.sh_name}</td>
			<td>${dto.sh_location1 }</td>
			<td>${dto.sh_location2 }</td>
			<td>${dto.sh_state }</td>
			<td>${dto.sh_address2 }</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>