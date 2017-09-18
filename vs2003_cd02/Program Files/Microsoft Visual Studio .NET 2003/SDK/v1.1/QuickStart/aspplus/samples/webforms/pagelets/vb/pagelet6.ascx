<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="VB" runat="server">

    Sub Page_Load(Src As Object, E As EventArgs)

        If Not (Page.IsPostBack)

            Dim DS As DataSet
            Dim MyConnection As SqlConnection
            Dim MyCommand As SqlDataAdapter

            MyConnection = New SqlConnection("server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")
            MyCommand = New SqlDataAdapter("select * from Titles where type='" & Category.SelectedItem.Value & "'", MyConnection)

            DS = New DataSet()
            MyCommand.Fill(DS, "Titles")

            MyDataList.DataSource = DS.Tables("Titles").DefaultView
            MyDataList.DataBind()
       End If
    End Sub

    Sub Category_Select(Sender As Object, E As EventArgs)

            Dim DS As DataSet
            Dim MyConnection As SqlConnection
            Dim MyCommand As SqlDataAdapter

            MyConnection = New SqlConnection("server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")
            MyCommand = New SqlDataAdapter("select * from Titles where type='" & Category.SelectedItem.Value & "'", MyConnection)

            DS = New DataSet()
            MyCommand.Fill(DS, "Titles")

            MyDataList.DataSource = DS.Tables("Titles").DefaultView
            MyDataList.DataBind()
    End Sub

</script>

<table style="font: 10pt verdana">
  <tr>
    <td><b>Select a Category:</b></td>
    <td style="padding-left:15">
      <ASP:DropDownList AutoPostBack="true" id="Category" OnSelectedIndexChanged="Category_Select" runat="server">
        <ASP:ListItem value="business">Business</ASP:ListItem>
        <ASP:ListItem value="trad_cook">Traditional Cooking</ASP:ListItem>
        <ASP:ListItem value="mod_cook">Modern Cooking</ASP:ListItem>
      </ASP:DropDownList>
    </td>
  </tr>
</table>

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
