<%
' Get form data and sanitize
Dim title, url, username
title = Trim(Request.Form("title"))
url = Trim(Request.Form("url"))
username = Trim(Request.Form("username"))

' Basic validation
If title = "" OR url = "" OR username = "" Then
    Response.Write "<p>Error: All fields are required. <a href='submit.asp'>Go back</a></p>"
    Response.End
End If

' Optional: Further validation on URL format here

' Connect to Access DB
Dim conn, sql
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Inetpub\reddit\_private\reddit.mdb"

Dim dtNow
dtNow = Now()

sql = "INSERT INTO Posts (Title, URL, Username, [Timestamp]) VALUES (" & _
      "'" & Replace(title, "'", "''") & "', " & _
      "'" & Replace(url, "'", "''") & "', " & _
      "'" & Replace(username, "'", "''") & "', " & _
      "#" & Month(dtNow) & "/" & Day(dtNow) & "/" & Year(dtNow) & " " & _
      Right("0" & Hour(dtNow), 2) & ":" & Right("0" & Minute(dtNow), 2) & ":" & Right("0" & Second(dtNow), 2) & "#)"


On Error Resume Next
conn.Execute sql

If Err.Number <> 0 Then
    Response.Write "<p>Error inserting post: " & Err.Description & "</p>"
Else
    Response.Write "<p>Post submitted successfully! <a href='default.asp'>Back to homepage</a></p>"
End If

conn.Close
Set conn = Nothing
%>
