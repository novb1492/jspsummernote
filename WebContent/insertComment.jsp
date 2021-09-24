<%@page import="java.util.Map"%>
<%@page import="comment.commentService"%>
<%@page import="comment.commentDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
System.out.print("insertCommentpage");
request.setCharacterEncoding("utf-8");
String comment=request.getParameter("comment");
int aid=Integer.parseInt(request.getParameter("aid"));
commentDto commentDto=new commentDto();
commentDto.setAid(aid);
commentDto.setEmail((String)request.getSession().getAttribute("email"));
commentDto.setComment(comment);
commentService commentService=new commentService();
Map<String,Object>map=commentService.insertComment(commentDto);
if((boolean)map.get("flag")){
	response.sendRedirect("articlePage.jsp?aid="+aid);
}else{
	System.out.print("실패");
%>
<script>
alert("<%=map.get("message") %>");
location.href="getArticlePage.jsp?aid=<%=aid %>";
</script>

<%}
%>