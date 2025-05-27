<%
If Session("Username") = "" Then
    Response.Redirect "loggedout.asp"
    Response.End
End If
%>
<!DOCTYPE html>
<html>
<head>
  <title>Submit a New Post</title>
</head>
<body>
<%
If Session("Username") = "" Then
  Response.Redirect "login.asp" ' redirect if not logged in
End If
%>

<form method="post" action="register_submit.asp">
  <label>Title:</label><br/>
  <input name="Title" type="text" maxlength="255" required /><br/>

  <label>URL:</label><br/>
  <input name="URL" type="url" maxlength="500" required /><br/>

  <input type="submit" value="Submit Link" />
</form>

</body>
</html>
