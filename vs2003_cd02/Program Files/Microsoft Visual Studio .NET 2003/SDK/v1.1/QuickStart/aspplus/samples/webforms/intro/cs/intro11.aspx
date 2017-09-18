<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html>
   <head>
      <link rel="stylesheet"href="intro.css">
   </head>

   <script language="C#" runat=server>

       void SubmitBtn_Click(Object sender, EventArgs e) {

          SqlConnection myConnection = new SqlConnection("server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");
          SqlDataAdapter myCommand = new SqlDataAdapter("select * from Titles where type='" + Category.SelectedItem.Value + "'", myConnection);

          DataSet ds = new DataSet();
          myCommand.Fill(ds, "Titles");

          MyList.DataSource = ds.Tables["Titles"].DefaultView;
          MyList.DataBind();
       }

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