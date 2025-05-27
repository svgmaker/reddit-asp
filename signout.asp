<%@LANGUAGE="VBScript" CODEPAGE="65001"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>reddit - template</title>
<!--#include file="_private/head.inc" -->
</head>

<body><font face="Arial, Helvetica, sans-serif">

<!-- Header -->
<!--#include file="_private/header.inc" -->

<!-- Main Content -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top">
<%
' Clear all session variables
Session.Abandon

' Optionally clear specific cookies if you use them for login
Response.Cookies("Username") = ""
Response.Cookies("Username").Expires = DateAdd("d", -1, Now())

' Redirect back to homepage or login page
Response.Redirect "default.asp"
%>

    </td>

<!-- Login Box -->
    <td width="135px">
    <form id="login" name="login" method="post" action="login.asp">
<!--#include file="_private/sidebar.inc" -->
    </form>
    </td>
  </tr>
</table>

<p>&nbsp;</p>
</font></body>
</html>
