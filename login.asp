<%
Dim conn, rs, sql, username, password

username = Request.Form("username")
password = Request.Form("password")

Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Inetpub\reddit\_private\reddit.mdb"

sql = "SELECT * FROM Users WHERE Username = '" & Replace(username, "'", "''") & "' AND [Password] = '" & Replace(password, "'", "''") & "'"
Set rs = conn.Execute(sql)

If Not rs.EOF Then
    Session("Username") = username
    Response.Redirect "default.asp"
Else
    Response.Write "Invalid username or password."
End If

rs.Close
conn.Close
Set rs = Nothing
Set conn = Nothing
%>
