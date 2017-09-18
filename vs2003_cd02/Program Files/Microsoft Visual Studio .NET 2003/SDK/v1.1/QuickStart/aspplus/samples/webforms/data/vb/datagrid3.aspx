
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html>
<script language="VB" runat="server">

    Dim MyConnection As SqlConnection

    Sub Page_Load(Sender As Object, E As EventArgs) 

        MyConnection = New SqlConnection("server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")
        
        If Not (IsPostBack) 

            Dim DS As DataSet
            Dim MyCommand As SqlDataAdapter

            MyCommand = New SqlDataAdapter("select distinct State from Authors", MyConnection)
            DS = new DataSet()
            MyCommand.Fill(DS, "States")

            MySelect.DataSource= DS.Tables("States").DefaultView
            MySelect.DataBind()
        End If
    End Sub

    Sub GetAuthors_Click(Sender As Object, E As EventArgs) 

        Dim SelectCmd As String = "select * from Authors where state = @State"

        Dim DS As DataSet
        Dim MyCommand As SqlDataAdapter

        MyCommand = New SqlDataAdapter(SelectCmd, MyConnection)

        MyCommand.SelectCommand.Parameters.Add(New SqlParameter("@State", SqlDbType.NVarChar, 2))
        MyCommand.SelectCommand.Parameters("@State").Value = MySelect.Value

        DS = new DataSet()
        MyCommand.Fill(DS, "Authors")

        MyDataGrid.DataSource= DS.Tables("Authors").DefaultView
        MyDataGrid.DataBind()
    End Sub

</script>

<body style="font: 10pt verdana">

  <form runat="server">

    <h3><font face="Verdana">Dynamic Parameterized Select to a DataGrid Control</font></h3>

    Select a State: 

    <select id="MySelect" DataTextField="State" runat="server"/>

    <input type="submit" OnServerClick="GetAuthors_Click" Value="Get Authors" runat="server"/><p>

    <ASP:DataGrid id="MyDataGrid" runat="server"
      Width="700"
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

  </form>

</body>
</html>
