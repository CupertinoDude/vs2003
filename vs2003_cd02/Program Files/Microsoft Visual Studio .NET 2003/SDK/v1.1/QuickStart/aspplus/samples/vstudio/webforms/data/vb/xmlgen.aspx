<%@ Import Namespace="System.Data" %>
<%@ Page Language="vb" AutoEventWireup="false" Codebehind="xmlgen.aspx.vb" Inherits="Data.Vb.xmlgen"%>
<HTML>
    <HEAD>
        <meta content="Microsoft Visual Studio .NET 7.0" name="GENERATOR">
        <meta content="Visual Basic .NET" name="CODE_LANGUAGE">
    </HEAD>
    <body>
        <FORM id="Form1" method="post" runat="server">
            <H3><FONT face="Verdana">SQL to XML Generator</FONT></H3>
            <TABLE id="Table1" style="FONT: 10pt verdana" height="376" cellPadding="5" border="0">
                <TR>
                    <TD colSpan="2">
                        <P><B>Connect String:</B><BR>
                            <asp:label id="connect" runat="server" Width="100%"></asp:label></P>
                    </TD>
                </TR>
                <TR>
                    <TD><B>Table Properties:</B><BR>
                        Database:<BR>
                        Table:<BR>
                    </TD>
                    <TD><BR>
                        <asp:dropdownlist id="database" runat="server" AutoPostBack="True">
                            <asp:ListItem Value="Pubs" Selected="True">Pubs</asp:ListItem>
                            <asp:ListItem Value="Northwind">Northwind</asp:ListItem>
                            <asp:ListItem Value="GrocerToGo">GrocerToGo</asp:ListItem>
                            <asp:ListItem Value="Portal">Portal</asp:ListItem>
                        </asp:dropdownlist><BR>
                        <asp:dropdownlist id="table" runat="server" AutoPostBack="True"></asp:dropdownlist></TD>
                </TR>
                <TR>
                    <TD colSpan="2"><B></B>Query:</B>
                        <asp:label id="query" runat="server" Width="100%"></asp:label></TD>
                </TR>
                <TR>
                    <TD><INPUT id="GetSchema" type="radio" value="Radio1" name="Mode" runat="server">Get 
                        XML Schema<BR>
                        <INPUT id="GetData" type="radio" CHECKED value="Radio2" name="Mode" runat="server">Get 
                        XML Schema and XML Data<BR>
                    </TD>
                    <TD vAlign="top"><INPUT id="Submit" type="submit" value="Submit Query" name="Submit" runat="server">
                    </TD>
                </TR>
                <TR>
                    <TD colSpan="2"><ASP:LABEL id="lblXml" runat="server"></ASP:LABEL></TD>
                </TR>
                <TR>
                    <TD colSpan="2"><ASP:LABEL id="lblData" runat="server"></ASP:LABEL><ASP:DATAGRID id="MyDataGrid" runat="server" BackColor="#EDBE7B" BorderColor="black" ShowFooter="false" CellPadding="3" CellSpacing="0" Font-Name="Verdana" Font-Size="8pt" HeaderStyle-BackColor="#DC6035" EnableViewState="false">
                            <HeaderStyle BackColor="#DC6035"></HeaderStyle>
                        </ASP:DATAGRID></TD>
                <TR>
                </TR>
            </TABLE>
        </FORM>
    </body>
</HTML>
