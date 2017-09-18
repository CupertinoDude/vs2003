<%@ Import namespace="System" %>
<%@ Import namespace="System.Reflection" %>

<script language="C#" runat="server">

void btnRunQuery_Click(Object Src, EventArgs E) {
	//first, clear out the old label
	lblResults.Text = "";

	Type t;

	if (txtDatatype.Visible)
		t = Type.GetType("System." + txtDatatype.Text);
	else
		t = Type.GetType("System." + lstDatatype.Items[lstDatatype.SelectedIndex].Value);


	//check to see if we have a valid value...
	if (t == null)
	{
		//Don't assume that it is a SYSTEM datatype...
		if (txtDatatype.Visible)
			t = Type.GetType(txtDatatype.Text);
	}


	//if it is still not found, error out...
	if (t == null)
	{
		lblResults.Text = "Please ensure you specify only valid types in the type field.<BR>";
		lblResults.Text += "REMEMBER: The Case matters (Byte is not the same as byte).";
		lblResults.ForeColor = System.Drawing.Color.FromName("Red");
		lblResults.Visible = true;
		return;
	}

	//first, let the user know what type they selected!
	lblResults.Text = "<B>The datatype you selected to search on is <U>";

	if (txtDatatype.Visible)
		lblResults.Text += txtDatatype.Text;
	else
		lblResults.Text += lstDatatype.Items[lstDatatype.SelectedIndex].Value;

	lblResults.Text += "</U>.</B><P>";


	lblResults.ForeColor = System.Drawing.Color.FromName("Black");

	//declare the arrays to hold the information...
	MethodInfo [] mi;
	EventInfo  [] ei;
	PropertyInfo  [] pi;
	ConstructorInfo [] ci;
	FieldInfo [] fi;

	bool allChecked = (chkFields.Checked || chkProperties.Checked || chkEvents.Checked || chkMethods.Checked || chkConstructors.Checked);

	if (chkStatic.Checked)
	{
		//Static Fields
		if (chkFields.Checked || !allChecked)
		{
			fi = t.GetFields (BindingFlags.Static | BindingFlags.NonPublic | BindingFlags.Public);
			AddHeader("Static Fields");
			PrintMembers (fi);
		}

		//Static Properites
		if (chkProperties.Checked || !allChecked)
		{
			pi = t.GetProperties (BindingFlags.Static | BindingFlags.NonPublic | BindingFlags.Public);
			AddHeader("Static Properties");
			PrintMembers (pi);
		}

		//Static Events
		if (chkEvents.Checked || !allChecked)
		{
			ei = t.GetEvents (BindingFlags.Static | BindingFlags.NonPublic | BindingFlags.Public);
			AddHeader("Static Events");
			PrintMembers (ei);
		}

		//Static Methods
		if (chkMethods.Checked || !allChecked)
		{
			mi = t.GetMethods (BindingFlags.Static | BindingFlags.NonPublic | BindingFlags.Public);
			AddHeader("Static Methods");
			PrintMembers (mi);
		}

		//Constructors
		if (chkConstructors.Checked || !allChecked)
		{
			ci = t.GetConstructors (BindingFlags.Static | BindingFlags.NonPublic | BindingFlags.Public);
			AddHeader("Static Constructors");
			PrintMembers (ci);
		}
	}

	if (chkInstance.Checked)
	{

		//Instance Fields
		if (chkFields.Checked || !allChecked)
		{
			fi = t.GetFields (BindingFlags.Instance | BindingFlags.NonPublic | BindingFlags.Public);
			AddHeader("Instance Fields");
			PrintMembers (fi);
		}

		//Instance Properites
		if (chkProperties.Checked || !allChecked)
		{
			pi = t.GetProperties (BindingFlags.Instance | BindingFlags.NonPublic | BindingFlags.Public);
			AddHeader("Instance Properties");
			PrintMembers (pi);
		}


		//Instance Events
		if (chkEvents.Checked || !allChecked)
		{
			ei = t.GetEvents (BindingFlags.Instance | BindingFlags.NonPublic | BindingFlags.Public);
			AddHeader("Instance Events");
			PrintMembers (ei);
		}

		//Instance Methods
		if (chkMethods.Checked || !allChecked)
		{
			mi = t.GetMethods (BindingFlags.Instance | BindingFlags.NonPublic | BindingFlags.Public);
			AddHeader("Instance Methods");
			PrintMembers (mi);
		}
	}

	lblResults.Visible = true;
}

void AddHeader( String HeaderToAdd )
{

	lblResults.Text += "<p><B>----- " + HeaderToAdd + " -----</B>";

}

void PrintMembers (MemberInfo [] ms)
{
	foreach (MemberInfo m in ms)
	{
		lblResults.Text += "<BR> - " + m;
	}
}

void resetDisplay(Object Src, EventArgs E)
{
	lblResults.Visible = false;

	if (!(chkInstance.Checked || chkStatic.Checked))
	{
		lblResults.Text = "You must select a style of the member information (Instance/Static)";
		lblResults.ForeColor = System.Drawing.Color.FromName("Red");
		lblResults.Visible = true;
		btnRunQuery.Enabled = false;
		return;
	}

	//check the value of this dropdown list. If it is the first entry, DISABLE the button!
	if (lstDatatype.SelectedIndex <= 0)
	{
		btnRunQuery.Enabled = false;
		txtDatatype.Visible = false;
		return;
	}
	else if (lstDatatype.SelectedIndex >= (lstDatatype.Items.Count - 1))
	{
		txtDatatype.Visible = true;
		btnRunQuery.Enabled = true;
	}
	else
	{
		txtDatatype.Visible = false;
		btnRunQuery.Enabled = true;
	}

	//ensure also that at least instance, OR static is checked!
	if (chkInstance.Checked || chkStatic.Checked)
		btnRunQuery.Enabled = true;
	else
		btnRunQuery.Enabled = false;


}

</script>

<html>
<head>
          <link rel="stylesheet" href="intro.css">
</head>

<body style="background-color:f6e4c6">

<form method=post runat=server>
<b>This is a short demonstration which illustrates how to find specific member information for a given type.</b> It uses classes and methods from the Reflection namespace to look at the actual code you develop with.
<p>
We have selected a few common types for you to start your searching with as a suggestion, but you can enter a type of your own, or a different System type if you wish. Remember that if you do enter a type rather than selecting one from the list, you should give the full namespace and class name for your type (the only exception is types inside the System namespace). When looking through the information returned, you are presented with the datatype returned (if applicable), and in the case of methods, you also get the signature for that method. Where the member is implemented or inherited from another object, you will also see the full namespace for that member, in its original location.
<br>

Happy Searching!
<HR>
<P>

<asp:Table id="basetable" runat="server" border="0" cellspacing="0" cellpadding="5">

<asp:tablerow>
      <asp:tablecell verticalalign="top">
		Please select the datatype you wish to search on:
      </asp:tablecell>

      <asp:tablecell columnspan="2" verticalalign="top">

        <asp:DropDownList id="lstDatatype" runat="server" width="140px"  AutoPostBack="true" OnSelectedIndexChanged="resetDisplay">
            <asp:ListItem>Select A Datatype</asp:ListItem>
            <asp:ListItem>Array</asp:ListItem>
            <asp:ListItem>Double</asp:ListItem>
            <asp:ListItem>Int32</asp:ListItem>
            <asp:ListItem>Single</asp:ListItem>
            <asp:ListItem>String</asp:ListItem>
            <asp:ListItem>Other (specify) --></asp:ListItem>
        </asp:DropDownList>
      </asp:tablecell>

      <asp:tablecell verticalalign="top">
	<asp:TextBox id="txtDatatype" Width="120px" Visible="false" runat="server"/>
      </asp:tablecell>

      <asp:tablecell columnspan="3" verticalalign="top" horizontalalign="center">
	<asp:button text="Run Query" id="btnRunQuery" Enabled="false" OnClick="btnRunQuery_Click" runat=server/>
      </asp:tablecell>
</asp:tablerow>

<asp:tablerow>
      <asp:tablecell  verticalalign="top">Please include the following members:
      </asp:tablecell>

      <asp:tablecell verticalalign="top">
        <asp:CheckBox id="chkFields" Text="Fields" runat="server" AutoPostBack="true" OnCheckedChanged="resetDisplay"/>
      </asp:tablecell>

      <asp:tablecell verticalalign="top">
        <asp:CheckBox id="chkProperties" Text="Properties" runat="server" AutoPostBack="true" OnCheckedChanged="resetDisplay"/>
      </asp:tablecell>

      <asp:tablecell verticalalign="top">
        <asp:CheckBox id="chkMethods" Text="Methods" runat="server" AutoPostBack="true" OnCheckedChanged="resetDisplay"/>
      </asp:tablecell>

      <asp:tablecell verticalalign="top">
        <asp:CheckBox id="chkEvents" Text="Events" runat="server" AutoPostBack="true" OnCheckedChanged="resetDisplay"/>
      </asp:tablecell>

      <asp:tablecell verticalalign="top">
        <asp:CheckBox id="chkConstructors" Text="Constructors" runat="server" AutoPostBack="true" OnCheckedChanged="resetDisplay"/>
      </asp:tablecell>
</asp:tablerow>

<asp:tablerow>
      <asp:tablecell  verticalalign="top">Please include the following styles:
      </asp:tablecell>

      <asp:tablecell verticalalign="top">
        <asp:CheckBox id="chkInstance" Text="Instance" Checked="true" runat="server" AutoPostBack="true" OnCheckedChanged="resetDisplay"/>
      </asp:tablecell>

      <asp:tablecell verticalalign="top">
        <asp:CheckBox id="chkStatic" Text="Static" runat="server" AutoPostBack="true" OnCheckedChanged="resetDisplay"/>
      </asp:tablecell>

      <asp:tablecell columnspan="3" verticalalign="top"></asp:tablecell>
</asp:tablerow>

</asp:table>


<P>
<asp:Label id="lblResults"
	Font-Name="Verdana"
	Font-Size="10pt"
	Width="750px"
	BorderStyle="solid"
	BorderColor="#cccccc"
	Visible = "false"
	runat="server"/>

<P>

</form>

</body>
</html>