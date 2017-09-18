<%@ Page language="c#" Src="WebForm1.cs" AutoEventWireup="false" Inherits="WebLoan.WebForm1" %>
<html>
<head>
<meta content="Microsoft Visual Studio .NET" name=GENERATOR>
<meta content=C# name=CODE_LANGUAGE>
</head>

<body>
<form method=post runat="server"><font face=Arial color=tan 
size=6>Web Loan Sample </FONT>
<p></P>
<table cellSpacing=0 cellPadding=0 width=300 bgColor=lightgoldenrodyellow 
border=0>
  <tr>
    <td bgColor=tan><font face=Arial color=black size=4 
      >Loan Details</FONT></TD>
    <td bgColor=tan><font face=Arial color=black size=4 
      >Amortization Schedule</FONT> </TD></TR>
  <tr>
    <td vAlign=top>
      <table id=DetailsTable height=178 cellSpacing=0 cellPadding=3 width=300 
      border=0 runat="server">
        <tr>
          <td>Open Balance:</TD>
          <td><asp:textbox id=Balance 
             runat="server" width="102"></asp:textbox></TD></TR>
        <tr>
          <td>Rate:</TD>
          <td><asp:textbox id=Rate 
            runat="server" width="102"></asp:textbox></TD></TR>
        <tr>
          <td>Term:</TD>
          <td><asp:textbox id=Term 
            runat="server" width="102"></asp:textbox></TD></TR>
        <tr>
          <td>Payment:</TD>
          <td><asp:textbox id=Payment 
             runat="server" width="102"></asp:textbox></TD></TR>
        <tr>
          <td align=middle colSpan=2><font face=Arial 
            ><asp:button id=Button2 
            runat="server" Width="166" 
        Text="Calculate"></asp:button></FONT></TD></TR></TABLE></TD>
    <td>
    
    <asp:datagrid id=DataGrid1 
      runat="server" BorderColor="Tan" BorderWidth="1px" ForeColor="Black" 
      BackColor="LightGoldenrodYellow" GridLines="None" CellPadding="4" 
      Font-Names="Arial" AutoGenerateColumns="false"
      AlternatingItemStyle-BackColor="PaleGoldenrod"
      FooterStyle-BackColor="Tan"
      HeaderStyle-Font-Bold="True"
      HeaderStyle-Font-Size="X-Small"
      SelectedItemStyle-ForeColor="DarkSlateBlue">
      
      <Columns>
      <asp:BoundColumn 
      HeaderText="Nbr"
      headerstyle-horizontalalign=Right
      DataField="PmtNbr" />
      
      <asp:BoundColumn 
      HeaderText="Balance"
      headerstyle-horizontalalign=Right
      DataFormatString="{0:n2}"
      DataField="Balance"
      ItemStyle-HorizontalAlign="Right" />
      
	  <asp:BoundColumn 
	  HeaderText="Payment" 
	  DataFormatString="{0:n2}" 
	  headerstyle-horizontalalign=Right
      DataField="Payment" 
      ItemStyle-HorizontalAlign="Right" /> 
      
	  <asp:BoundColumn 
	  HeaderText="Principal"
      DataFormatString="{0:n2}" 
      headerstyle-horizontalalign=Right
      DataField="Principal"
      ItemStyle-HorizontalAlign="Right" />  
      
      <asp:BoundColumn 
      HeaderText="Interest" 
      DataFormatString="{0:n2}" 
      headerstyle-horizontalalign=Right
      DataField="Interest"
      ItemStyle-HorizontalAlign="Right" />
      
      <asp:BoundColumn 
      HeaderText="Balance" 
      DataFormatString="{0:n2}" 
      headerstyle-horizontalalign=Right
      DataField="EndBalance"
      ItemStyle-HorizontalAlign="Right" />
      
      </Columns>
     
      </asp:datagrid>
      
      
      </TD></TR></TABLE></FORM>
</body></html>
