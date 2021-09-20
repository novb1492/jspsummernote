<%@page import="board.boardDto"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.Map"%>
<%@page import="board.boardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
System.out.print("insertArticlePage");
request.setCharacterEncoding("utf-8");


String title=request.getParameter("title");
String text=request.getParameter("text");
String email=(String)request.getSession().getAttribute("email");
System.out.print("title :"+title+"text :"+text+"email :"+email);

boardDto boardDto=new boardDto();
boardDto.setEmail(email);
boardDto.setHit(0);
boardDto.setText(text);
boardDto.setTitle(title);

boardService boardService=new boardService();
Map<String,Object>map=boardService.insertArticle(boardDto);


if((boolean)map.get("flag")){
	response.sendRedirect("index.jsp");
}else{
	System.out.print("실패");
	HttpSession httpSession=request.getSession();
	httpSession.setAttribute("title", title);
	httpSession.setAttribute("text", text);
%>
<script>
alert("<%=map.get("message")%>");
location.href='writePage.jsp';
</script>

<%}%>

