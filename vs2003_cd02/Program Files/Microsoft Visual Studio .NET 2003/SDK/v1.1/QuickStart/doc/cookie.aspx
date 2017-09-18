<!-- #include virtual="/quickstart/include/header.inc" -->

  <script language="C#" runat="server">

      void Submit_Click(Object sender, EventArgs e) {

          HttpCookie cookie = new HttpCookie("__quickstart_ver1");
          cookie.Values.Add("installroot", InstallRoot.Text);
          cookie.Expires = DateTime.MaxValue;
          cookie.Path = "/";

          Response.Cookies.Add(cookie);

          // we know the querystring is not null from setup.aspx
          if (Request.QueryString["ReturnUrl"] != "") {
              Response.Write("<script language=\"JScript\">");
              Response.Write("window.top.location = \"" + HttpUtility.HtmlEncode(Request.QueryString["ReturnUrl"]) + "\";");
              Response.Write("<" + "/script>");
          } else {
              Response.Write("<script language=\"JScript\">");
              Response.Write("window.top.location = \"/quickstart/default.aspx\";");
              Response.Write("<" + "/script>");
          }
      }

  </script>

<h4>Please Configure the QuickStart Samples to Run Locally</h4>

Except for the ASP.NET samples, most of the samples in the QuickStart Tutorials will not run unless they are installed on your local machine.  If you haven't already downloaded and installed the .NET Framework SDK and installed the samples, you should do so from the following web site:
<p>
<div class="indent">
<b><a target="_blank" href="http://go.microsoft.com/fwlink/?LinkId=77">Download and Install .NET Framework SDK</a></b>
</div>
<p>

After you have downloaded the SDK and installed the samples, you may configure the online Quickstart to run your local samples by providing the physical path to the QuickStart parent directory on your machine.  The path is used to open the Windows Explorer to the correct location when you choose to run a local-only console or Windows Forms sample.

<form runat="server">
<div class="indent">
  <b>Enter the location of the "Samples" directory on your machine:</b><p>
  <asp:TextBox id="InstallRoot" size="50" value="C:\Program Files\Microsoft.Net\SDK\v1.1" runat="server"/>
  <asp:Button Text="Submit" OnClick="Submit_Click" runat="server" />
</div>
</form>

<!-- #include virtual="/quickstart/include/footer.inc" -->