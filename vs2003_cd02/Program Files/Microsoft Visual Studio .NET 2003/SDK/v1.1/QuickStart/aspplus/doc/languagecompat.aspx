<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Language Compatibility</span>
<p>
The differences between the VBScript used in ASP and the Visual Basic .NET language used in ASP.NET are by far the most extensive of all the potential migration issues.  Not only has ASP.NET departed from the VBScript language to "true" Visual Basic, but the Visual Basic language itself has undergone significant changes in this release.  The changes are designed to:
</p>
<p>
<ul>
  <li>Make the language more consistent by bringing together features of the language with similar purposes.
  <li>Simplify the language by redesigning the features that made Visual Basic less than "basic."
  <li>Improve readability and maintainability by redesigning features that hid too many important details from the programmer.
  <li>Improve robustness by enforcing better practices, such as type-safe programming.
</ul>
<p>

This section highlights some common issues you are likely to encounter when you begin to use the new Visual Basic language.
<p>

<ul>
<li><b>No more Set and Let.</b> Instead, use simple variable assignment.

<div class="code"><pre>
&lt;%
    ' Old ASP syntax.
    Dim MyConn
    Set MyConn = Server.CreateObject("ADODB.Connection")

    ' New ASP.NET syntax.
    Dim MyConn
    MyConn = Server.CreateObject("ADODB.Connection")
%&gt;
</pre></div>

<li><b>No more non-indexed default properties.</b> Non-indexed default properties enable an expression that normally refers to an object to refer to a default property of the object instead. The unfortunate consequence of support for default properties is that it makes programs more difficult to read, since the meaning of an expression depends on its context.  In Visual Basic .NET, non-indexed properties must always be specified explicitly within code.

<div class="code"><pre>
&lt;%
' Old ASP syntax (retrieving recordset column value).
Set MyConn = Server.CreateObject("ADODB.Connection")
MyConn.Open("TestDB")
Set RS = MyConn.Execute("Select * from Products")
Response.Write RS("Name")

' New ASP.NET syntax (retrieving recordset column value).
MyConn = Server.CreateObject("ADODB.Connection")
MyConn.Open("TestDB")
RS = MyConn.Execute("Select * from Products")
Response.Write RS("Name").Value
%&gt;
</pre></div>

Indexed default properties are still supported:
<p>

<div class="code"><pre>
&lt;%
Dim RS As RecordSet

' This is allowed (indexed).
RS.Fields(1).Value = RS.Fields(2).Value

' But these are not allowed (non-indexed).
RS(1) = RS(2)
RS(1).Value = RS(2).Value
%&gt;
</pre></div>

<li><b>Parentheses are now required for calling subroutines.</b>  Visual Basic now supports exactly the same syntax for calling subroutines and functions.

<div class="code"><pre>
' Note parentheses with Response.Write.
Sub DoSomething()
     Response.Write("Hello World!")
End Sub

' Note parenthesws with DoSomething.
DoSomething()
</pre></div>


<li><b>The new default is by-value arguments.</b> 

In Visual Basic 6, if a user does not explicitly specify <code>ByVal</code> or <code>ByRef</code> on a parameter declaration, the calling convention defaults to <code>ByRef</code>.  In the new Visual Basic .NET, the default is <code>ByVal</code>.  This applies both to regular parameters for which the default can be overridden by explicitly specifying <code>ByRef</code> and to parameters passed to a <i>ParamArray</I> parameter where the default can not be overridden.  This has been changed because it is much more common for a parameter to be used solely for passing a value into a procedure than for altering a passed-in variable.  Changing the default to <code>ByVal</code> increases performance and decreases the likleihood of accidental side-effects.
<p>

You can still use by-reference arguments by explicitly using the <code>ByRef</code> modifier:

<div class="code"><pre>
&lt;script language="VB" runat=server&gt;

   Sub DoSomething(ByRef value)
      value = 4343
   End Sub

&lt;/script&gt;

&lt;%
   Dim number = 55
   DoSomething (number)
   Response.Write ("Number: " & number)
%&gt;
</pre></div>

</ul>

<b>Note:</b> There are many additional differences between Visual Basic 6 and Visual Basic .NET. Consult the language documentation for more information.

<h4><a name="summary">Section Summary</a></h4>
<ol>
<li>The differences between the VBScript used in ASP and the Visual Basic .NET language used in ASP.NET are by far the most extensive of all the potential migration issues. The changes have been made to simplify the language and improve consistency, readability, maintainability, and robustness.
<li> Set and Let assignments are no longer supported in Visual Basic .NET. Use standard variable assignment instead.
<li>Non-indexed default properties are not supported in Visual Basic .NET. Indexed default properties are still supported.
<li>Parentheses are required for calling subroutines in Visual Basic .NET.
<li>The new default is by-value arguments. You can still use by-reference arguments by explicitly using the <code>ByRef</code> modifier.
</ol>
<p>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
