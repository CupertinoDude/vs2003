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

       <form action="intro11.aspx" method="post" runat="server">

           <asp:adrotator AdvertisementFile="ads.xml" BorderColor="black" BorderWidth=1 runat="server"/>

           <table>
              <tr>
                <td> Name: </td>
                <td> <asp:textbox id="Name" runat="server"/> </td>
                <td> <asp:RequiredFieldValidator ControlToValidate="Name" Display="Dynamic" errormessage="You must enter your name!" runat=server/> </td>
              </tr>
              <tr>
                <td> Category: </td>
                <td>
                     <asp:dropdownlist id="Category" width=147 runat=server>
                         <asp:listitem><!--Select Category--></asp:listitem>
                         <asp:listitem >psychology</asp:listitem>
                         <asp:listitem >business</asp:listitem>
                         <asp:listitem >popular_comp</asp:listitem>
                     </asp:dropdownlist>
                </td>
                <td> <asp:RequiredFieldValidator ControlToValidate="Category" Display="Dynamic" InitialValue="<!--Select Category-->" errormessage="You must select a category!" runat=server/> </td>
              </tr>
              <tr>
                 <td></td>
                 <td><asp:button text="Lookup" OnClick="SubmitBtn_Click" runat="server"/></td>
              </tr>
           </table>

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