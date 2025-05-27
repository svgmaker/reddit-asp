<%
If Session("Username") = "" Then
%>
  <small>username:</small><br />
  <input name="username" type="text" size="20" maxlength="50" /><br />

  <small>password:</small><br />
  <input name="password" type="password" size="20" maxlength="50" /><br />

  <input name="submit" type="submit" value="Login" />
<%
Else
%>
  <form method="post" action="register_submit.asp">
    <label>Title:</label><br/>
    <input name="Title" type="text" maxlength="255" required /><br/>

    <label>URL:</label><br/>
    <input name="URL" type="url" maxlength="500" required /><br/>

    <input type="submit" value="Submit Link" />
  </form>
<%
End If
%>
