<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="Acme" %>

<html>

<script language="JScript" runat="server">

    function Page_Load(sender : Object, e : EventArgs) : void {
        if ( Request.QueryString["titleid"] != null )
        {
            if ( InputValidator.IsSafeText(Request.QueryString["titleid"]) ) {
                var query : String = "select * from Titles where title_id = '" + Request.QueryString["titleid"] + "'";

                var myConnection : SqlConnection = new SqlConnection("server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");
                var myCommand : SqlDataAdapter = new SqlDataAdapter(query, myConnection);

                var ds : DataSet = new DataSet();
                myCommand.Fill(ds, "Titles");

                MyDataList.DataSource = ds.Tables("Titles").DefaultView;
                MyDataList.DataBind();
            }
        }
    }

    function Submit_Click(Src : Object, E : EventArgs) : void  {

        Message.InnerHtml = "<h2>Purchase Made!!!</h2>";
    }

</script>

<body topmargin="0" leftmargin="0" marginwidth="0" marginheight="0">

  <!-- #include virtual="/quickstart/aspplus/samples/webforms/customize/header.inc" -->

  <form runat="server">

    <table>
      <tr>
        <td valign="top">

          <ASP:DataList id="MyDataList" runat="server">

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
                      <b>Price: </b><%# DataBinder.Eval(Container.DataItem, "price", "$ {0}") %><br>
                    </td>
                  </tr>
                </table>

              </ItemTemplate>

          </ASP:DataList>

        </td>
        <td valign="top" style="padding-top:15;font: 10pt verdana">

          Thank you for your business!  Please complete the form below to confirm your purchase.
          <p>
          <table style="font: 10pt verdana" cellpadding="3">
            <tr><td><b>Name: </b></td><td><input size="30" type="text" runat="server"></td></tr>
            <tr><td><b>Mailing Address: </b></td><td><input size="50" type="text" runat="server"></td></tr>
            <tr><td><b>Account Number: </b></td><td><input size="10" type="text" runat="server"></td></tr>
          </table>
          <p>
          <input type="submit" value="Purchase" runat="server" OnServerClick="Submit_Click"/>
          <p>

        </td>
      </tr>

    </table>

    <div style="font: 10pt verdana;padding:0,15,15,15" id="Message" runat="server"/>

  </form>

  <!-- #include virtual="/quickstart/aspplus/samples/webforms/customize/footer.inc" -->

</body>
</html>
