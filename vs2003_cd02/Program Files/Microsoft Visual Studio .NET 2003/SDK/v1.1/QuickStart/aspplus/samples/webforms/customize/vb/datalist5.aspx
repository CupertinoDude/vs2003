<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html>

<script language="VB" runat="server">

    Dim MyConnection As SqlConnection

    Sub Page_Load(Sender As Object, E As EventArgs)

        MyConnection = New SqlConnection("server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")

        If Not (Page.IsPostBack)

            Dim DS As New DataSet
            Dim MyCommand As New SqlDataAdapter("select * from Titles where type = 'business'", MyConnection)

            MyCommand.Fill(DS, "Titles")

            MyDataList.DataSource = DS.Tables("Titles").DefaultView
            MyDataList.DataBind()

        End If
    End Sub

    Sub MyDataList_Select(Sender As Object, E As EventArgs)

        Dim Title As String = MyDataList.DataKeys(MyDataList.SelectedItem.ItemIndex)
        Dim MyCommand As New SqlDataAdapter("select * from Titles where title_id = '" & Title & "'" , MyConnection)

        Dim DS As New DataSet
        MyCommand.Fill(DS, "TitleDetails")

        Dim RowView As DataRowView = DS.Tables("TitleDetails").DefaultView(0)

        DetailsImage.Src = "/quickstart/aspplus/images/title-" & RowView("title_id") & ".gif"
        DetailsPubId.Text = "<b>Publisher ID: </b>" & RowView("pub_id").ToString() & "<br>"
        DetailsTitleId.Text = "<b>Title ID: </b>" & RowView("title_id").ToString() & "<br>"
        DetailsType.Text = "<b>Category: </b>" & RowView("type").ToString() + "<br>"
        DetailsPrice.Text = "<b>Price: </b> $ " & RowView("price").ToString() + "<p>"
        PurchaseLink.Text = "<img border='0' src='/quickstart/aspplus/images/purchase_book.gif' >"
        PurchaseLink.NavigateUrl = "purchase.aspx?titleid=" & RowView("title_id").ToString()
        DetailsTitle.Text = RowView("title").ToString()

        DetailsImage.Visible = true
    End Sub

    Sub MyDataList_ItemCommand(Sender As Object, E As DataListCommandEventArgs)

        Dim Title As String = MyDataList.DataKeys(E.Item.ItemIndex)
        Dim Command As String = E.CommandName

        Select (Command)

          Case "Discuss" :
            ShowDiscussions(Title)

          Case "Ratings" :
            ShowRatings(Title)
       End Select
    End Sub

    Sub ShowRatings(Title As String)

        Message.InnerHtml = "<h5>Ratings for """ & Title & """</h5>"
        Message.InnerHtml &= "Print Ratings here..."
    End Sub

    Sub ShowDiscussions(Title As String)

        Message.InnerHtml = "<h5>Discussions for """ & Title & """</h5>"
        Message.InnerHtml &= "Print Discussions here..."
    End Sub

</script>

<body topmargin="0" leftmargin="0" marginwidth="0" marginheight="0">

  <form runat="server">

  <!-- #include virtual="/quickstart/aspplus/samples/webforms/customize/header.inc" -->

  <table width="100%">
    <tr>
      <td width="50%">

        <ASP:DataList id="MyDataList" OnSelectedIndexChanged="MyDataList_Select" OnItemCommand="MyDataList_ItemCommand" DataKeyField="title_id" runat="server">

          <ItemTemplate>

            <table cellpadding=10 style="font: 10pt verdana">
              <tr>
                <td valign="top">
                  <img align="top" width="25" border=1 src='<%# DataBinder.Eval(Container.DataItem, "title_id", "/quickstart/aspplus/images/title-{0}.gif") %>' runat="server"/>
                </td>
                <td valign="top">
                  <b>Title: </b>
                  <asp:linkbutton Text='<%# DataBinder.Eval(Container.DataItem, "title") %>' CommandName="Select" style="color:darkred" runat="server"/>
                  <br>
                  <b>Price: </b><%# DataBinder.Eval(Container.DataItem, "price", "$ {0}") %>
                  <br>
                  <asp:linkbutton Text="Discussions" CommandName="Discuss" style="color:darkred;font:8pt tahoma" runat="server"/>
                  |
                  <asp:linkbutton Text="Ratings" CommandName="Ratings" style="color:darkred;font:8pt tahoma" runat="server"/>
                </td>
              </tr>
            </table>

          </ItemTemplate>

        </ASP:DataList>

      </td>

      <td valign="top" style="padding-top:15" width="50%">
        <table cellpadding="5" width="100%" style="font: 10pt verdana">
          <tr>
            <td>
              <img id="DetailsImage" visible="false" runat="server">
            </td>
            <td valign="top" width="400">
              <div style="font: 12pt verdana;color:darkred">
                <i><b><asp:Label id="DetailsTitle" runat="server"/></i></b><br>
              </div>
              <asp:Label id="DetailsTitleId" runat="server"/>
              <asp:Label id="DetailsPubId" runat="server"/>
              <asp:Label id="DetailsType" runat="server"/>
              <asp:Label id="DetailsPrice" runat="server"/>
              <asp:HyperLink id="PurchaseLink" runat="server"/>
            </td>
          </tr>
        </table>
      </td>

    </tr>
  </table>

  <!-- #include virtual="/quickstart/aspplus/samples/webforms/customize/footer.inc" -->

  <div id="Message" style="font: 10pt verdana;padding:0,15,15,15" runat="server"/>

  </form>

</body>
</html>
