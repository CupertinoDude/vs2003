<%@ Import Namespace="System.IO" %>
<script language="C#" runat="server">

    private bool _local = false;
    private bool _maprunsamplepath = false;
    private String _target = "_blank";

    public String _runsample = "";
    public String ViewSource = "";
    public String Caption = "";
    public String Icon = "";

    public void Page_Load(Object sender, EventArgs e) {

        // ONLY DO EXTRA STEPS FOR EXE SAMPLES IF REQUESTOR IS NOT LOCAL
        if (Request.ServerVariables["REMOTE_ADDR"] != Request.ServerVariables["LOCAL_ADDR"]) {

        HttpCookie cookieQS = Page.Request.Cookies["__quickstart_ver1"];

        // for EXE samples, change virtual path to physical path if cookie is present
        if (MapRunSamplePath == true && RunSample != "" && cookieQS != null) {
            if ( _runsample.StartsWith("\\") || _runsample.StartsWith("/") ) {
                _runsample = _runsample.Substring(1);
            }
            _runsample = Path.Combine((String)cookieQS.Values["installroot"], _runsample);
        }

        // if no cookie is present, redirect user to the setup page
        if (MapRunSamplePath == true && cookieQS == null) {
            _runsample = "/quickstart/setup.aspx?ReturnUrl=" + Request.Url;
            _target = "_top";
        }

        // if remote hosting is on, turn all run sample links to view source instead
        if ((String)((NameValueCollection) Context.GetConfig("appSettings"))["RemoteHost"]=="true") {
            if ((_runsample != "")&&(MapRunSamplePath == true))
                if (ViewSource != "")
                    _runsample = "/quickstart/util/srcview.aspx?path=" + ViewSource;
                else
                    _runsample = "";
        }
        }
        else {
          _local = true; // flag so we don't server.mappath in non-local case
        }
    }

    public String RunSample {
        get {
            return _runsample;
        }
        set {
            _runsample = value;
        }
    }

    public bool   MapRunSamplePath {
      get {
        return _maprunsamplepath;
      }
      set {
        _maprunsamplepath = value;
      }
    }

</script>

<table border="0">
  <tr>
    <td width="25">&nbsp;</td>
    <td style="font: x-small tahoma"><nobr>
      <%
      if(RunSample != "") {
	if ((MapRunSamplePath == true)&&(_local)) {
		RunSample=Server.MapPath(RunSample);
	}
      %>

        <a target="<%=_target%>" href="<%=RunSample%>">
        <img border="1" src="<%=Icon%>"><br>
        </a>
        <table><tr><td class="caption"><%=Caption%></tr></td></table><br>

        <% if(ViewSource != "") { %>
          [<a target="<%=_target%>" href="<%=RunSample%>">Run Sample</a>] |
          [<a target="_blank" href="/quickstart/util/srcview.aspx?path=<%=ViewSource%>">View Source</a>]
        <% } else { %>
          [<a target="<%=_target%>" href="<%=RunSample%>">View Sample</a>]
        <% } %>

      <%
      }
      else if(ViewSource != "") {
      %>

        <a target="_blank" href="/quickstart/util/srcview.aspx?path=<%=ViewSource%>">
        <img border="1" src="<%=Icon%>"><br>
        </a>
        <table><tr><td class="caption"><%=Caption%></tr></td></table><br>
        [<a target="_blank" href="/quickstart/util/srcview.aspx?path=<%=ViewSource%>">View Source</a>]

      <%
      }
      else {
      %>

      <b>No Source or Sample to display.</b>

      <%
      }
      %>
    </nobr></td>
  </tr>
</table>