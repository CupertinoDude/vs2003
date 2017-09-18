
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.IO" %>

<script language="C#" runat="server">

    void Application_Start(Object sender, EventArgs e) {
    
        DataSet ds = new DataSet();

        FileStream fs = new FileStream(Server.MapPath("schemadata.xml"),FileMode.Open,FileAccess.Read);
        StreamReader reader = new StreamReader(fs);
        ds.ReadXml(reader);
        fs.Close();

        DataView view = new DataView(ds.Tables[0]);
        Application["Source"] = view;
    }

</script>