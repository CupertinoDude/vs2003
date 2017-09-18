
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.IO" %>

<script language="JScript" runat="server">

    function Application_Start(sender:Object, e:EventArgs) : void {
    
        var ds:DataSet = new DataSet();

        var fs:FileStream = new FileStream(Server.MapPath("schemadata.xml"),FileMode.Open,FileAccess.Read);
        var reader:StreamReader = new StreamReader(fs);
        ds.ReadXml(reader);
        fs.Close();

        var view:DataView = new DataView(ds.Tables[0]);
        Application["Source"] = view;
    }

</script>