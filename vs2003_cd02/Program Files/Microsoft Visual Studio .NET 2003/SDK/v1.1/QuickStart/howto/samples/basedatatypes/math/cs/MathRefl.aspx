<%@ Import namespace="System" %>
<%@ Import namespace="System.Reflection" %>

<script language="C#" runat="server">

void Page_Load(Object source, EventArgs e) {

	if (Page.IsPostBack == false)
	{
		//populate the testmath's array
		TestMath.mi = TestMath.t.GetMethods (BindingFlags.Public | BindingFlags.Static);

		// identify each unique method name
		String[] UniqueMembers = TestMath.UniqArray();

		// add all the unique method names into the pages listbox...
		foreach (String s in UniqueMembers)
				lstMathMethods.Items.Add( s );
	}

}

void btnRunQuery_Click(Object Src, EventArgs E) {

	Object [] args = null;
	Int32 intCount = 0;

	// make sure we verify that the entries are numeric!!!
	try {
		if ( txtParam2.Visible)
		{
			// these lines will throw an error if the entries are not numeric
			Convert.ToDouble(txtParam1.Text);
			Convert.ToDouble(txtParam2.Text);

			args = new Object[] { Convert.ToDouble(txtParam1.Text), Convert.ToDouble(txtParam2.Text) };
			intCount = 2;
		}
		else if ( txtParam1.Visible)
		{
			// this line will throw an error if the entry is not numeric
			Convert.ToDouble(txtParam1.Text);

			args = new Object[] { Convert.ToDouble(txtParam1.Text) };
			intCount = 1;
		}
	}
	catch (Exception)
	{
		lblOutput.Text = "WARNING: Please ensure you put a numeric value for ALL parameters.";
		lblOutput.ForeColor = System.Drawing.Color.FromName("Red");
		return;
	}

	//-------INVOKE THE SPECIFIED METHOD, WITH THE SPECIFIED PARAMETERS-----------
	String s = TestMath.InvokeMethod( lstMathMethods.Items[lstMathMethods.SelectedIndex].Value, args );


	//--------------WRITE THE OUTPUT TO SCREEN-------------------------
	lblOutput.Text = "<pre>";
	lblOutput.Text += String.Format("The action performed was: {0}",lstMathMethods.Items[lstMathMethods.SelectedIndex].Value);
	lblOutput.Text += "<br>-------------------------------------------------------";

	if (txtParam1.Visible)
		lblOutput.Text += "<br>Value of Parameter 1: " + txtParam1.Text;

	if (txtParam2.Visible)
		lblOutput.Text += "<br>Value of Parameter 2: " + txtParam2.Text;

	lblOutput.Text += "<br>-------------------------------------------------------";
	lblOutput.Text += "<br>The end result of the action is: " + s;

	lblOutput.Text += "</pre>";
}

void resetOptions(Object Src, EventArgs E)
{
	if ( lstMathMethods.SelectedIndex > 0 )
	{
		Int32 intCount = TestMath.CalcParams( lstMathMethods.Items[lstMathMethods.SelectedIndex].Value);

		if (intCount == 0)
		{
			lblInfo.Text = "You have selected a method which accepts " + intCount + " Parameters.";
		}
		else if (intCount == 1)
		{
			lblInfo.Text = "You have selected a method which accepts " +
						intCount + " Parameter. Please Enter the value for that parameter below.";

			lblParam1.Visible = true;
			txtParam1.Visible = true;
			lblParam2.Visible = false;
			txtParam2.Visible = false;
		}
		else
		{
			lblInfo.Text = "You have selected a method which accepts " +
						intCount + " Parameters. Please Enter the values for those parameters below.";

			lblParam1.Visible = true;
			lblParam2.Visible = true;
			txtParam1.Visible = true;
			txtParam2.Visible = true;
		}

		lblInfo.Visible = true;
		btnRunQuery.Enabled = true;

		lblOutput.Text = "";
	}
	else
	{
		lblInfo.Visible = false;
		lblParam1.Visible = false;
		lblParam2.Visible = false;
		txtParam1.Visible = false;
		txtParam2.Visible = false;

		txtParam1.Text = "";
		txtParam2.Text = "";
		lblOutput.Text = "";
		btnRunQuery.Enabled = false;
	}
}


public class TestMath {

	// a copy of all the methods inside the math class...
	public static MethodInfo [] mi;

	// the type of the math class, used by other routines...
	public static Type t = typeof(System.Math);

	//this method dynamically determines what the arguments are inside the identified method
	//note that in many other situations, this method WOULD NOT WORK
	//it goes on the assumption that inside the Math method, every single signature for a given
	//method name has the SAME NUMBER OF PARAMETERS. At the time of writing, this was true,
	// and should be true for the forseeable future. However, if this assumption changes,
	// you would also need toupdate this method
	public static Int32 CalcParams( String methodName)
	{
		Int32 intCount = 0;

		foreach (MethodInfo m in TestMath.mi)
		{
			//only deal with the selected method...
			if ( m.Name == methodName )
			{
				//simply determine the NUMBER of parameters for that method
				foreach (ParameterInfo p in m.GetParameters())
					intCount++;

				break;
			}
		}

		return intCount;
	}

	//this routine dynamically invokes the specified method, with the specified parameters
	public static String InvokeMethod( String methodName, Object[] args )
	{
		String output = "";
		Object result;

		try {
		  result = t.InvokeMember (methodName, BindingFlags.InvokeMethod, null, null, args);
		  output = result.ToString();
		}
		catch (Exception) {
			output = "Please ensure you enter only a valid number of parameters for your specified method";
		}

		return output;
	}

	// this method makes sure that only unique elements are placed into the output array
	// it achieves this bytrying to add each subsequent element from the array of memberinfos
	// into a hashtable. A hashtable cannot have non-unique keys, and throws an error
	// when you attempt to add aduplicate, which we use to our advantage in this routine
	public static String[] UniqArray ()
	{
		Hashtable h = new Hashtable();

		foreach (MemberInfo m in mi)
		{
			try {
				h.Add(m.Name, m.Name);
			} catch (Exception) {}
		}

		String[] s= new String[h.Count];

		Int32 i = 0;

		foreach( Object o in h.Values)
		{
			s[i] = o.ToString();
			i++;
		}

		return s;
	}
}
</script>

<html>
<head>
          <link rel="stylesheet" href="intro.css">
</head>

<body style="background-color:f6e4c6">

<form method=post runat=server>

<div class="indent" style="width:660">
<b>This sample demonstrates the methods available in the Math class.</b> You can invoke any of the non-instantiated methods on the Math class.  However, this particular example always calls the overloaded constructor, which accepts a double or double values. The sample does this so that the exact signature of the method you invoke does not need to be determined.

<p>
You will not be able to determine from the code how the exact method you chose gets invoked, because this sample uses the Reflection class to find all the methods of the Math class at runtime and invoke them dynamically. Please refer to the reflection quickstart sample on invoking methods for more details. This approach results in less hard-coded code, but results in a more involved example. If you want to see some example lines of code that you would need to type to invoke a particular method, please see the discussion page associated with this example.
<p>

The purpose of each method should be fairly self-explanatory, but you should consult the SDK documentation when you are in doubt.  Remember to give the sample a good test, and try out negative and positive values of both whole and floating numbers.
</div>
<HR>

<asp:Table id="basetable" runat="server" border="0" cellspacing="0" cellpadding="5">

<asp:tablerow>
      <asp:tablecell columnspan="2" verticalalign="top" horizontalalign="left">
		Please select the Math method you wish to invoke:
      </asp:tablecell>

      <asp:tablecell columnspan="2" verticalalign="top" horizontalalign="left">

        <asp:DropDownList id="lstMathMethods" runat="server" width="140px"  AutoPostBack="true" OnSelectedIndexChanged="resetOptions">
            <asp:ListItem>Select A Method</asp:ListItem>
        </asp:DropDownList>
      </asp:tablecell>

</asp:tablerow>

<asp:tablerow>
      <asp:tablecell columnspan="4" verticalalign="top">
		<asp:label id="lblInfo" Visible="false" font-Bold="true" runat="server"/>
      </asp:tablecell>

</asp:tablerow>

<asp:tablerow>
      <asp:tablecell verticalalign="top" horizontalalign="left">
	<asp:label id="lblParam1" Visible="false" Width = "130px" Text="First Parameter:" runat="server"/>
      </asp:tablecell>
      <asp:tablecell verticalalign="top">
		<asp:textbox id="txtParam1" Width = "70px" Visible="false" runat="server"/>
      </asp:tablecell>

      <asp:tablecell verticalalign="top" horizontalalign="left">
	<asp:label id="lblParam2" Visible="false" Width = "130px" Text="Second Parameter:" runat="server"/>
      </asp:tablecell>
      <asp:tablecell verticalalign="top">
		<asp:textbox id="txtParam2" Width = "70px" Visible="false" runat="server"/>
      </asp:tablecell>
</asp:tablerow>

<asp:tablerow>
      <asp:tablecell columnspan="4" verticalalign="top">
	<asp:button text="Run Query" id="btnRunQuery" Enabled="false" OnClick="btnRunQuery_Click" runat=server/>
      </asp:tablecell>

</asp:tablerow>

</asp:Table>

<asp:Table id="outputtable" runat="server" border="0" cellspacing="0" cellpadding="5">
<asp:tablerow>
      <asp:tablecell verticalalign="top" horizontalalign="left">
	<asp:label id="lblOutput" Width = "550px" Font-Bold="True" runat="server"/>
      </asp:tablecell>
</asp:tablerow>
</asp:Table>

</form>

</body>
</html>