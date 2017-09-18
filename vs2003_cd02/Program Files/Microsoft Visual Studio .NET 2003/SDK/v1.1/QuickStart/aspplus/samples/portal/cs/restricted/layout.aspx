<%@ Page Language="C#" Inherits="Layout" Src="Layout.cs" Description="Layout Page" %>
<%@ Register TagName="PageHeader" TagPrefix="PageHeader" Src="/QuickStart/aspplus/samples/portal/CS/include/PageHeader.ascx" %>

<html>
<head>

<script Language="Javascript">

function doRemoveLinks() {
    var options = myForm.mySelect.options;
    for (i=0; i < options.length; i++) {
        if (options[i].selected) {
            options[i] = null; i--;
        }
    }
}

function doMoveUp() {

    var options = myForm.mySelect.options

    for (i=0; i < options.length; i++) {
        if ((options[i].selected)&&(i==0))
            break;
        if (options[i].selected) {
            var optText = options[i-1].text;
            var optValue = options[i-1].value;
            options[i-1].text = options[i].text;
            options[i-1].value = options[i].value;
            options[i].text = optText;
            options[i].value = optValue;
            options[i-1].selected = true;
            options[i].selected = false;
        }
    }
}

function doMoveDown() {

    var options = myForm.mySelect.options

    for (i=options.length-1; i >= 0; i--) {
        if ((options[i].selected)&&(i==options.length-1))
            break;
        if (options[i].selected) {
            var optText = options[i+1].text;
            var optValue = options[i+1].value;
            options[i+1].text = options[i].text;
            options[i+1].value = options[i].value;
            options[i].text = optText;
            options[i].value = optValue;
            options[i+1].selected = true;
            options[i].selected = false;
        }
    }
}

function doRemoveLinks2() {
    var options = myForm.mySelect2.options;
    for (i=0; i < options.length; i++) {
        if (options[i].selected)
        {
            options[i] = null; i--;
        }
    }
}

function doMoveUp2() {

    var options = myForm.mySelect2.options

    for (i=0; i < options.length; i++) {
        if ((options[i].selected)&&(i==0))
            break;
        if (options[i].selected) {
            var optText = options[i-1].text;
            var optValue = options[i-1].value;
            options[i-1].text = options[i].text;
            options[i-1].value = options[i].value;
            options[i].text = optText;
            options[i].value = optValue;
            options[i-1].selected = true;
            options[i].selected = false;
        }
    }
}

function doMoveDown2() {

    var options = myForm.mySelect2.options

    for (i=options.length-1; i >= 0; i--) {
        if ((options[i].selected)&&(i==options.length-1))
            break;
        if (options[i].selected) {
            var optText = options[i+1].text;
            var optValue = options[i+1].value;
            options[i+1].text = options[i].text;
            options[i+1].value = options[i].value;
            options[i].text = optText;
            options[i].value = optValue;
            options[i+1].selected = true;
            options[i].selected = false;
        }
    }
}

function doSubmit() {

    var options = myForm.mySelect.options;
    for (i=0; i < options.length; i++) {
        options[i].selected = true;
    }

    var options = myForm.mySelect2.options;
    for (i=0; i < options.length; i++) {
        options[i].selected = true;
    }

    myForm.submit();

}

// -->
</script>

</head>

<body bgcolor="ffffff" style="margin:0,0,0,0">

<PageHeader:PageHeader ShowSignOut="true" runat="server"/>

<!--BEGIN HEADER-->
    <table width="100%" cellpadding=5 cellspacing=0>
      <tr bgcolor="ffffff">
         <td align="left" colspan=2 bgcolor="<%= UserState["HeadColor"] %>" style="padding:10,0,10,15;border-color:black;border-style:solid; border-width:1;border-left:0;border-right:0;border-bottom:0">
             <font face="Arial" color="white"><b>Customize Page Layout</b></font>
         </td>
      </tr>
      <tr bgcolor="ffffff">
         <td align="left" colspan=2 height="25" style="padding:0,0,0,0;border-color:black;border-style:solid; border-width:1;border-left:0;border-right:0">
<!--END HEADER-->

<!-- Add a blank form here so that the client page creates the 
postback functions required to sign out -->
<form runat="server">
</form>

<form name="myForm" method="post">

<center>

&nbsp;<br>

<font face="Arial" color="black"><b>Re-order the "<span id="pageName" runat="server"/>" modules, then click "Submit Changes" to accept settings</b></font>

<table cellspacing="15">
<tr>
<td width="50%">

<table width="100%" cellspacing=0 style="border-color:black;border-style:solid;border-width:1">
<tr>
        <td bgcolor=<%= UserState["HeadColor"] %> style="border-color:black;border-style:solid;border-width:1;border-top:0;border-left:0;border-right:0;padding:10,10,10,10" align="left">
            <font face="Arial" color="white"><b>Left Modules</b></font>
        </td>
</tr>
    <tr>
        <td align="center" width="100%" colspan=2 bgcolor="<%= UserState["SubheadColor"]%>">
            <table cellpadding=0 width="100%" cellspacing=0 style="border-color:<%= UserState["SubheadColor"]%>;border-style:solid;border-width:10">
                <tr>
                    <td valign="center" width="30">
                        <button style="border-width:0,0,0,0;background-color:<%= UserState["SubheadColor"]%>" onclick="javascript:doMoveUp()"><img src="/QuickStart/aspplus/samples/portal/CS/images/up.gif"></button>
                        <button style="border-width:0,0,0,0;background-color:<%= UserState["SubheadColor"]%>" onclick="javascript:doRemoveLinks()"><img src="/QuickStart/aspplus/samples/portal/CS/images/x.gif"></button>
                        <button style="border-width:0,0,0,0;background-color:<%= UserState["SubheadColor"]%>" onclick="javascript:doMoveDown()"><img src="/QuickStart/aspplus/samples/portal/CS/images/down.gif"></button>
                    </td>
                    <td valign="top">
                        <select id="mySelect" name="mySelect" EnableViewState="false" multiple databinding="size:selectSize" runat="server"/>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>


</td>
<td width="50%">

<table width="100%" cellspacing=0 style="border-color:black;border-style:solid;border-width:1">
<tr>
        <td bgcolor="<%= UserState["HeadColor"]%>" style="border-color:black;border-style:solid;border-width:1;border-top:0;border-left:0;border-right:0;padding:10,10,10,10" align="left">
            <font face="Arial" color="white"><b>Right Modules</b></font>
        </td>
</tr>
    <tr>
        <td align="center" width="100%" colspan=2 bgcolor="<%= UserState["SubheadColor"]%>">
            <table cellpadding=0 width="100%" cellspacing=0 style="border-color:<%= UserState["SubheadColor"]%>;border-style:solid;border-width:10">
                <tr>
                    <td valign="center" width="30">
                        <button style="border-width:0,0,0,0;background-color:<%= UserState["SubheadColor"]%>" onclick="javascript:doMoveUp2()"><img src="/QuickStart/aspplus/samples/portal/CS/images/up.gif"></button>
                        <button style="border-width:0,0,0,0;background-color:<%= UserState["SubheadColor"]%>" onclick="javascript:doRemoveLinks2()"><img src="/QuickStart/aspplus/samples/portal/CS/images/x.gif"></button>
                        <button style="border-width:0,0,0,0;background-color:<%= UserState["SubheadColor"]%>" onclick="javascript:doMoveDown2()"><img src="/QuickStart/aspplus/samples/portal/CS/images/down.gif"></button>
                    </td>
                    <td valign="top">
                        <select id="mySelect2" name="mySelect"   multiple databinding="size:selectSize" runat="server"/>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>


</td>
</tr>


</table>

</center>

<p>

<table width="100%" cellpadding="0" cellspacing="0" bgcolor="<%=  UserState["SubheadColor"]%>">
<tr><td align="center" width="100%" style="padding:10,10,10,10;border-color:black;border-style:solid;border-width:1;border-left:0;border-bottom:0;border-right:0;" >

    <input type="button" value="Submit Changes" onclick="doSubmit()" >

</td></tr>
</table>

</td>
</tr>
</table>

</form>
</body>
</html>

