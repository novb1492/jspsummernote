<%@page import="board.boardDto"%>
<%@page import="java.util.Map"%>
<%@page import="board.boardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String aid=(String)request.getParameter("aid");
System.out.print(aid);
boardService boardService=new boardService();
Map<String,Object>map=boardService.selectAritcle(Integer.parseInt(aid));
if((boolean)map.get("flag")){
	request.getSession().setAttribute("dto", map.get("dto"));
	response.sendRedirect("articlePage.jsp");
}else{
%>
<script>
location.href="index.jsp";
</script>
<%}
%>