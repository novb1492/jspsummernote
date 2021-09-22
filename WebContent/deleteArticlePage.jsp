<%@page import="java.util.Map"%>
<%@page import="board.boardService"%>
<%@page import="board.boardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
System.out.print("deleteArticlePage");
request.setCharacterEncoding("utf-8");

String aid=(String)request.getParameter("aid");
String email=(String)request.getSession().getAttribute("email");

boardDto boardDto=new boardDto();
boardDto.setId(Integer.parseInt(aid));


boardService boardService=new boardService();
Map<String,Object>map=boardService.deleteArticle(Integer.parseInt(aid), email);
if((boolean)map.get("flag")==false){
	System.out.print("실패");
%>
	<script>
	alert("<%=map.get("message")%>");
	location.href='getArticle.jsp?aid='+<%=aid%>;
	</script>
<%}else{
	response.sendRedirect("index.jsp");	
}
%>
