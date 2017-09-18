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

       <form action="intro9.aspx" method="post" runat="server">

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

           <asp:datalist id="MyList" repeatcolumns="2" borderwidth="0" runat="server">

             <ItemTemplate>

                 <table>
                   <tr>

                     <td>
                         <img src='<%# DataBinder.Eval(Container.DataItem, "title_id", "/quickstart/aspplus/images/title-{0}.gif") %>'>
                     </td>

                     <td width=250 valign=top>

                         <b><%# DataBinder.Eval(Container.DataItem, "title") %></b>

                         <br><br>

                         Price: <%# DataBinder.Eval(Container.DataItem, "price", "{0:c}") %>
                     </td>

                   </tr>
                 </table>

             </ItemTemplate>

           </asp:datalist>

       </form>

       </center>

   </body>

</html>