<%@page isErrorPage="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
        <meta http-equiv="content-language" content="en" />
        <meta name="author" content="code: Jakub Janecek; janecjak@fel.cvut.cz" />
        <link rel="stylesheet" type="text/css" href="/X33EJA-war/css/styles.css" />
        <title>Unknown error</title>
    </head>
    <body>
        <div id="header">
            <div id="headerLeft">
                <strong id="logo">čvutBank<span></span></strong>
            </div>
            <div id="headerRight">
                <div id="logoutMenu">
                    <ul>
                        <li><a href="/X33EJA-war/logout.jsp" title="Logout">Logout</a></li>
                    </ul>
                </div>
                <h1>Internet banking</h1>
            </div>
        </div>


        <div id="content">
            <div class="padding">
                <h2>Unknown error</h2>
                <p>Unknown error has occured, please, contact the administrator.</p>
                <p>Please, <a href="/X33EJA-war/home.jsf">go back to home page</a> and try again.</p>
                <br />
                <br />
                <br />
                <pre>
                    <%
                            java.io.StringWriter sw = new java.io.StringWriter();
                            java.io.PrintWriter pw = new java.io.PrintWriter(sw);
                            exception.printStackTrace(pw);
                            out.print(sw);
                            sw.close();
                            pw.close();
                    %>
                </pre>
            </div>
        </div>
    </body>
</html>
