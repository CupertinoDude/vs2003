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

       <form action="intro8.aspx" method="post" runat="server">

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

           <ASP:DataGrid id="MyList" HeaderStyle-BackColor="#aaaadd" BackColor="#ccccff" runat="server"/>

       </form>

       </center>

   </body>

</html>