<%@ Register TagPrefix="AcmeInclude" Namespace="Acme" Assembly="TocSwitch" %>
<%@ Register TagPrefix="Acme" TagName="UrlMaker" Src="/quickstart/howto/util/UrlMaker.ascx"%>
<!--BEGIN HEADER-->
<html>
<head>
 <title>Microsoft HowTo's QuickStarts Tutorial</title>
<link rel="stylesheet" href="/quickstart/include/qsstyle.css">
</head>
<body topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" >

<table class="outer" cellpadding=0 cellspacing=0>
<tr>
<AcmeInclude:TocSwitch runat="server"><TocTemplate>
<td class="toc" valign="top" width="210">

<table>
<tr>
<td nowrap style="padding-right:15">

<div class="toc" style="color:darkred;">

    <div style="padding:0,0,4,0"><b>Input and Output</b><br></div>
    &nbsp; <a class="outer" href="/quickstart/howto/doc/anagrams.aspx">Read a text file</a><br>
    &nbsp; <a class="outer" href="/quickstart/howto/doc/directory.aspx">List a directory</a><br>
    &nbsp; <a class="outer" href="/quickstart/howto/doc/logfile.aspx">Create a log file</a><br>
    &nbsp; <a class="outer" href="/quickstart/howto/doc/largereadwrite.aspx">Read and write large files</a><br>
    &nbsp; <a class="outer" href="/quickstart/howto/doc/readwrite.aspx">Read and write binary data</a><br>
    &nbsp; <a class="outer" href="/quickstart/howto/doc/watcher.aspx">Watch file system changes</a><p>
    <div style="padding:0,0,4,0"><a target="_top" style="color:darkred" href="/quickstart/howto"><b>Back to Index</b></a><br></div>

    <p>
     <Acme:UrlMaker runat="server" />

</div>

</td>
</tr>
</table>

</td>
 </TocTemplate></AcmeInclude:TocSwitch>
 <td valign="top">
<div class="body">
<!--END HEADER-->

<!-- #include virtual="/quickstart/howto/doc/xml/xmldataheader.inc" -->

