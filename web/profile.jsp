<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
    <head>
        <link rel="stylesheet" href="jqtouch/jqtouch.min.css" type="text/css" />
        <link rel="stylesheet" href="themes/apple/theme.min.css" type="text/css" />
        <link rel="stylesheet" href="theme.css" type="text/css" />
        <link rel="stylesheet" href="profile.css" type="text/css" />
        <script type="text/javascript" src="jquery.js"></script>
        <script type="text/javascript" src="jqtouch/jqtouch.min.js"></script>
        <script type="text/javascript" charset="utf-8" src="phonegap.js"></script>
        <script type="text/javascript">
            $.jQTouch();
        </script>
        <script type="text/javascript">
            function submitform()
            {
                document.forms["loginform"].submit();

            }
        </script>
        <title>Rebate Sharer V0.01 - Share rebates with the world!</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    </head>
    <body>
        <div id="home">
            <div class="toolbar">
                <h1>My profile</h1>
                <a href="main.html" target="_webapp" class="button back">Back</a>
            </div>
            <div id="avatar"></div>
            <div id="info"><p>Name:</p></div>
                <ul class="edgetoedge">
                    <li class="arrow"><a href="#comments">Latest comments</a></li>
                    <li class="arrow"><a href="#contributions">Contributions</a></li>
                </ul>
        </div>


        <div id="comments">
            <div class="toolbar">
                <h1>Latest comments on your submissions</h1>
            </div>
            <p>Cool rebate!</p>
            <a class="button back" href="#">Back</a>
        </div>
        <div id="contributions">
            <div class="toolbar">
                <h1>Contributions</h1>
            </div>

            <%@ page import="java.sql.*" %>
                <%  //
                            //String myParameter = request.getParameter("search");
                            String connectionURL = "jdbc:mysql://localhost:3306/rebate_sharer?user=root;password=1234";
                            Connection connection = null;
                            Statement statement = null;
                            ResultSet rs = null;

                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                            connection = DriverManager.getConnection(connectionURL, "root", "1234");
                            statement = connection.createStatement();
                            rs = statement.executeQuery("SELECT * from contributions WHERE email='jahziah@kth.se'"); // TODO add param.

                            out.println("<ul>");
                            while (rs.next()) {
                                out.println("<li>");
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

            <a class="button back" href="#">Back</a>
        </div>
    </body>
</html>

