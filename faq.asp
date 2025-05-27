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
	<h2>frequently asked questions</h2>
	<dl>
		<dt>What is reddit?</dt>
		<dd>A source for what's new or popular on the web. You can see the most recently submitted links, or view the top links in the past 24 hours.</dd>
		<dt>My votes train a filter?</dt>
		<dd>No, I can't be asked to implement a filter even if 2006 reddit did.</dd>
		<dt>What can I submit?</dt>
		<dd>Anything. Well, almost anything. We'd like reddit to be the source for everything that's new on the web; if it's linkable, it's submittable. There is a caveat here: we only allow "work-safe" material on the site.</dd>
		<dt>What is reddit written in?</dt>
		<dd>this is written in ASP.</dd>
		<dt>Seriously? I thought it was written in Python.</dt>
		<dd><strong>this</strong> is written in ASP, reddit.com is written in Python.</dd>
		<dt>Can anyone submit?</dt>
		<dd>Yes, just click "register" in the top right.</dd>
		<dt>Are language options available on reddit?</dt>
		<dd>no, sorry mate.</dd>
		<dt>What features are planned?</dt>
		<dd>Not sure. the features will arrive when they arrive.</dd>
	</dl>
</td>

<!-- Login Box -->
    <td width="135px" valign="top">
    <form id="login" name="login" method="post" action="login.asp">
<!--#include file="_private/sidebar.inc" -->
    </form>
    </td>
  </tr>
</table>
</font></body>
</html>
