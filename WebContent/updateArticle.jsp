<%@page import="java.util.Map"%>
<%@page import="board.boardService"%>
<%@page import="board.boardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
System.out.print("updateArticlePage");
request.setCharacterEncoding("utf-8");
String title=request.getParameter("title");
String text=request.getParameter("text");
String aid=request.getParameter("aid");
String email=(String)request.getSession().getAttribute("email");

boardDto boardDto=new boardDto();
boardDto.setId(Integer.parseInt(aid));
boardDto.setEmail(email);
boardDto.setText(text);
boardDto.setTitle(title);

boardService boardService=new boardService();
Map<String,Object>map=boardService.updateArticle(boardDto);
if((boolean)map.get("flag")){
	response.sendRedirect("index.jsp");
}else{
	System.out.print("실패");
	HttpSession httpSession=request.getSession();
	httpSession.setAttribute("title", title);
	httpSession.setAttribute("text", text);
	httpSession.setAttribute("aid", aid);
%>
<script>
alert("<%=map.get("message")%>");
location.href='writePage.jsp';
</script>

<%}%>
