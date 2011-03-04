<%-- 
    Document   : upload_rebate
    Created on : Mar 4, 2011, 11:51:20 AM
    Author     : ehsan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ page import="java.sql.*" %>
        <%  //
                    String pName = request.getParameter("product_name");
                    String location = request.getParameter("location");
                    String oPrice = request.getParameter("original_price");
                    String dPrice = request.getParameter("discounted_price");
                    String pImage = request.getParameter("product_image");
                    String comments = request.getParameter("comments");
                    String connectionURL = "jdbc:mysql://localhost:3306/rebate_sharer?user=root;password=1234";
                    Connection connection = null;
                    Statement statement = null;
                    ResultSet rs = null;

                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    connection = DriverManager.getConnection(connectionURL, "root", "1234");
                    statement = connection.createStatement();
                    rs = statement.executeQuery("SELECT * from contributions WHERE pname LIKE '%" + myParameter + "%'");

                    out.println("<ul>");
                    while (rs.next()) {
                        out.println("<li>");
                        out.println(rs.getString("email") + "");
                        out.println(rs.getString("pname") + "");
                        out.println(rs.getString("orgprice") + "");
                        out.println(rs.getString("discprice") + "");
                        out.println(rs.getString("location") + "");
                        out.println(rs.getString("timestamp") + "");
                        out.println("<br/>");
                        out.println("</li>");
                    }
                    out.println("</ul>");

                    rs.close();
        %>
    </body>
</html>
