<%@page import="comment.comentDto"%>
<%@page import="comment.commentService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
System.out.print("deletecoment");
int cid=Integer.parseInt(request.getParameter("cid"));
int aid=Integer.parseInt(request.getParameter("aid"));
int nowPage=Integer.parseInt(request.getParameter("page"));
comentDto comentDto=new comentDto();
comentDto.setAid(aid);
comentDto.setCid(cid);
comentDto.setEmail((String)request.getSession().getAttribute("email"));
commentService commentService=new commentService();
Map<String,Object>map=commentService.deleteComent(comentDto);
%>
<script>
 alert("<%=map.get("message")%>");
 location.href="articlePage.jsp?aid=<%=aid%>&page=<%=nowPage%>";
</script>

