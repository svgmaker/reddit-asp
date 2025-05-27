<%
Dim fso, file
Set fso = Server.CreateObject("Scripting.FileSystemObject")

On Error Resume Next
Set file = fso.CreateTextFile(Server.MapPath("_private/testwrite.txt"), True)

If Err.Number <> 0 Then
  Response.Write "Cannot write file. Error: " & Err.Description
Else
  file.WriteLine "Write test passed."
  file.Close
  Response.Write "Write succeeded."
End If
%>
