<%-- 
    Document   : do_search.jsp
    Created on : Mar 3, 2011, 11:32:16 PM
    Author     : jahziah
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

        <div id="home">
            <div class="toolbar">
                <h1>Search results</h1>
                 <a href="search.jsp" target="_webapp" class="button back">Back</a>
                </div>
            <h2>Here's what we found:</h2>
            <%@ page import="java.sql.*" %>
                <%  //
                            String myParameter = request.getParameter("search");
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
        </div>


                </body>
                </html>
