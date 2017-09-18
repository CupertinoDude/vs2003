
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html>
<script language="JScript" runat="server">

    public function GetSales_Click(sender : Object, e : EventArgs) : void 
    {
        var myConnection : SqlConnection = new SqlConnection("server=(local)\\NetSDK;database=northwind;Integrated Security=SSPI");
        var myCommand : SqlDataAdapter = new SqlDataAdapter("Employee Sales By Country", myConnection);

        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;

        myCommand.SelectCommand.Parameters.Add(new SqlParameter("@Beginning_Date", SqlDbType.DateTime));
        myCommand.SelectCommand.Parameters("@Beginning_Date").Value = BeginDate.SelectedDate;

        myCommand.SelectCommand.Parameters.Add(new SqlParameter("@Ending_Date", SqlDbType.DateTime));
        myCommand.SelectCommand.Parameters("@Ending_Date").Value = EndDate.SelectedDate;

        var ds : DataSet = new DataSet();
        myCommand.Fill(ds, "Sales");

        MyDataGrid.DataSource=ds.Tables("Sales").DefaultView;
        MyDataGrid.DataBind();
    }

</script>

<body>

  <form runat="server">

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
        <td valign="top" style="padding-top:20">
          <input type="submit" OnServerClick="GetSales_Click" Value="Get Employee Sales" runat="server"/><p>          
        </td>
      </tr>
      <tr>
        <td colspan="3" style="padding-top:20">
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
