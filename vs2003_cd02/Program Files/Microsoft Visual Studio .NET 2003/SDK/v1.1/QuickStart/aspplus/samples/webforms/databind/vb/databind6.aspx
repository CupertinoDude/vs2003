<html>
<head>

    <script language="VB" runat="server">

        Sub Page_Load(sender As Object, e As EventArgs)
            If Not IsPostBack Then
               Dim values as ArrayList= new ArrayList()

               values.Add (0)
               values.Add (1)
               values.Add (2)
               values.Add (3)
               values.Add (4)
               values.Add (5)
               values.Add (6)

               DataList1.DataSource = values
               DataList1.DataBind
            End If
        End Sub

        Function EvenOrOdd(number As Integer) As String
            If (number Mod 2 <> 0) Then
              Return "Odd"
            Else
              Return "Even"
            End If
        End Function

    </script>

</head>
<body>

    <h3><font face="Verdana">Databinding to Methods and Expressions</font></h3>

    <form runat=server>

      <asp:DataList id="DataList1" runat="server"
        BorderColor="black"
        BorderWidth="1"
        GridLines="Both"
        CellPadding="3"
        CellSpacing="0"
        >

        <ItemTemplate>
          Number Value: <%# Container.DataItem %>
          Even/Odd: <%# EvenOrOdd(Container.DataItem) %>
        </ItemTemplate>

      </asp:datalist>

    </form>

</body>
</html>
