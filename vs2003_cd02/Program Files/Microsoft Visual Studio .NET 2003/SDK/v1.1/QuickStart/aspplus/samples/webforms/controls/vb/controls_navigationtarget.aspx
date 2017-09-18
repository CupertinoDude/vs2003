<html>

    <script language="VB" runat="server">

        Sub Page_Load(Sender As Object, E As EventArgs)

           If Not (Page.IsPostBack)
              NameLabel.Text = Request.QueryString("Name")
           End If
        End Sub

    </script>

    <body>

       <h3><font face="Verdana">Handling Page Navigation</font></h3>

       <p>

       This sample demonstrates how to receive a navigation request from another
       page, and extract the querystring argument within the Page_Load event.  

       <p>

       <hr>

      
       <form action="controls_NavigationTarget.aspx" runat=server>

          <font face="Verdana"> 

             Hi <asp:label id="NameLabel" runat=server/>!

          </font>

       </form>

    </body>

</html>
