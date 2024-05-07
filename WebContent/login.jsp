<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.mvc.doa.CategoryDao" %> 
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    String userName = request.getParameter("username");
    String passWord = request.getParameter("password");
    session.setAttribute("username", "username");
    
    
    
    CategoryDao categoryDao = new CategoryDao(); 
    boolean flag = categoryDao.isValidUser(userName, passWord); 
    
    if (flag) {
        response.sendRedirect("residentialsmain.jsp");
    } else {
        response.sendRedirect("Error.jsp");
    }
%>
