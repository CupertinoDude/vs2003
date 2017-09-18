
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html>
<script language="VB" runat="server">

    Sub GetSales_Click(Sender As Object, E As EventArgs) 

        Dim DS As DataSet
        Dim MyConnection As SqlConnection
        Dim MyCommand As SqlDataAdapter

        MyConnection = New SqlConnection("server=(local)\NetSDK;database=northwind;Integrated Security=SSPI")
        MyCommand = New SqlDataAdapter("Employee Sales By Country", MyConnection)

        MyCommand.SelectCommand.CommandType = CommandType.StoredProcedure

        MyCommand.SelectCommand.Parameters.Add(New SqlParameter("@Beginning_Date", SqlDbType.DateTime))
        MyCommand.SelectCommand.Parameters("@Beginning_Date").Value = BeginDate.SelectedDate

        MyCommand.SelectCommand.Parameters.Add(New SqlParameter("@Ending_Date", SqlDbType.DateTime))
        MyCommand.SelectCommand.Parameters("@Ending_Date").Value = EndDate.SelectedDate

        DS = new DataSet()
        MyCommand.Fill(DS, "Sales")

        MyDataGrid.DataSource=DS.Tables("Sales").DefaultView
        MyDataGrid.DataBind()
    End Sub

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
