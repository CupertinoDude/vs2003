<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html>

<script language="C#" runat="server">

    void Page_Load(Object Src, EventArgs E ) {

        if (!Page.IsPostBack) {

            SqlConnection myConnection = new SqlConnection("server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");
            SqlDataAdapter myCommand = new SqlDataAdapter("select * from Titles where type='business'", myConnection);

            DataSet ds = new DataSet();
            myCommand.Fill(ds, "Titles");

            MyDataList.DataSource = ds.Tables["Titles"].DefaultView;
            MyDataList.DataBind();
        }
    }

    void Submit_Click(Object Src, EventArgs E ) {

          for (int i=0; i<MyDataList.Items.Count; i++) {

              String isChecked = ((CheckBox) MyDataList.Items[i].FindControl("Save")).Checked.ToString();
              Message.InnerHtml += "Item(" + i + "): " + isChecked + "<br>";
          }
    }

</script>

<body topmargin="0" leftmargin="0" marginwidth="0" marginheight="0">

  <form runat="server">

  <!-- #include virtual="/quickstart/aspplus/samples/webforms/customize/header.inc" -->

  <ASP:DataList id="MyDataList" RepeatColumns="2" runat="server">

      <ItemTemplate>

        <table cellpadding=10 style="font: 10pt verdana">
          <tr>
            <td width=1 bgcolor="BD8672"/>
            <td valign="top">
              <img align="top" src='<%# DataBinder.Eval(Container.DataItem, "title_id", "/quickstart/aspplus/images/title-{0}.gif") %>' >
            </td>
            <td valign="top">
              <b>Title: </b><%# DataBinder.Eval(Container.DataItem, "title") %><br>
              <b>Category: </b><%# DataBinder.Eval(Container.DataItem, "type") %><br>
              <b>Publisher ID: </b><%# DataBinder.Eval(Container.DataItem, "pub_id") %><br>
              <b>Price: </b><%# DataBinder.Eval(Container.DataItem, "price", "$ {0}") %>
              <p>
              <asp:CheckBox id="Save" runat="server"/> <b>Save to Favorites</b>
            </td>
          </tr>
        </table>

      </ItemTemplate>

  </ASP:DataList>

  <p>

  <div style="padding:0,15,0,15">
      <input type="submit" Value="Update Favorites" OnServerClick="Submit_Click" runat="server"/>
  </div>

  <p>

  <!-- #include virtual="/quickstart/aspplus/samples/webforms/customize/footer.inc" -->

  </form>

  <div style="font: 10pt verdana" EnableViewState="false" id="Message" runat="server"/>

</body>
</html>
