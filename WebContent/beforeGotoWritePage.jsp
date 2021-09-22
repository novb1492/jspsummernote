<%@page import="board.boardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
System.out.print("beforeGtoWritePage");
HttpSession httpSession=request.getSession();
boardDto boardDto=(boardDto)httpSession.getAttribute("dto");
String title=boardDto.getTitle();
String text=boardDto.getText();
int aid=boardDto.getId();


httpSession.setAttribute("title", title);
httpSession.setAttribute("text", text.replace("\"", "'"));
httpSession.setAttribute("aid", Integer.toString(aid));

response.sendRedirect("writePage.jsp");

%>