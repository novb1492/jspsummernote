<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
System.out.print("saveimagepage");
String uploadPath = "C:/java_folder/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/webapps/img/";
int size = 10 * 1024 * 1024;
String fileName = "";
try{
	MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());
	Enumeration files = multi.getFileNames();
	String file = (String)files.nextElement(); 
	fileName = multi.getFilesystemName(file);
}catch(Exception e){
	e.printStackTrace();
}
JSONObject jsonObject=new JSONObject();
jsonObject.put("url","/make/img/"+fileName);
response.setContentType("application/json");
out.print(jsonObject.toJSONString());
//Thread.sleep(5000); 

%>