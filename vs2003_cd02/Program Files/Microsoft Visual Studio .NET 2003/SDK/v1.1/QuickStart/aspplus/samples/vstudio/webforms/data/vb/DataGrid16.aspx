<%@ Page Language="vb" AutoEventWireup="false" Codebehind="DataGrid16.aspx.vb" Inherits="Data.Vb.DataGrid16"%>

 <html>
  <head>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.0">
    <meta name="CODE_LANGUAGE" content="Visual Basic .NET">
  </head>
  <body>

    <form id="DataGrid16" method="post" runat="server">
    
    <h3><font face="Verdana">Parameterized Stored Proc Select to a DataGrid Control</font></h3>

    <table width="700">
      <tr>
        <td valign="top" >
          <b>Start Date </b>
          <ASP:Calendar id="BeginDate" 
             BorderWidth="2"
             BorderColor="lightblue"
             Font-Size="8pt" 
             TitleStyle-Font-Size="8pt" 
             TitleStyle-BackColor="#cceecc" 
             DayHeaderStyle-BackColor="#ddffdd"
             DayHeaderStyle-Font-Size="10pt" 
             WeekendDayStyle-BackColor="#ffffcc" 
             SelectedDate="7/1/1996"
             VisibleDate="7/1/1996"
             SelectedDayStyle-BackColor="lightblue"
             runat="server"/>
        </td>
        <td valign="top" >
          <b>End Date</b>
          <ASP:Calendar id="EndDate" 
             BorderWidth="2"
             BorderColor="lightblue"
             Font-Size="8pt" 
             TitleStyle-Font-Size="8pt" 
             TitleStyle-BackColor="#cceecc" 
             DayHeaderStyle-BackColor="#ddffdd"
             DayHeaderStyle-Font-Size="10pt" 
             WeekendDayStyle-BackColor="#ffffcc" 
             SelectedDate="7/25/1996"
             VisibleDate="7/25/1996"
             SelectedDayStyle-BackColor="lightblue"
             runat="server"/>

        </td>
        <td valign="top" style="PADDING-TOP:20px">
          <input type="submit" Value="Get Employee Sales" runat="server" ID=Submit1 NAME=Submit1/><p></p>          
        </td>
      </tr>
      <tr>
        <td colspan="3" style="PADDING-TOP:20px">
            <ASP:DataGrid id="MyDataGrid" runat="server"
              Width="500"
              BackColor="#ccccff" 
              BorderColor="black"
              ShowFooter="false" 
              CellPadding=3 
              CellSpacing="0"
              Font-Name="Verdana"
              Font-Size="8pt"
              HeaderStyle-BackColor="#aaaadd"
              EnableViewState="false"
            />
        </td>
      </tr>
    </table>

    </form>

  </body>
 </html>
