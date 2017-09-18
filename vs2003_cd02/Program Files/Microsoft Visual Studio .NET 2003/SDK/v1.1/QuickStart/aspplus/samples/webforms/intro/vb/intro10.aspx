<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html>
   <head>
      <link rel="stylesheet"href="intro.css">
   </head>

   <script language="VB" runat=server>

       Sub SubmitBtn_Click(Sender As Object, E As EventArgs)

          Dim DS As DataSet
          Dim MyConnection As SqlConnection
          Dim MyCommand As SqlDataAdapter

          MyConnection = New SqlConnection("server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")
          MyCommand = New SqlDataAdapter("select * from Titles where type='" + Category.SelectedItem.Value + "'", myConnection)

          DS = new DataSet()
          MyCommand.Fill(DS, "Titles")

          MyList.DataSource = DS.Tables("Titles").DefaultView
          MyList.DataBind()

       End Sub

   </script>

   <body>

       <center>

       <form action="intro10.aspx" method="post" runat="server">

           <asp:adrotator AdvertisementFile="ads.xml" BorderColor="black" BorderWidth=1 runat="server"/>

           <h3> Name: <asp:textbox id="Name" runat="server"/>

           Category:  <asp:dropdownlist id="Category" runat=server>
                         <asp:listitem >psychology</asp:listitem>
                         <asp:listitem >business</asp:listitem>
                         <asp:listitem >popular_comp</asp:listitem>
                      </asp:dropdownlist>

           </h3>

           <asp:button text="Lookup" OnClick="SubmitBtn_Click" runat="server"/>

           <p>

           <asp:datalist id="MyList" layout="flow" showfooter=true borderwidth=0 runat=server>

              <HeaderTemplate>

                 <table cellpadding=1 cellspacing=0 >
                    <tr>
                       <td colspan=4>
                          <b><font face="Verdana" size=3>Product Listing </font></b>
                       </td>
                    </tr>
                    <tr>
                       <td colspan=4 height=5 bgcolor="000000"></td>
                    </tr>

              </HeaderTemplate>

              <ItemTemplate>
                      <tr>
                          <td colspan=3 style="font-size:10pt">
                              <b><%# DataBinder.Eval(Container.DataItem, "title_id") %></b>
                              <span> <%# DataBinder.Eval(Container.DataItem, "title") %> </span>
                          </td>
                          <td align=right style="font-size:10pt">
                              <b><%# DataBinder.Eval(Container.DataItem, "price", "{0:c}") %> </b>
                          </td>

                      </tr>
              </ItemTemplate>

              <SeparatorTemplate>
                      <tr>
                          <td colspan=4 height=1 bgcolor="000000"></td>
                      </tr>
              </SeparatorTemplate>

              <FooterTemplate>
                      <tr>
                          <td colspan=4 height=5 bgcolor="000000"></td>
                      </tr>
                  </table>
              </FooterTemplate>

           </asp:datalist>

       </form>

       </center>

   </body>

</html>