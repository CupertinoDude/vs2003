<%@ Import Namespace="System" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Collections" %>
<%@ Import Namespace="System.Resources" %>
<%@ Import Namespace="System.Drawing" %>

<script language="C#" runat=server>

class ReadWriteResources {

	public static ResourceWriter rw;
	static ResourceManager rm;

	public static String FindEntry(String entry) {
		return rm.GetString(entry);
	}

	public static String MakeResourceFile(String name) {
		try {
			rw = new ResourceWriter(name + ".resources");
			rm = ResourceManager.CreateFileBasedResourceManager(name, ".", null);
			return "";
		}
		catch (Exception e) {
			return "There was an error creating the resource file:<br>" +
					e.Message;
		}
	}

	public static String ReadResources(String name) {
		String temp = "";

		ResourceReader rr = new ResourceReader(name + ".resources");

		foreach (DictionaryEntry d in rr) {
				temp += d.Key + ":   " + d.Value + "<br>";
		}

		rr.Close();

		if (temp == "")
			return "No entries are found in the resource file";
		else
			return "<pre>" + temp + "</pre>";
	}
}

void btnFind_Click(Object source, EventArgs e) {

	if (txtFindName.Text.Trim() == "") {
		lblMessage.Text = "Please ensure you enter a search value";
		lblMessage.ForeColor = Color.Red;
		lblOutput.Text = "";
	}
	else {
		String temp = "";

		temp = ReadWriteResources.FindEntry(txtFindName.Text.Trim());

		try {
			Bitmap b = new Bitmap(temp);
			imgDemo.ImageUrl = temp;
			imgDemo.Visible = true;
		}
		catch (Exception) {
			imgDemo.Visible = false;
		}

		if (temp != null) {
			lblOutput.Text = "The following entry for the name '" + txtFindName.Text.Trim() + "' was found:<p>";
			lblOutput.Text += temp;
		}
		else {
			lblOutput.Text = "No entry for the name '" + txtFindName.Text.Trim() + "' was found!";
		}

		lblMessage.Text = "";
	}
}

void btnSave_Click(Object source, EventArgs e) {
	ReadWriteResources.rw.Generate();
	ReadWriteResources.rw.Close();

	btnFind.Visible = true;
	btnView.Visible = true;
	lblFindEntry.Visible = true;
	lblFindName.Visible = true;
	txtFindName.Visible = true;

	lblAddName.Enabled = false;
	txtName.Enabled = false;
	lblAddValue.Enabled = false;
	txtValue.Enabled = false;
	btnAdd.Enabled = false;
	lblAddEntry.Enabled = false;
	btnSave.Enabled = false;
	btnClear.Visible = true;
	lblOutput.Text = "";
	lblMessage.Text = "Enter a value to find, or click the View button";

	//call the view event, just to populate the screen...
	btnView_Click( null, null);
}

void btnView_Click(Object source, EventArgs e) {
	lblOutput.Text = "The following entries are in the resources file:<p>";
	lblOutput.Text += ReadWriteResources.ReadResources(txtResFile.Text.Trim());
	lblMessage.Text = "";
	imgDemo.Visible = false;
}

void btnClear_Click(Object source, EventArgs e) {
	btnClear.Visible = false;
	lblMessage.ForeColor = Color.Black;
	lblMessage.Text = "Enter a Resource Filename";
	lblOutput.Text = "";

	imgDemo.Visible = false;

	btnFind.Visible = false;
	btnView.Visible = false;
	lblFindEntry.Visible = false;
	lblFindName.Visible = false;
	txtFindName.Visible = false;

	lblAddName.Visible = false;
	txtName.Visible = false;
	lblAddValue.Visible = false;
	txtValue.Visible = false;
	btnAdd.Visible = false;
	lblAddEntry.Visible = false;
	btnSave.Visible = false;

	File.Delete(txtResFile.Text.Trim());

	btnMake.Enabled = true;
	txtResFile.Text = "";
	txtResFile.Enabled = true;
}

void btnAdd_Click(Object source, EventArgs ea) {

	if (txtName.Text.Trim() == "" || txtValue.Text.Trim() == "") {
		lblMessage.Text = "Please ensure you enter a name, and a value";
		lblMessage.ForeColor = Color.Red;
		lblOutput.Text = "";
	}
	else {
		try {
			lblMessage.Text = "";

			ReadWriteResources.rw.AddResource(txtName.Text.Trim(), txtValue.Text.Trim());
			lblMessage.Text = "New String entry added successfully";
			lblMessage.ForeColor = Color.Black;
			lblOutput.Text = "";
			btnSave.Enabled=true;
		}
		catch (Exception e) {
			lblMessage.Text = "The following error occurred adding the entry to the file:<br>";
			lblMessage.Text += e.Message;
			lblMessage.ForeColor = Color.Red;
			lblOutput.Text = "";
		}
	}
}

void btnMake_Click(Object source, EventArgs e) {
	if (txtResFile.Text.Trim() == "") {
		lblMessage.ForeColor = Color.Red;
		lblMessage.Text = "Please ensure you enter a filename";
		return;
	}

	String temp;

	temp = ReadWriteResources.MakeResourceFile(txtResFile.Text.Trim());

	if (temp != "") {
		lblMessage.ForeColor = Color.Red;
		lblMessage.Text = temp;
		return;
	}

	lblAddName.Visible = true;
	txtName.Visible = true;
	lblAddValue.Visible = true;
	txtValue.Visible = true;
	btnAdd.Visible = true;
	lblAddEntry.Visible = true;
	btnSave.Visible = true;

	lblAddName.Enabled = true;
	txtName.Enabled = true;
	lblAddValue.Enabled = true;
	txtValue.Enabled = true;
	btnAdd.Enabled = true;
	lblAddEntry.Enabled = true;
	btnSave.Enabled = false;

	txtName.Text = "";
	txtValue.Text = "";
	lblOutput.Text = "";

	btnMake.Enabled = false;
	txtResFile.Enabled = false;

	lblMessage.ForeColor = Color.Black;
	lblMessage.Text = "Enter a name-value pair to add to the file. When finished, click Save";
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
    <tr><td><b>The following example demonstrates reading and writing resource files through code.</b> This demonstration uses objects from the Resources namespace; ResourceManager, ResourceWriter, and ResourceReader. In this sample, you can  specify name and value pairs to add to an arbitrary resource file, which you can subsequently retrieve particular entries from, and parse all entries using the ResourceReader.

<p>
In this demonstration, you can enter the fully qualified path to an image file for the value, and when you click Find Entry, the image will be displayed on the page. This is a small demonstration of how you can quickly display stored graphics back to the user. Do not confuse this particular demonstration with actually saving objects into a resources file, which is also useful, but not part of this demonstration.
		<hr>
    </td></tr> </tr>
</table>

<table width=800>
    <tr><td width=300 colspan=3><b>The resources file to create (E.g. strings):</b></td>
	<td colspan=2><asp:textbox width="150px" id="txtResFile" runat="server"/></td>
	<td width=80><asp:button width="90px" Text="Make File" id="btnMake" onclick="btnMake_Click" runat="server"/></td>
	<td width=80></td>
    </tr>

    <tr><td width=110><b><asp:label id="lblAddEntry" Text="Add New Entry" visible=false runat=server/></b></td>
        <td width=70 align=right><b><asp:label id="lblAddName" Text="Name:" visible=false runat=server/></b></td>
	<td width=80><asp:textbox width="100px" id="txtName" visible=false runat="server"/></td>
        <td width=40 align=right><b><asp:label id="lblAddValue" Text="Value:" visible=false runat=server/></b></td>
	<td width=140><asp:textbox width="160px" id="txtValue" visible=false runat="server"/></td>
	<td width=80><asp:button width="90px" Text="Add Entry" visible=false id="btnAdd" onclick="btnAdd_Click" runat="server"/></td>
	<td width=80><asp:button width="90px" Text="Save File" enabled=false visible=false id="btnSave" onclick="btnSave_Click" runat="server"/></td>
    </tr>

    <tr><td width=110><b><asp:label id="lblFindEntry" Text="Find Entry" visible=false runat=server/></b></td>
        <td width=70 align=right><b><asp:label id="lblFindName" Text="Name:" visible=false runat=server/></b></td>
	<td width=80><asp:textbox width="100px" id="txtFindName" visible=false runat="server"/></td>
	<td width=40></td>
	<td width=100></td>
        <td width=80><asp:button width="90px" Text="Find Entry" visible=false id="btnFind" onclick="btnFind_Click" runat="server"/></td>
	<td width=80></td>
    </tr>

    <tr><td colspan = 5></td>
        <td width=80><asp:button width="90px" Text="View Entries" visible=false id="btnView" onclick="btnView_Click" runat=server/></td>
        <td width=80><asp:button width="90px" Text="Clear" visible=false id="btnClear" onclick="btnClear_Click" runat=server/></td>
    </tr>

    <tr><td colspan=7><b><asp:label id="lblMessage" Text-ForeColor="Red" Text = "Enter a Resource Filename" runat=server/></b></td>
    </tr>

    <tr><td colspan=7><b><asp:label id="lblOutput" runat=server/></b></td>
    </tr>

</table>

<asp:Image id="imgDemo" runat="server"
	AlternateText="This is where the image goes"
	ImageAlign="left"
	Visible=false/>

</form>
</body>
</html>