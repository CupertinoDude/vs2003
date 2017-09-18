<%@ Import Namespace="System" %>
<%@ Import Namespace="System.IO" %>
<%@Import Namespace="System.Globalization"%>
<%@ Import Namespace="System.Resources" %>
<%@Import Namespace="System.Threading"%>

<script runat="Server" Language="C#">

class ResHold {
	public static ResourceManager rm;
	public static CultureInfo ci;
}

void Page_Init(Object sender, EventArgs args) {
	// Get the ResourceManager from the Application object.
	ResHold.rm = ResourceManager.CreateFileBasedResourceManager("strings", 
			Server.MapPath("resources") + Path.DirectorySeparatorChar, null);

	// Fill the drop-down list with the supported culture values.
	MyUICulture.Items.Add("Choose a Language");
	MyUICulture.Items.Add("de-DE");
	MyUICulture.Items.Add("en-US");
	MyUICulture.Items.Add("en-NZ");
}

void btnContinue_Click(Object source, EventArgs e) {
	String SelectedCulture = MyUICulture.SelectedItem.Text;
	ResHold.ci = new CultureInfo(SelectedCulture);

	lblEnterName.Text = ResHold.rm.GetString("promptName", ResHold.ci);
	lblEnterName.Visible = true;

	lblSelCulture.Enabled = false;
	MyUICulture.Enabled = false;
	btnContinue.Enabled = false;
	
	btnNameNext.Visible = true;
	txtEnterName.Visible = true;
	txtEnterName.Text = "";
}

void btnNameNext_Click(Object source, EventArgs e) {

	if (txtEnterName.Text.Trim() == "") {
		lblMessage.Visible = true;
		lblMessage.Text = ResHold.rm.GetString("promptMissing", ResHold.ci);
		return;
	}

	lblEnterAge.Text = ResHold.rm.GetString("promptAge", ResHold.ci);
	lblEnterAge.Visible = true;

	lblEnterName.Enabled = false;
	txtEnterName.Enabled = false;
	btnNameNext.Enabled = false;
	
	btnAgeNext.Visible = true;
	txtEnterAge.Visible = true;
	txtEnterAge.Text = "";

	lblMessage.Visible = false;
}

void btnAgeNext_Click(Object source, EventArgs e) {

	Int32 age = 0;

	try {
		age = Convert.ToInt32(txtEnterAge.Text);
	}
	catch (Exception) {}

	if ( age >= 15 && age <= 120 ) {

		lblEnterHeat.Text = ResHold.rm.GetString("promptDegrees", ResHold.ci) + 
				" " + ResHold.rm.GetString("degree1", ResHold.ci);
		lblEnterHeat.Visible = true;

		lblEnterAge.Enabled = false;
		txtEnterAge.Enabled = false;
		btnAgeNext.Enabled = false;

		btnHeatNext.Visible = true;
		txtEnterHeat.Visible = true;
		txtEnterHeat.Text = "";

		lblMessage.Visible = false;
	}
	else {
		lblMessage.Visible = true;
		lblMessage.Text = ResHold.rm.GetString("promptValidAge", ResHold.ci);
	}
}

void btnHeatNext_Click(Object source, EventArgs e) {

	Int32 degrees = 0;

	if (txtEnterHeat.Text.Trim() == "") {
		lblMessage.Visible = true;
		lblMessage.Text = ResHold.rm.GetString("promptValidDeg", ResHold.ci);
		return;
	}		

	try {
		degrees = Convert.ToInt32(txtEnterHeat.Text);
	}
	catch (Exception) {}

	if ( degrees >= Convert.ToInt32(ResHold.rm.GetString( "degree2", ResHold.ci)) && 
			degrees <= Convert.ToInt32(ResHold.rm.GetString( "degree3", ResHold.ci )) ) {

		lblEnterDist.Text = ResHold.rm.GetString("promptDist", ResHold.ci) + 
				" " + ResHold.rm.GetString("dist1", ResHold.ci);
		lblEnterDist.Visible = true;

		lblEnterHeat.Enabled = false;
		txtEnterHeat.Enabled = false;
		btnHeatNext.Enabled = false;

		btnFinish.Visible = true;
		txtEnterDist.Visible = true;
		txtEnterDist.Text = "";

		lblMessage.Visible = false;
	}
	else {
		lblMessage.Visible = true;
		lblMessage.Text = ResHold.rm.GetString("promptValidDeg", ResHold.ci);
	}
}

void btnFinish_Click(Object source, EventArgs e) {

	Int32 distance = 0;

	if (txtEnterDist.Text.Trim() == "") {
		lblMessage.Visible = true;
		lblMessage.Text = ResHold.rm.GetString("promptValidDist", ResHold.ci);
		return;
	}		

	try {
		distance = Convert.ToInt32(txtEnterDist.Text);
	}
	catch (Exception) { 
		lblMessage.Visible = true;
		lblMessage.Text = ResHold.rm.GetString("promptMissing", ResHold.ci);		
		return;
	}

	lblEnterDist.Enabled = false;
	txtEnterDist.Enabled = false;
	btnFinish.Enabled = false;

	//build the output
	lblOutput.Text = ResHold.rm.GetString("promptEntries", ResHold.ci) + "<p>";
	lblOutput.Text += ResHold.rm.GetString("outputName", ResHold.ci) + " " + txtEnterName.Text.Trim() + "<br>";
	lblOutput.Text += ResHold.rm.GetString("outputAge", ResHold.ci) + " " + txtEnterAge.Text.Trim() + "<br>";
	lblOutput.Text += ResHold.rm.GetString("outputDegrees", ResHold.ci) + " " + txtEnterHeat.Text.Trim() + "<br>";
	lblOutput.Text += ResHold.rm.GetString("outputDist", ResHold.ci) + " " + txtEnterDist.Text.Trim();

	lblMessage.Visible = false;
	lblOutput.Visible = true;
	btnRestart.Visible = true;
}

void btnRestart_Click(Object source, EventArgs e) {
	lblSelCulture.Enabled = true;
	MyUICulture.Enabled = true;
	MyUICulture.SelectedIndex = 0;
	btnContinue.Enabled = true;

	lblEnterDist.Enabled = true;
	lblEnterDist.Visible = false;
	txtEnterDist.Enabled = true;
	txtEnterDist.Visible = false;
	txtEnterDist.Text = "";
	btnFinish.Enabled = true;
	btnFinish.Visible = false;

	lblEnterHeat.Enabled = true;
	lblEnterHeat.Visible = false;
	txtEnterHeat.Enabled = true;
	txtEnterHeat.Visible = false;
	txtEnterHeat.Text = "";
	btnHeatNext.Enabled = true;
	btnHeatNext.Visible = false;

	lblEnterName.Enabled = true;
	lblEnterName.Visible = false;
	txtEnterName.Enabled = true;
	txtEnterName.Visible = false;
	txtEnterName.Text = "";
	btnNameNext.Enabled = true;
	btnNameNext.Visible = false;

	lblEnterAge.Enabled = true;
	lblEnterAge.Visible = false;
	txtEnterAge.Enabled = true;
	txtEnterAge.Visible = false;
	txtEnterAge.Text = "";
	btnAgeNext.Enabled = true;
	btnAgeNext.Visible = false;

	lblOutput.Visible = false;
	btnRestart.Visible = false;
}

void EnableCont(Object source, EventArgs e) {
	btnContinue.Enabled = (MyUICulture.SelectedIndex > 0);
}
</script>


<html>
<head>
          <link rel="stylesheet" href="intro.css">
</head>

<body style="background-color:f6e4c6">

<form runat="server">
    <p>

<table>
    <tr><td><b>The following example demonstrates reading information from resource files, through an aspx page.</b> In order to use resources through ASP.NET, you need to place your resource files in the application directory in which your application resides (either directly, or through sub-directories). To use the resource files, access and reference them just as you would use resources through a console application.
		<hr>
    </td></tr> </tr>
</table>

<table width=800>
    <tr><td width=450><b><asp:label id="lblSelCulture" Text="Please select a culture==>"
			visible=true runat=server/></b></td>
	<td colspan><asp:DropDownList id="MyUICulture" 
			AutoPostBack=true
			OnSelectedIndexChanged="EnableCont"
			runat="server"/></td>
	<td width=80><asp:button width="90px" 
			Text="Continue" 
			Enabled=false
			id="btnContinue"
			onclick="btnContinue_Click" 
			runat="server"/></td>
    </tr>

    <tr><td><b><asp:label id="lblEnterName" visible=false runat=server/></b></td>
	<td><asp:textbox width="100px" id="txtEnterName" visible=false runat="server"/></td>
	<td><asp:button width="90px" Text="Next" 
			visible=false 
			id="btnNameNext" 
			onclick="btnNameNext_Click" 
			runat="server"/></td>
    </tr>

    <tr><td><b><asp:label id="lblEnterAge" visible=false runat=server/></b></td>
	<td><asp:textbox width="100px" id="txtEnterAge" visible=false runat="server"/></td>
	<td><asp:button width="90px" Text="Next" 
			visible=false 
			id="btnAgeNext" 
			onclick="btnAgeNext_Click" 
			runat="server"/></td>
    </tr>

    <tr><td><b><asp:label id="lblEnterHeat" visible=false runat=server/></b></td>
	<td><asp:textbox width="100px" id="txtEnterHeat" visible=false runat="server"/></td>
	<td><asp:button width="90px" Text="Next" 
			visible=false 
			id="btnHeatNext" 
			onclick="btnHeatNext_Click" 
			runat="server"/></td>
    </tr>

    <tr><td><b><asp:label id="lblEnterDist" visible=false runat=server/></b></td>
	<td><asp:textbox width="100px" id="txtEnterDist" visible=false runat="server"/></td>
	<td><asp:button width="90px" Text="Finish" 
			visible=false 
			id="btnFinish" 
			onclick="btnFinish_Click" 
			runat="server"/></td>
    </tr>

    <tr><td colspan=2><b><asp:label id="lblOutput" visible=false runat=server/></b></td>
	<td><asp:button width="90px" Text="Restart" 
			visible=false 
			id="btnRestart" 
			onclick="btnRestart_Click" 
			runat="server"/></td>
    </tr>

    <tr><td colspan=3><b><asp:label id="lblMessage" ForeColor="Red" visible=false runat=server/></b></td>
    </tr>
</table>

</form>
</body>
</html>