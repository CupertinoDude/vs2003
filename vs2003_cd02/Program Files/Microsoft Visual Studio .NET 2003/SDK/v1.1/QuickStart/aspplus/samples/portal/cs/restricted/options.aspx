<%@ Page Language="C#" Inherits="Options" Src="Options.cs" Description="Options Page" %>
<%@ Register TagName="PageHeader" TagPrefix="PageHeader" Src="/QuickStart/aspplus/samples/portal/CS/include/PageHeader.ascx" %>

<html>
<head>
</head>

<body bgcolor="ffffff" style="margin:0,0,0,0">

<PageHeader:PageHeader runat="server"/>

    <table width="100%" cellpadding=5 cellspacing=0>
        <tr bgcolor="ffffff">
            <td align="left" colspan=2 bgcolor="<%=UserState["HeadColor"]%>" style="padding:10,0,10,15;border-color:black;border-style:solid; border-width:1;border-left:0;border-right:0;border-bottom:0">
                <font face="Arial" color="white"><b>Customize Page Options<b></font>
            </td>
        </tr>
        <tr bgcolor="ffffff">
            <td width="100%" align="center" colspan=2 height="25" style="padding:0,0,0,0;border-color:black;border-style:solid; border-width:1;border-left:0;border-right:0">
                <form runat="server">
                    <table cellpadding=0 cellspacing=0>
                        <tr>
                            <td style="padding:15,15,15,15" align="center">
                                <font face="Arial" size="-1">Select a color scheme, then click "Submit Changes" to accept the setting.</font>
                                <p>
                                <table width="700">
                                    <tr>

                                        <td width="5%" align=right><input type=radio name="colors" value="blue,#6699cc,#b6cbeb,#ffffff,#eeeeee" runat="server" OnServerChange="Colors_Change"></td>
                                        <td width="20%" align=center>
                                            <font face="Arial" size="-1"><b>Blue</b></font>
                                            <table cellspacing="1" cellpadding="1">
                                                <tr>
                                                    <td align=center valign="middle">
                                                        <img border=1 src="/quickstart/aspplus/samples/portal/CS/images/option_blue.gif">
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>

                                        <td width="5%" align=right><input type=radio name="colors" value="green,#879966,#c5e095,#ffffff,#eeeeee" runat="server" OnServerChange="Colors_Change"></td>
                                        <td width="20%" align=center>
                                            <font face="Arial" size="-1"><b>Green</b></font>
                                            <table cellspacing="1" cellpadding="1">
                                                <tr>
                                                    <td align=center valign="middle">
                                                        <img border=1 src="/quickstart/aspplus/samples/portal/CS/images/option_green.gif">
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>

                                        <td width="5%" align=right><input type=radio name="colors" value="yellow,#f8bc03,#f8e094,#ffffff,#f8e094" runat="server" OnServerChange="Colors_Change"></td>
                                        <td width="20%" align=center>
                                            <font face="Arial" size="-1"><b>Yellow</b></font>
                                            <table cellspacing="1" cellpadding="1">
                                                <tr>
                                                    <td align=center valign="middle">
                                                        <img border=1 src="/quickstart/aspplus/samples/portal/CS/images/option_yellow.gif">
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>

                                        <td width="5%" align=right><input type=radio name="colors" value="purple,#91619b,#be9cc5,#ffffff,#eeeeee" runat="server" OnServerChange="Colors_Change"></td>
                                        <td width="20%" align=center>
                                            <font face="Arial" size="-1"><b>Purple</b></font>
                                            <table cellspacing="1" cellpadding="1">
                                                <tr>
                                                    <td align=center valign="middle">
                                                        <img border=1 src="/quickstart/aspplus/samples/portal/CS/images/option_purple.gif">
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>

                                        <td width="5%" align=right><input type=radio name="colors" value="red,#a7342a,#df867f,#ffffff,#eeeeee" runat="server" OnServerChange="Colors_Change"></td>
                                        <td width="20%" align=center>
                                            <font face="Arial" size="-1"><b>Red</b></font>
                                            <table cellspacing="1" cellpadding="1">
                                                <tr>
                                                    <td align=center valign="middle">
                                                        <img border=1 src="/quickstart/aspplus/samples/portal/CS/images/option_red.gif">
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>

                                &nbsp;<p>

                                <input type="submit" runat="server" value="Submit Changes" OnServerClick="Submit_Click"/>

                            </td>
                        </tr>
                    </table>
                </form>
            </td>
        </tr>
    </table>

</body>
</html>