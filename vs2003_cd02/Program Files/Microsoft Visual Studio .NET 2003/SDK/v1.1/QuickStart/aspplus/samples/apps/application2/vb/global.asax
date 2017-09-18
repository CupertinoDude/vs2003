
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.IO" %>

<script language="VB" runat="server">

    Sub Application_Start(Sender As Object, E As EventArgs)
    
        Dim DS As New DataSet

        Dim FS As FileStream

        FS = New FileStream(Server.MapPath("schemadata.xml"),FileMode.Open,FileAccess.Read)
        Dim Reader As StreamReader
        Reader = New StreamReader(FS)
        DS.ReadXml(Reader)
        FS.Close()

        Dim View As DataView
        View = New DataView(ds.Tables(0))
        Application("Source") = View
    End Sub

</script>