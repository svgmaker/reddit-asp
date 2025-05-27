<%@ Language="VBScript" %>
<%
Dim conn, rs, sql
Set conn = Server.CreateObject("ADODB.Connection")
Set rs = Server.CreateObject("ADODB.Recordset")

conn.Open "DSN=RedditDB"
sql = "SELECT * FROM Posts ORDER BY Timestamp DESC"
rs.Open sql, conn

Do Until rs.EOF
    Response.Write "<table border='0' width='100%'><tr>"
    Response.Write "<td width='20' align='center' valign='top'>"
    Response.Write "<img src='images/upvote.png' alt='upvote'><br />"
    Response.Write "<img src='images/downvote.png' alt='downvote'>"
    Response.Write "</td><td>"
    Response.Write "<a href='" & rs("URL") & "'>" & rs("Title") & "</a><br />"
    Response.Write "<small>submitted by " & rs("Username") & " on " & rs("Timestamp") & "</small>"
    Response.Write "</td></tr></table><br>"
    rs.MoveNext
Loop

rs.Close
conn.Close
Set rs = Nothing
Set conn = Nothing
%>
