<table width="100%" border="0" cellspacing="2">
  <tr>
    <td width="120" rowspan="3"><a href="Default.asp"><img src="images/header.png" alt="reddit" /></a></td>
    <td colspan="4">Optional banner here</td>
    <td width="200" align="right">

 
      <% If Session("Username") <> "" Then %> 
   <a href="signout.asp">sign out</a>
	<% Else %>
        <a href="register.asp">register</a>
      <% End If %>
       <a href="faq.asp">faq</a>


    </td>
  </tr>
  <tr>
    <td width="81" align="center" bgcolor="#C6DEF7" class="headerbtn"><a href="Default.asp">new links</a></td>
    <td width="82" class="headerbtn" align="center" bgcolor="#C6DEF7"><a href="Default.asp?view=top">top links</a></td>
    <td width="76" class="headerbtn" align="center" bgcolor="#C6DEF7"><a href="Curated.asp">curated</a></td>
    <td colspan="3" class="headerbtn" bgcolor="#C6DEF7">&nbsp;</td>
  </tr>
</table>
