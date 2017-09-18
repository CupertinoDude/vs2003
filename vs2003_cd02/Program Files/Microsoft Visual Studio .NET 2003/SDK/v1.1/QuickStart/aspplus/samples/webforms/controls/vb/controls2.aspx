<html>

    <script language="VB" runat="server">

        Sub Page_Load(Sender As Object, E As EventArgs)
            Message.Text = "You last accessed this page at: " & DateTime.Now
        End Sub

    </script>

    <body>

       <h3><font face="Verdana">Manipulating Server Controls</font></h3>

       This sample demonstrates how to manipulate the &lt;asp:label&gt; server control within 
       the Page_Load event to output the current time.

       <p>

       <hr>

       <asp:label id="Message" font-size="24" font-bold="true" runat=server/>

    </body>

</html>
