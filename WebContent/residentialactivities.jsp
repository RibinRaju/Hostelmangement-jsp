<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.mvc.doa.CategoryDao"%>
    <%@page import="com.mvc.bean.UserBean"%>
     <%@page import="com.mvc.bean.RoomBean"%>
     <%@page import="java.sql.Date"%>
     <%@page import="java.text.SimpleDateFormat"%>
    
    
    
    
    <% 
	String cardNumber = request.getParameter("carddetails");
    
    
    CategoryDao categoryDao = new CategoryDao(); 
    boolean flag = categoryDao.validateATMCardNumber(cardNumber) ;;
    
    if (flag) {
    	String resName=request.getParameter("name");
    	String resAddress=request.getParameter("Address");
    	long resPhno = Long.parseLong(request.getParameter("phone"));
    	String resUsername=request.getParameter("username");
    	String resPassword=request.getParameter("password");
    	int roomNo=Integer.parseInt(request.getParameter("RoomNumber"));
    	String checkInDate = request.getParameter("check-in-date");		
    	String checkOutDate = request.getParameter("check-out-date");				
    	float rentAmount=Float.parseFloat(request.getParameter("paidRent"));
    	
     	UserBean userBean=new UserBean();
     	
     	//categoryBean.setCatName(catName.toUpperCase().trim());
     	userBean.setResName(resName);
     	userBean.setResAddress(resAddress);
     	userBean.setResPhno(resPhno);
     	userBean.setResUsername(resUsername);
     	userBean.setResPassword(resPassword);
     	
     	boolean flagOne= categoryDao.AddUser(userBean);
     		
     	if(flagOne){
     		RoomBean roomBean=new RoomBean();
     		int resId = categoryDao.getResidentialIdByName(resName);
        	java.sql.Date joinDate = java.sql.Date.valueOf(checkInDate);
         	java.sql.Date leaveDate = java.sql.Date.valueOf(checkOutDate);
     		
     		roomBean.setResId(resId);
         	roomBean.setRoomId(roomNo);
         	
            roomBean.setJoindate(joinDate);
            roomBean.setLeavedate(leaveDate);
         	roomBean.setRentAmount(rentAmount);
         	boolean flagTwo=categoryDao.admission(roomBean); 
         	if(flagTwo){
     			response.sendRedirect("residentials.html");
         	}
         	else{
         		response.sendRedirect("Error.jsp");
         	}
     	}else{
     		response.sendRedirect("Error.jsp");
     	}
    } else {
        response.sendRedirect("Error.jsp");
    }
	
%>		
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>