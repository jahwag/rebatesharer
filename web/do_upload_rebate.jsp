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
        <link rel="stylesheet" href="jqtouch/jqtouch.min.css" type="text/css" />
        <link rel="stylesheet" href="themes/apple/theme.min.css" type="text/css" />
        <link rel="stylesheet" href="theme.css" type="text/css" />
        <script type="text/javascript" src="jquery.js"></script>
        <script type="text/javascript" src="jqtouch/jqtouch.min.js"></script>
        <script type="text/javascript" charset="utf-8" src="phonegap.js"></script>
        <script type="text/javascript">
            $.jQTouch();
        </script>
        <script type="text/javascript">
            function submitform()
            {
                document.forms["home"].submit();
            }
        </script>
        <title>Rebate Sharer V0.01 - Share rebates with the world!</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
                    String email = "jahziah@kth.se";//TODO add session email var
                    Connection connection = null;
                    Statement statement = null;
                    ResultSet rs = null;

                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    connection = DriverManager.getConnection(connectionURL, "root", "1234");
                    statement = connection.createStatement();
                    statement.executeUpdate("insert into contributions values"
                            + "('" + pName + "', " + oPrice + ", " + dPrice + ", '" + location + "', '" + email + "', NULL, '" + comments + "', '" + pImage + "')");



                    rs.close();
        %>
        <div id="home">
            <div class="toolbar">
                <h1>Rebate sharer</h1>
                <a href="main.html" target="_webapp" class="button flip">Home</a>
            </div>
            <p>Thank you for your submission. It will become available shortly.</p>
        </div>

    </body>
</html>
