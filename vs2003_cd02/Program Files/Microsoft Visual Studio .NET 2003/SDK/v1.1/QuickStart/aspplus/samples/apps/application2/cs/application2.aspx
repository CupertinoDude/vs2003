<%@ Import Namespace="System.Data" %>

<html>

  <script language="C#" runat="server">

      void Page_Load(Object Src, EventArgs E ) {
      
          DataView Source = (DataView)(Application["Source"]);
          MySpan.Controls.Add(new LiteralControl(Source.Table.TableName));
          MyDataGrid.DataSource = Source;
          MyDataGrid.DataBind(); 
      }

  </script>

<body>

  <h3><font face="Verdana">Reading Data in Application_OnStart</font></h3>
  <h4><font face="Verdana">XML Data for Table: <asp:PlaceHolder runat="server" id="MySpan"/></font></h4>

  <ASP:DataGrid id="MyDataGrid" runat="server"
    Width="900"
    BackColor="#ccccff" 
    BorderColor="black"
    ShowFooter="false" 
    CellPadding=3 
    CellSpacing="0"
    Font-Name="Verdana"
    Font-Size="8pt"
    HeaderStyle-BackColor="#aaaadd"
    EnableViewState="false"
  />

</body>
</html>

