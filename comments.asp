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
Dim conn, rsPost, rsComments, sqlPost, sqlComments, postID, hoursAgo, commentTime

postID = Request.QueryString("id")
If postID = "" Then
    Response.Write "<p>Post ID is required.</p>"
    Response.End
End If

' Open DB connection - adjust path if needed
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Inetpub\reddit\_private\reddit.mdb"

' Fetch post details
sqlPost = "SELECT * FROM Posts WHERE ID = " & postID
Set rsPost = conn.Execute(sqlPost)

If rsPost.EOF Then
    Response.Write "<p>Post not found.</p>"
    rsPost.Close
    conn.Close
    Set rsPost = Nothing
    Set conn = Nothing
    Response.End
End If

' Display post title and link
Response.Write "<h2>Post: <a href='" & Server.HTMLEncode(rsPost("URL")) & "'>" & Server.HTMLEncode(rsPost("Title")) & "</a></h2>"

' Fetch comments for this post
sqlComments = "SELECT * FROM Comments WHERE PostID = " & postID & " ORDER BY Timestamp ASC"
Set rsComments = conn.Execute(sqlComments)

Response.Write "<table width='100%' border='0' cellspacing='1' cellpadding='0'>"

If rsComments.EOF Then
    Response.Write "<tr><td><small>No comments yet.</small></td></tr>"
Else
    Do Until rsComments.EOF
        ' Calculate hours ago
        hoursAgo = DateDiff("h", rsComments("Timestamp"), Now())
        If hoursAgo < 1 Then
            commentTime = "less than an hour ago"
        ElseIf hoursAgo = 1 Then
            commentTime = "1 hour ago"
        Else
            commentTime = hoursAgo & " hours ago"
        End If

        Response.Write "<tr><td><small><strong>" & Server.HTMLEncode(rsComments("Username")) & "</strong> " & commentTime & "</small></td></tr>"
        Response.Write "<tr><td>" & Server.HTMLEncode(rsComments("Comment")) & "</td></tr>"
        rsComments.MoveNext
    Loop
End If

' Add your own comment label and form if logged in
If Session("username") <> "" And Not IsEmpty(Session("username")) Then
%>
    <tr><td><small><strong>add your own comment:</strong></small></td></tr>
    <tr><td>
        <form method="post" action="add_comment.asp" id=form1 name=form1>
            <input type="hidden" name="PostID" value="<%=postID%>" />
            <textarea name="Comment" rows="5" cols="50" maxlength="2000" required></textarea><br/>
            <input type="submit" value="Submit Comment" / id=submit1 name=submit1>
        </form>
    </td></tr>
<%
Else
%>
    <tr><td><small><a href="login.asp">Login</a> to add a comment.</small></td></tr>
<%
End If

Response.Write "</table>"

rsComments.Close
rsPost.Close
conn.Close
Set rsComments = Nothing
Set rsPost = Nothing
Set conn = Nothing
%>

    </td>

<!-- Login Box -->
    <td width="135px" valign="top">
    <form id="login" name="login" method="post" action="login.asp">
<!--#include file="_private/sidebar.inc" -->
    </form>
    </td>
  </tr>
</table>

<p>&nbsp;</p>
</font></body>
</html>
