<%@page import="enums.StringsEnums"%>
<%@page import="java.util.Map"%>
<%@page import="comment.commentService"%>
<%@page import="comment.comentDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
System.out.print("updateComentPage");
request.setCharacterEncoding("utf-8");
String coment=request.getParameter("coment");
int cid=Integer.parseInt(request.getParameter("cid"));
int nowPage=Integer.parseInt(request.getParameter("page"));
int aid=Integer.parseInt(request.getParameter("aid"));
String email=(String)request.getSession().getAttribute("email");
System.out.print(coment.length()+" "+cid);
comentDto comentDto=new comentDto();
commentService commentService=new commentService();
comentDto.setComment(coment);
comentDto.setCid(cid);
comentDto.setEmail(email);
Map<String,Object>map= commentService.updateComment(comentDto);
if((boolean)map.get(StringsEnums.flag.getString())==false){
%>
<script>
alert(<%=map.get("message") %>);
location.href="articlePage.jsp?aid=<%= aid%>&page=<%=nowPage%>";
</script>

<%
}else{
	response.sendRedirect("articlePage.jsp?aid="+aid+"&page="+nowPage);
}




%>