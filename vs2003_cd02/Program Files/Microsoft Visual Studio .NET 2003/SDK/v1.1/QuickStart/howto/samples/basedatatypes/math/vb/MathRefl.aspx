<%@ Page Language="VB" Debug="true" %>

<%@ Import namespace="System" %>
<%@ Import namespace="System.Reflection" %>

<script language="VB" runat="server">

Sub Page_Load(src As Object, E As EventArgs)

	if Page.IsPostBack = false Then

		' populate the testmath's array
		TestMath.mi = TestMath.t.GetMethods (BindingFlags.Public Or BindingFlags.Static)

		'  identify each unique method name
		Dim UniqueMembers() As String = TestMath.UniqArray()

		Dim s As String

		'  add all the unique method names into the pages listbox...
		For Each s in UniqueMembers
			lstMathMethods.Items.Add( s )
		Next s
	End If

End Sub

Sub btnRunQuery_Click(Src As Object, E As EventArgs)

	Dim args() As Object = Nothing
	Dim intCount As Int32 = 0

	'  make sure we verify that the entries are numeric!!!
	Try
		If txtParam2.Visible Then

			'  these lines will throw an error if the entries are not numeric
			Convert.ToDouble(txtParam1.Text)
			Convert.ToDouble(txtParam2.Text)

			args = New Object() { Convert.ToDouble(txtParam1.Text), Convert.ToDouble(txtParam2.Text) }
			intCount = 2

		Else If ( txtParam1.Visible)

			'  this line will throw an error if the entry is not numeric
			Convert.ToDouble(txtParam1.Text)

			args = New Object() { Convert.ToDouble(txtParam1.Text) }
			intCount = 1
		End If

	Catch

		lblOutput.Text = "WARNING: Please ensure you put a numeric value for ALL parameters."
		lblOutput.ForeColor = System.Drawing.Color.FromName("Red")
		return
	End Try

	' -------INVOKE THE SPECIFIED METHOD, WITH THE SPECIFIED PARAMETERS-----------
	Dim s As String = TestMath.InvokeMethod( lstMathMethods.Items(lstMathMethods.SelectedIndex).Value, args )


	' --------------WRITE THE OUTPUT TO SCREEN-------------------------
	lblOutput.Text = "<pre>"
	lblOutput.Text = lblOutput.Text + String.Format("The action performed was: {0}",lstMathMethods.Items(lstMathMethods.SelectedIndex).Value)
	lblOutput.Text = lblOutput.Text + "<br>-------------------------------------------------------"

	If txtParam1.Visible Then
		lblOutput.Text = lblOutput.Text + "<br>Value of Parameter 1: " + txtParam1.Text
	End If

	If txtParam2.Visible Then
		lblOutput.Text = lblOutput.Text + "<br>Value of Parameter 2: " + txtParam2.Text
	End If

	lblOutput.Text = lblOutput.Text + "<br>-------------------------------------------------------"
	lblOutput.Text = lblOutput.Text + "<br>The end result of the action is: " + s

	lblOutput.Text = lblOutput.Text + "</pre>"
End Sub

Sub resetOptions(Src As Object, E As EventArgs)

	If lstMathMethods.SelectedIndex > 0 Then

		Dim intCount As Int32 = TestMath.CalcParams( lstMathMethods.Items(lstMathMethods.SelectedIndex).Value)

		If intCount = 0 Then

			lblInfo.Text = "You have selected a method which accepts " & intCount & " Parameters."

		Else If intCount = 1 Then

			lblInfo.Text = "You have selected a method which accepts " & _
						intCount & " Parameter. Please Enter the value for that parameter below."

			lblParam1.Visible = true
			txtParam1.Visible = true
			lblParam2.Visible = false
			txtParam2.Visible = false

		Else

			lblInfo.Text = "You have selected a method which accepts " & _
						intCount & " Parameters. Please Enter the values for those parameters below."

			lblParam1.Visible = true
			lblParam2.Visible = true
			txtParam1.Visible = true
			txtParam2.Visible = true
		End If

		lblInfo.Visible = true
		btnRunQuery.Enabled = true

		lblOutput.Text = ""

	Else

		lblInfo.Visible = false
		lblParam1.Visible = false
		lblParam2.Visible = false
		txtParam1.Visible = false
		txtParam2.Visible = false

		txtParam1.Text = ""
		txtParam2.Text = ""
		lblOutput.Text = ""
		btnRunQuery.Enabled = false
	End If
End Sub


Public Class TestMath

	'  a copy of all the methods inside the math class...
	Public Shared mi() As MethodInfo

	'  the type of the math class, used by other routines...
	Public Shared t As Type = GetType(System.Math)

	' this method dynamically determines what the arguments are inside the identified method
	' note that in many other situations, this method WOULD NOT WORK
	' it goes on the assumption that inside the Math method, every single signature for a given
	' method name has the SAME NUMBER OF PARAMETERS. At the time of writing, this was true,
	'  and should be true for the forseeable future. However, if this assumption changes,
	'  you would also need toupdate this method
	Public Shared Function CalcParams( methodName As String) As Int32

		Dim intCOunt As Integer = 0

		Dim m As MethodInfo

		For Each m in mi

			' only deal with the selected method...
			If m.Name = methodName Then

				Dim p As ParameterInfo

				' simply determine the NUMBER of parameters for that method
				For Each p in m.GetParameters()
					intCount = intCount + 1
				Next p

				Exit For
			End If
		Next m

		return intCount
	End Function

	' this routine dynamically invokes the specified method, with the specified parameters
	Public Shared Function InvokeMethod( methodName As String, args As Object() ) As String

		Dim output As String = ""
		Dim result As Object

		Try
		  result = t.InvokeMember ( methodName, _
				BindingFlags.InvokeMethod, _
				Nothing, Nothing, args)

		  output = result.ToString()

		Catch
			output = "Please ensure you enter only a valid number of parameters for your specified method"
		End Try

		return output
	End Function

	'  this method makes sure that only unique elements are placed into the output array
	'  it achieves this bytrying to add each subsequent element from the array of memberinfos
	'  into a hashtable. A hashtable cannot have non-unique keys, and throws an error
	'  when you attempt to add aduplicate, which we use to our advantage in this routine
	Public Shared Function UniqArray () As String()

		Dim h As Hashtable = New Hashtable()

		Dim m As MemberInfo

		For Each m In mi
			Try
				h.Add(m.Name, m.Name)
			Catch
			End Try
		Next m

		Dim s(h.Count) As String

		Dim i As Integer = 0

		Dim o As Object

		For Each o In h.Values

			s(i) = o.ToString()
			i = i + 1
		Next o

		return s
	End Function
End Class
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