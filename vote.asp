<%
Dim conn, sql, postid, action, rs, newScore

' Require login to vote
If Session("Username") = "" Then
  Response.Write "You must be logged in to vote."
  Response.End
End If

postid = Request.QueryString("postid")
action = Request.QueryString("action")

If Not IsNumeric(postid) Or (action <> "up" And action <> "down") Then
  Response.Write "Invalid vote parameters."
  Response.End
End If

Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Inetpub\reddit\_private\reddit.mdb"

' Get current score
sql = "SELECT Score FROM Posts WHERE ID=" & postid
Set rs = conn.Execute(sql)

If Not rs.EOF Then
  newScore = rs("Score")
  If action = "up" Then
    newScore = newScore + 1
  ElseIf action = "down" Then
    newScore = newScore - 1
  End If
  
  ' Update score
  sql = "UPDATE Posts SET Score = " & newScore & " WHERE ID = " & postid
  conn.Execute(sql)
  
  rs.Close
  conn.Close

  ' Redirect back to main page
  Response.Redirect "default.asp"
Else
  rs.Close
  conn.Close
  Response.Write "Post not found."
End If

Set rs = Nothing
Set conn = Nothing
%>
