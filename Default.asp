<%@LANGUAGE="VBScript" CODEPAGE="65001"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>reddit</title>
<!--#include file="_private/head.inc" -->
</head>

<body><font face="Arial, Helvetica, sans-serif">

<!-- Header -->
<!--#include file="_private/header.inc" -->

<!-- Main Content -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top">
         <table width="100%" cellspacing="0" cellpadding="2">
<%
' --- ASP code to fetch posts ---
Dim conn, rs, sql, hoursAgo, timestampStr
Set conn = Server.CreateObject("ADODB.Connection")
Set rs = Server.CreateObject("ADODB.Recordset")

' Adjust path if needed
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Inetpub\reddit\_private\reddit.mdb"
Dim view
view = Request.QueryString("view")

If LCase(view) = "top" Then
    ' Posts from last 24 hours ordered by Score descending
    sql = "SELECT * FROM Posts WHERE Timestamp >= DateAdd('h', -24, Now()) ORDER BY Score DESC"
Else
    ' Default: order by Timestamp descending
    sql = "SELECT * FROM Posts ORDER BY Timestamp DESC"
End If

rs.Open sql, conn

If Not rs.EOF Then
Do Until rs.EOF
  ' Make sure all required fields exist
  If Not IsNull(rs("Timestamp")) And Not IsNull(rs("Title")) And Not IsNull(rs("URL")) And Not IsNull(rs("Username")) Then
    hoursAgo = Int(DateDiff("h", rs("Timestamp"), Now()))

    timestampStr = WeekdayName(Weekday(rs("Timestamp")), True) & " " & _
                   MonthName(Month(rs("Timestamp")), True) & " " & _
                   Right("0" & Day(rs("Timestamp")), 2) & " " & _
                   Right("0" & Hour(rs("Timestamp")), 2) & ":" & _
                   Right("0" & Minute(rs("Timestamp")), 2) & ":" & _
                   Right("0" & Second(rs("Timestamp")), 2) & " " & _
                   Year(rs("Timestamp")) & " UTC"

    Dim postID
    postID = rs("ID")

    Response.Write "  <tr>" & vbCrLf
    Response.Write "    <td width='20' align='center' valign='top'>" & _
                   "<a href='vote.asp?postid=" & postID & "&action=up'><img src='images/upvote.png' width='15' height='15' alt='+'></a></td>" & vbCrLf
    Response.Write "    <td><big><a href='" & rs("URL") & "'>" & Server.HTMLEncode(rs("Title")) & "</a></big></td>" & vbCrLf
    Response.Write "    <td width='40' align='center' valign='middle'><small><strong>" & rs("Score") & "</strong></small></td>" & vbCrLf
    Response.Write "  </tr>" & vbCrLf
 Response.Write "  <tr>" & vbCrLf
Response.Write "    <td align='center' valign='top'>" & _
               "<a href='vote.asp?postid=" & postID & "&action=down'><img src='images/downvote.png' width='15' height='15' alt='-'></a></td>" & vbCrLf
Response.Write "    <td><small title='" & timestampStr & "'>submitted <strong>" & hoursAgo & " hours ago</strong> by " & _
               Server.HTMLEncode(rs("Username")) & _
               " <span class='comment'><a href='comments.asp?id=" & postID & "'>Comments</a></span></small></td>" & vbCrLf
Response.Write "  </tr>" & vbCrLf

  End If
  rs.MoveNext
Loop

Else
  Response.Write "<p>No posts found.</p>"
End If

rs.Close
conn.Close
Set rs = Nothing
Set conn = Nothing
%>
      </table>
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
