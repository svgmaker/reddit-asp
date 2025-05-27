<%
If Session("Username") = "" Then
%>
<form id="login" name="login" method="post" action="login.asp">
  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="border-bottom: 5px solid #73a1ca;">
    <tr>
      <td rowspan="4" align="center" bgcolor="#73a1ca" width="1px">&nbsp;</td>
      <td align="center" bgcolor="#73a1ca"><font color="#FFF">login</font></td>
      <td rowspan="4" align="center" bgcolor="#73a1ca">&nbsp;</td>
    </tr>
    <tr>
      <td>
        <small>username:</small><br />
        <input name="username" type="text" size="20" maxlength="50" />
      </td>
    </tr>
    <tr>
      <td>
        <small>password:</small><br />
        <input name="password" type="password" size="20" maxlength="50" />
      </td>
    </tr>
    <tr>
      <td><input name="submit" type="submit" value="Login" /></td>
    </tr>
  </table>
</form>
<%
Else
%>
<form id="submitlink" name="submitlink" method="post" action="register_submit.asp">
  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="border-bottom: 5px solid #73a1ca;">
    <tr>
      <td rowspan="4" align="center" bgcolor="#73a1ca" width="1px">&nbsp;</td>
      <td align="center" bgcolor="#73a1ca"><font color="#FFF">submit link</font></td>
      <td rowspan="4" align="center" bgcolor="#73a1ca">&nbsp;</td>
    </tr>
    <tr>
      <td>
        <label>Title:</label><br />
        <input name="Title" type="text" maxlength="255" required />
      </td>
    </tr>
    <tr>
      <td>
        <label>URL:</label><br />
        <input name="URL" type="url" maxlength="500" required />
      </td>
    </tr>
    <tr>
      <td><input type="submit" value="Submit Link" /></td>
    </tr>
  </table>
</form>
<%
End If
%>
