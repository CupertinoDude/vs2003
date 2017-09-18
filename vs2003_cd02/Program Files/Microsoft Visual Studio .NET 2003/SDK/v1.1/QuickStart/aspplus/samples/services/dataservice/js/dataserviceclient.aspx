<%@ Import Namespace="DataServiceJS" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html>
<script language="JScript" runat="server">

    public function Page_Load(sender:Object, E:EventArgs) : void
    {
        var d:DataService = new DataService();
        d.Credentials = System.Net.CredentialCache.DefaultCredentials;
        var myData:DataSet = d.GetTitleAuthors();

        if (!Page.IsPostBack)
        {
            Authors_DataGrid.DataSource=myData.Tables["Authors"].DefaultView;
            Authors_DataGrid.DataBind();
        }

        Message.InnerHtml = "The number of rows is: " + myData.Tables["Authors"].Rows.Count.ToString();

    }

    public function Submit_DataSet(sender:Object, E:EventArgs) : void
    {

       var d:DataService = new DataService();
       d.Credentials = System.Net.CredentialCache.DefaultCredentials;
       var myData:DataSet = d.GetTitleAuthors();

        //Remove three rows from the Authors table
        myData.Tables["Authors"].Rows.RemoveAt(0);
        myData.Tables["Authors"].Rows.RemoveAt(1);
        myData.Tables["Authors"].Rows.RemoveAt(2);

        var rowCount:int = d.PutTitleAuthors(myData);
        Message.InnerHtml = "The modified number of rows is: " + rowCount.ToString();

        Authors_DataGrid.DataSource=myData.Tables["Authors"].DefaultView;
        Authors_DataGrid.DataBind();
    }

</script>

<body style="font: 10pt verdana">

  <h4>Using Data Access with XML Web services</h4>

  <form runat="server">

      <input type="submit" OnServerclick="Submit_DataSet" value="Remove three rows from the  DataSet" runat="server"/>
      <p>
      <span id="Message" runat="server"/>

      <p>

      <ASP:DataGrid id="Authors_DataGrid" runat="server"
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