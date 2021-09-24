<%@page import="comment.commentService"%>
<%@page import="comment.comentDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
System.out.print("updateComentPage");
request.setCharacterEncoding("utf-8");
String coment=request.getParameter("coment");
int cid=Integer.parseInt(request.getParameter("cid"));
String email=(String)request.getSession().getAttribute("email");
System.out.print(coment.length()+" "+cid);
comentDto comentDto=new comentDto();
commentService commentService=new commentService();
comentDto.setComment(coment);
comentDto.setCid(cid);
comentDto.setEmail(email);
commentService.updateComment(comentDto);
%>