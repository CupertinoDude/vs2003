<%@ Page Language="C#" Inherits="FavoriteLinksEdit" Src="FavoriteLinks_Edit.cs" Description="Favorite Links Module Edit Page" %>
<%@ Register TagPrefix="Portal" TagName="PageHeader" Src="/QuickStart/aspplus/samples/portal/CS/include/PageHeader.ascx" %>
<%@ Register TagPrefix="Portal" TagName="EditModuleHeader" Src="/QuickStart/aspplus/samples/portal/CS/include/EditModuleHeader.ascx" %>
<%@ Register TagPrefix="Portal" TagName="EditModuleFooter" Src="/QuickStart/aspplus/samples/portal/CS/include/EditModuleFooter.ascx" %>

<html>
<head>

<script Language="Javascript">
<!--

function doRemoveLinks() {
    var options = myForm.mySelect.options;
    for (i=0; i < options.length; i++) {
        if (options[i].selected)
        {
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

function doAddLink() {
    var options = myForm.mySelect.options;
    if ((myForm.linkName1.value != "")&&(myForm.linkURL1.value != "")) {
      var option = new Option(myForm.linkName1.value, myForm.linkName1.value + "," + myForm.linkURL1.value);
      options[options.length] = option;
    }

}

function doAddCategory() {
    var options = myForm.mySelect.options;
    if ((myForm.categoryName1.value != "")) {
      var option = new Option("---" + myForm.categoryName1.value + "---", "CATEGORY," + myForm.categoryName1.value);
      options[options.length] = option;
    }

}

function doSubmit() {

    var options = myForm.mySelect.options;
    for (i=0; i < options.length; i++) {
        options[i].selected = true;
    }
    myForm.submit();

}

// -->
</script>

</head>

<body bgcolor="ffffff" style="margin:0,0,0,0">

<Portal:PageHeader runat="server"/>
<Portal:EditModuleHeader Title="Favorite Links" runat="server"/>

<!-- Add a blank form here so that the client page creates the 
postback functions required to sign out -->
<form runat="server">
</form>

<form name="myForm" method="post">

<center>

&nbsp;<br>

<font face="Arial" color="black"><b>Add or Remove Links or Categories, then click "Submit Changes" to accept settings</b></font>

<table cellspacing="15">
<tr>
<td width="100%">

<table width="100%" cellspacing=0 style="border-color:black;border-style:solid;border-width:1">
<tr>
        <td bgcolor="<%=UserState["HeadColor"]%>" style="border-color:black;border-style:solid;border-width:1;border-top:0;border-left:0;border-right:0;padding:10,10,10,10" align="left">
            <font face="Arial" color="white" size="-1"><input type="button" value="   Add Category  " onclick="javascript:doAddCategory()"></font>
        </td>
        <td bgcolor="<%=UserState["HeadColor"]%>" align="right" valign="top" style="border-color:black;border-style:solid;border-width:1;border-top:0;border-left:0;border-right:0;padding:10,10,10,10">
            <input id="categoryName1" type="text" size="40" runat="server">
        </td>
</tr>
    <tr>


        <td align="center" width="100%" colspan=2 bgcolor="<%=UserState["SubheadColor"]%>">
            <table cellpadding=0 width="100%" cellspacing=0 style="border-color:<%=UserState["SubheadColor"]%>;border-style:solid;border-width:10">
                <tr>
                    <td valign="center" width="30">
                        <button style="border-width:0,0,0,0;background-color:<%=UserState["SubheadColor"]%>" onclick="javascript:doMoveUp()"><img src="/quickstart/aspplus/samples/portal/CS/images/up.gif"></button>
                        <button style="border-width:0,0,0,0;background-color:<%=UserState["SubheadColor"]%>" onclick="javascript:doRemoveLinks()"><img src="/quickstart/aspplus/samples/portal/CS/images/x.gif"></button>
                        <button style="border-width:0,0,0,0;background-color:<%=UserState["SubheadColor"]%>" onclick="javascript:doMoveDown()"><img src="/quickstart/aspplus/samples/portal/CS/images/down.gif"></button>
                    </td>
                    <td valign="top">
                        <select id="mySelect" name="mySelect" EnableViewState="false" multiple databinding="size:selectSize" runat="server"/>
                    </td>
                    <td valign="top" align="right">
                        <table>
                            <tr>
                                <td style="padding-left:15"  align="right">
                                    <font face="Arial" size="-1">Name:</font>
                                </td>
                                <td colspan="2" align="right">
                                    <input id="linkName1" type="text" size="40" runat="server">
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-left:15" align="right">
                                    <font face="Arial" size="-1">URL:</font>
                                </td>
                                <td colspan="2" align="right">
                                    <input id="linkURL1" type="text" size="40" runat="server">
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td align="right" valign=top style="padding-top:5">
                                    <%--input type="button" onclick="javascript:doRemoveLinks()" value="Delete Selected"--%>
                                </td>
                                <td align="right" valign=top style="padding-top:5">
                                    <input type="button" value="   Add Link  " onclick="javascript:doAddLink()">
                                </td>
                            </tr>
                        </table>
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

<table width="100%" cellpadding="0" cellspacing="0" bgcolor="<%=UserState["SubheadColor"]%>">
<tr><td align="center" width="100%" style="padding:10,10,10,10;border-color:black;border-style:solid;border-width:1;border-left:0;border-bottom:0;border-right:0;" >


    <input type="button" value="Submit Changes" onclick="doSubmit()" >


</td></tr>
</table>

<Portal:EditModuleFooter runat="server"/>

</form>
</body>
</html>

