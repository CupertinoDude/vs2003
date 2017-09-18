<%@ Page Language="JScript" %>

<html>
<body style="font: 10pt verdana">

  <h3>Retrieving Browser Capabilities</h3>

  Boolean ActiveXControls = <%=Request.Browser.ActiveXControls.ToString()%><br>
  Boolean AOL = <%=Request.Browser.AOL.ToString()%><br>
  Boolean BackgroundSounds = <%=Request.Browser.BackgroundSounds.ToString()%><br>
  Boolean Beta = <%=Request.Browser.Beta.ToString()%><br>
  String Browser = <%=Request.Browser.Browser%><br>
  Boolean CDF = <%=Request.Browser.CDF.ToString()%><br>
  Boolean Cookies = <%=Request.Browser.Cookies.ToString()%><br>
  Boolean Crawler = <%=Request.Browser.Crawler.ToString()%><br>
  Boolean Frames = <%=Request.Browser.Frames.ToString()%><br>
  Boolean JavaApplets = <%=Request.Browser.JavaApplets.ToString()%><br>
  Boolean JavaScript = <%=Request.Browser.JavaScript.ToString()%><br>
  Int32 MajorVersion = <%=Request.Browser.MajorVersion.ToString()%><br>
  Double MinorVersion = <%=Request.Browser.MinorVersion.ToString()%><br>
  String Platform = <%=Request.Browser.Platform%><br>
  Boolean Tables = <%=Request.Browser.Tables.ToString()%><br>
  String Type = <%=Request.Browser.Type%><br>
  Boolean VBScript = <%=Request.Browser.VBScript.ToString()%><br>
  String Version = <%=Request.Browser.Version%><br>
  Boolean Win16 = <%=Request.Browser.Win16.ToString()%><br>
  Boolean Win32 = <%=Request.Browser.Win32.ToString()%><br>

</body>
</html>