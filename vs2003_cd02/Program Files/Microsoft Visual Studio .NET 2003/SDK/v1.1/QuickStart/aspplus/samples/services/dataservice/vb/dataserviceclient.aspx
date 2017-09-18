<%@ Import Namespace="DataServiceVB" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html>
<script language="VB" runat="server">

    Protected Sub Page_Load(Src As Object, E As EventArgs)

        Dim D As DataServiceVB.DataService = New DataServiceVB.DataService()
        D.Credentials = System.Net.CredentialCache.DefaultCredentials
        Dim MyData As DataSet = D.GetTitleAuthors()

        Authors_DataGrid.DataSource=MyData.Tables("Authors").DefaultView
        Authors_DataGrid.DataBind()

        Message.InnerHtml = "The number of rows is: " & MyData.Tables("Authors").Rows.Count.ToString()

    End Sub

    Protected Sub Submit_DataSet(Src As Object, E As EventArgs)

        Dim D As DataServiceVB.DataService = New DataServiceVB.DataService()
        D.Credentials = System.Net.CredentialCache.DefaultCredentials
        Dim MyData As DataSet = D.GetTitleAuthors()

        'Remove three rows from the Authors table
        MyData.Tables("Authors").Rows.RemoveAt(0)
        MyData.Tables("Authors").Rows.RemoveAt(1)
        MyData.Tables("Authors").Rows.RemoveAt(2)

        Dim RowCount As Integer = D.PutTitleAuthors(MyData)

        Authors_DataGrid.DataSource=MyData.Tables("Authors").DefaultView
        Authors_DataGrid.DataBind()

        Message.InnerHtml = "The modified number of rows is: " & RowCount.ToString()
    End Sub

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