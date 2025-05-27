<%@LANGUAGE="VBScript" CODEPAGE="65001"%>
<%
' --- Check login ---
If Session("username") = "" Or IsEmpty(Session("username")) Then
    Response.Write "<p>You must be logged in to comment.</p>"
    Response.End
End If

Dim conn, sql, username, postID, commentText

username = Session("username")
postID = Request.Form("PostID")
commentText = Trim(Request.Form("Comment"))

' Basic validation
If postID = "" Or commentText = "" Then
    Response.Write "<p>Post ID and comment text are required.</p>"
    Response.End
End If

' Open DB connection - adjust path if needed
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Inetpub\reddit\_private\reddit.mdb"

' Escape single quotes to prevent SQL errors
commentText = Replace(commentText, "'", "''")

sql = "INSERT INTO Comments (PostID, Username, Comment, [Timestamp]) VALUES (" & _
      postID & ", '" & username & "', '" & commentText & "', Now())"

On Error Resume Next
conn.Execute sql

If Err.Number <> 0 Then
    Response.Write "<p>Error inserting comment: " & Err.Description & "</p>"
    conn.Close
    Set conn = Nothing
    Response.End
End If

conn.Close
Set conn = Nothing

' Redirect back to comments page for the post
Response.Redirect "comments.asp?id=" & Server.URLEncode(postID)
%>
