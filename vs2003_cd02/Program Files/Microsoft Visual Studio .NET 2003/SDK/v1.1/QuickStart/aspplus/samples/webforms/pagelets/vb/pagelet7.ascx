<%@ Control ClassName="Pagelet7VB" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="VB" runat="server">

    Private _category As String = ""

    Public Property Category As String
      Get
        Return _category
      End Get
      Set
          _category = Value

          Dim DS As DataSet
          Dim MyConnection As SqlConnection
          Dim MyCommand As SqlDataAdapter

          MyConnection = New SqlConnection("server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")
          MyCommand = New SqlDataAdapter("select * from Titles where type='" & _category & "'", MyConnection)

          DS = New DataSet()
          MyCommand.Fill(DS, "Titles")

          MyDataList.DataSource = DS.Tables("Titles").DefaultView
          MyDataList.DataBind()
      End Set
    End Property

</script>

<span style="font: 12pt verdana">Category: <%=Category%></span>

<ASP:DataList id="MyDataList" BorderWidth="0" RepeatColumns="2" runat="server">

    <ItemTemplate>

      <table cellpadding=10 style="font: 10pt verdana">
        <tr>
          <td valign="top">
            <img align="top" src='<%# DataBinder.Eval(Container.DataItem, "title_id", "/quickstart/aspplus/images/title-{0}.gif") %>' >
          </td>
          <td valign="top">
            <b>Title: </b><%# DataBinder.Eval(Container.DataItem, "title") %><br>
            <b>Category: </b><%# DataBinder.Eval(Container.DataItem, "type") %><br>
            <b>Publisher ID: </b><%# DataBinder.Eval(Container.DataItem, "pub_id") %><br>
            <b>Price: </b><%# DataBinder.Eval(Container.DataItem, "price", "$ {0}") %>
          </td>
        </tr>
      </table>

    </ItemTemplate>

</ASP:DataList>
