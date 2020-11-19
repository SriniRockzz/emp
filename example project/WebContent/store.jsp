<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%Connection connection=null;%>
<%String f,l,un,pass,add,con;%>

 <%
 f=request.getParameter("firstName");
l= request.getParameter("lastName");
 un=request.getParameter("username");
 pass=request.getParameter("password");
 add=request.getParameter("address");
 con=request.getParameter("contact");
 
 String INSERT_USERS_SQL = "INSERT INTO srini1( first_name, last_name, username, password, address, contact) VALUES( ?, ?, ?, ?,?,?);";

     int result = 0;
try{
    Class.forName("com.mysql.jdbc.Driver");

    	 connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/srinivas", "root", "");

         // Step 2:Create a statement using connection object
         PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL); 
     
         preparedStatement.setString(1, f);
         preparedStatement.setString(2, l);
         preparedStatement.setString(3, un);
         preparedStatement.setString(4, pass);
         preparedStatement.setString(5, add);
         preparedStatement.setString(6, con);

         System.out.println(preparedStatement);
         // Step 3: Execute the query or update query
       result= preparedStatement.executeUpdate();
        
         if (result>0) {
        	   out.print("You are successfully registered");
        	  
        }
}
catch(Exception e){
	out.println(e);
}
         connection.close(); 
     
   

 %>
</body>
</html>