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
        <form id="home" action="do_search.jsp"  method="get" class="form">
            <div class="toolbar">
                <h1>Search</h1>
                <a class="back" href="main.html" target="_webapp">Back</a>
            </div>
            <p>What product would you like to find?</p>
            <ul class="rounded">
                <li><input type="text" name="search" value="" placeholder="" /></li>
            </ul>
            <a style="margin:0 10px;color:rgba(0,0,0,.9)" href="#" class="submit whiteButton" onclick="javascript: submitform()">Search</a>
        </form>
    </body>
</html>

