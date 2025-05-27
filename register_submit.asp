<%@LANGUAGE="VBScript" CODEPAGE="65001"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>you can't do that!</title>
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
If Session("Username") = "" Then
  Response.Write "You must be logged in to submit a link."
  Response.End
End If

Dim conn, cmd, sql, Title, URL, Username

Title = Request.Form("Title")
URL = Request.Form("URL")
Username = Session("Username") ' Use session only for username

Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Inetpub\reddit\_private\reddit.mdb"

sql = "INSERT INTO Posts (Title, URL, Username, [Timestamp]) VALUES (?, ?, ?, ?)"

Set cmd = Server.CreateObject("ADODB.Command")
With cmd
  .ActiveConnection = conn
  .CommandText = sql
  .CommandType = 1 ' adCmdText
  .Parameters.Append .CreateParameter("Title", 200, 1, 255, Title) ' adVarWChar=200, adParamInput=1
  .Parameters.Append .CreateParameter("URL", 200, 1, 500, URL)
  .Parameters.Append .CreateParameter("Username", 200, 1, 50, Username)
  .Parameters.Append .CreateParameter("Timestamp", 7, 1, , Now()) ' adDate=7
  .Execute
End With

conn.Close
Set conn = Nothing
Set cmd = Nothing

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
