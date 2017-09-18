<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html>

<script language="C#" runat="server">

    SqlConnection myConnection;

    void Page_Load(Object sender, EventArgs e) {

        myConnection = new SqlConnection("server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");

        SqlDataAdapter myCommand = new SqlDataAdapter("select * from Titles where type = 'business'", myConnection);

        DataSet ds = new DataSet();
        myCommand.Fill(ds, "Titles");

        MyDataList.DataSource=ds.Tables["Titles"].DefaultView;

        if (!Page.IsPostBack) {
            MyDataList.DataBind();
        }
    }

    void MyDataList_Select(Object sender, EventArgs e) {

        String title = MyDataList.DataKeys[MyDataList.SelectedItem.ItemIndex].ToString();
        SqlDataAdapter myCommand = new SqlDataAdapter("select * from Titles where title_id = '" + title + "'" , myConnection);

        DataSet ds = new DataSet();
        myCommand.Fill(ds, "TitleDetails");

        DataRowView rowview = ds.Tables["TitleDetails"].DefaultView[0];

        DetailsImage.Src = "/quickstart/aspplus/images/title-" + rowview["title_id"] + ".gif";
        DetailsPubId.Text = "<b>Publisher ID: </b>" + rowview["pub_id"].ToString() + "<br>";
        DetailsTitleId.Text = "<b>Title ID: </b>" + rowview["title_id"].ToString() + "<br>";
        DetailsType.Text = "<b>Category: </b>" + rowview["type"].ToString() + "<br>";
        DetailsPrice.Text = "<b>Price: </b> $ " + rowview["price"].ToString() + "<p>";
        PurchaseLink.Text = "<img border='0' src='/quickstart/aspplus/images/purchase_book.gif' >";
        PurchaseLink.NavigateUrl ="purchase.aspx?titleid=" + rowview["title_id"].ToString();
        DetailsTitle.Text = rowview["title"].ToString();

        DetailsImage.Visible = true;

        MyDataList.DataBind();
    }

    void MyDataList_ItemCommand(Object sender, DataListCommandEventArgs E) {

        String title = MyDataList.DataKeys[E.Item.ItemIndex].ToString();
        String command = ((LinkButton)E.CommandSource).Text;

        switch(command) {

          case "Discussions" :
            ShowDiscussions(title);
            break;

          case "Ratings" :
            ShowRatings(title);
            break;
        }
    }

    void ShowRatings(String title) {

        Message.InnerHtml = "<h5>Ratings for \"" + title + "\"</h5>";
        Message.InnerHtml += "Print Ratings here...";
    }

    void ShowDiscussions(String title) {

        Message.InnerHtml = "<h5>Discussions for \"" + title + "\"</h5>";
        Message.InnerHtml += "Print Discussions here...";
    }

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

          <SelectedItemTemplate>

            <table cellpadding=10 style="font: 10pt verdana" >
              <tr>
                <td valign="top">
                  <img src='<%# DataBinder.Eval(Container.DataItem, "title_id", "/quickstart/aspplus/images/title-{0}.gif") %>' align="top" width="25" border=1 runat="server"/>
                </td>
                <td valign="top">
                  <b>Title: </b>
                  <asp:linkbutton Font-Bold="true" Text='<%# DataBinder.Eval(Container.DataItem, "title") %>' CommandName="Select" style="color:darkred" runat="server"/>
                  <br>
                  <b>Price: </b><%# DataBinder.Eval(Container.DataItem, "price", "$ {0}") %>
                  <br>
                  <asp:linkbutton Text="Discussions" CommandName="Discuss" style="color:darkred;font:8pt tahoma" runat="server"/>
                  |
                  <asp:linkbutton Text="Ratings" CommandName="Ratings" style="color:darkred;font:8pt tahoma" runat="server"/>
                </td>
              </tr>
            </table>

          </SelectedItemTemplate>

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
