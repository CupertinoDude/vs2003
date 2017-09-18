<%@ Import namespace="System" %>
<%@ Import namespace="System.Reflection" %>

<script language="VB" runat="server">

Sub btnRunQuery_Click(Src As Object, E As EventArgs)
	' first, clear out the old label
	lblResults.Text = ""

	Dim t As Type

	' this if adds the System namespace on, meaning it is not required
	' for the user to type it.
	If txtDatatype.Visible Then
		t = Type.GetType("System." & txtDatatype.Text)
	Else
		t = Type.GetType("System." & lstDatatype.Items(lstDatatype.SelectedIndex).Value)
	End If


	' check to see if we have a valid value...
	If t Is Nothing Then

		' Don't assume that it is a SYSTEM datatype...
		If txtDatatype.Visible Then
			t = Type.GetType(txtDatatype.Text)
		End If
	End If

	' if it is still not found, error out...
	If t Is Nothing Then

		lblResults.Text = "Please ensure you specify only valid types in the type field.<BR>"
		lblResults.Text = lblResults.Text & "REMEMBER: The Case matters (Byte is not the same as byte)."
		lblResults.ForeColor = System.Drawing.Color.FromName("Red")
		lblResults.Visible = true
		Exit Sub

	End If

	' first, let the user know what type they selected!
	lblResults.Text = "<B>The datatype you selected to search on is <U>"

	If txtDatatype.Visible Then
		lblResults.Text = lblResults.Text & txtDatatype.Text
	Else
		lblResults.Text = lblResults.Text & lstDatatype.Items(lstDatatype.SelectedIndex).Value
	End If

	lblResults.Text = lblResults.Text & "</U>.</B><P>"


	lblResults.ForeColor = System.Drawing.Color.FromName("Black")

	' declare the arrays to hold the information...
	Dim mi() As MethodInfo
	Dim ei() As EventInfo
	Dim pi() As PropertyInfo
	Dim ci() As ConstructorInfo
	Dim fi() As FieldInfo

	Dim allChecked as boolean = chkFields.Checked Or chkProperties.Checked Or chkEvents.Checked Or chkMethods.Checked Or chkConstructors.Checked

	If chkStatic.Checked Then

		' Static Fields
		If chkFields.Checked Or Not allChecked Then

			fi = t.GetFields (BindingFlags.Static Or BindingFlags.NonPublic Or BindingFlags.Public)
			AddHeader("Static Fields")
			PrintMembers (fi)
		End If

		' Static Properites
		If chkProperties.Checked Or Not allChecked Then
			pi = t.GetProperties (BindingFlags.Static Or BindingFlags.NonPublic Or BindingFlags.Public)
			AddHeader("Static Properties")
			PrintMembers (pi)
		End If

		' Static Events
		If chkEvents.Checked Or Not allChecked Then
			ei = t.GetEvents (BindingFlags.Static Or BindingFlags.NonPublic Or BindingFlags.Public)
			AddHeader("Static Events")
			PrintMembers (ei)
		End If

		' Static Methods
		If chkMethods.Checked Or Not allChecked Then
			mi = t.GetMethods (BindingFlags.Static Or BindingFlags.NonPublic Or BindingFlags.Public)
			AddHeader("Static Methods")
			PrintMembers (mi)
		End If

		' Constructors
		If chkConstructors.Checked Or Not allChecked Then
			ci = t.GetConstructors (BindingFlags.Static Or BindingFlags.NonPublic Or BindingFlags.Public)
			AddHeader("Static Constructors")
			PrintMembers (ci)
		End If
	End If

	If chkInstance.Checked Then

		' Instance Fields
		If chkFields.Checked Or Not allChecked Then
			fi = t.GetFields (BindingFlags.Instance Or BindingFlags.NonPublic Or BindingFlags.Public)
			AddHeader("Instance Fields")
			PrintMembers (fi)
		End If

		' Instance Properites
		If chkProperties.Checked Or Not allChecked Then
			pi = t.GetProperties (BindingFlags.Instance Or BindingFlags.NonPublic Or BindingFlags.Public)
			AddHeader("Instance Properties")
			PrintMembers (pi)
		End If


		' Instance Events
		If chkEvents.Checked Or Not allChecked Then
			ei = t.GetEvents (BindingFlags.Instance Or BindingFlags.NonPublic Or BindingFlags.Public)
			AddHeader("Instance Events")
			PrintMembers (ei)
		End If

		' Instance Methods
		If chkMethods.Checked Or Not allChecked Then
			mi = t.GetMethods (BindingFlags.Instance Or BindingFlags.NonPublic Or BindingFlags.Public)
			AddHeader("Instance Methods")
			PrintMembers (mi)
		End If
	End If


	lblResults.Visible = true
End Sub

Sub AddHeader( HeaderToAdd As String)

	lblResults.Text = lblResults.Text & "<p><B>----- " & HeaderToAdd & " -----</B>"

End Sub

Sub PrintMembers ( ms() As MemberInfo )

	Dim m As MemberInfo

	For Each m in ms
		lblResults.Text = lblResults.Text & "<BR> - " & m.ToString()
	Next m
End Sub


Sub resetDisplay(Src As Object, E As EventArgs)

	lblResults.Visible = false

	If Not (chkInstance.Checked Or chkStatic.Checked) Then
		lblResults.Text = "You must select a style of the member information (Instance/Static)"
		lblResults.ForeColor = System.Drawing.Color.FromName("Red")
		lblResults.Visible = true
		btnRunQuery.Enabled = false
		Exit Sub
	End If

	' check the value of this dropdown list. If it is the first entry, DISABLE the button!
	If lstDatatype.SelectedIndex <= 0 Then

		btnRunQuery.Enabled = false
		txtDatatype.Visible = false
		Exit Sub

	Else If lstDatatype.SelectedIndex >= (lstDatatype.Items.Count - 1) Then
		txtDatatype.Visible = true
		btnRunQuery.Enabled = true

	Else
		txtDatatype.Visible = false
		btnRunQuery.Enabled = true
	End If

	' ensure also that at least instance, OR static is checked!
	If chkInstance.Checked Or chkStatic.Checked Then
		btnRunQuery.Enabled = true
	Else
		btnRunQuery.Enabled = false
	End If
End Sub

</script>

<html>
<head>
          <link rel="stylesheet" href="intro.css">
</head>

<body style="background-color:f6e4c6">

<form method=post runat=server>
<div class="indent" style="width:660">
<b>This is a short demonstration which illustrates how to find specific member information for a given type.</b> It uses classes and methods from the Reflection namespace to look at the actual code you develop with.
<p>
We have selected a few common types for you to start your searching with as a suggestion, but you can enter a type of your own, or a different System type if you wish. Remember that if you do enter a type rather than selecting one from the list, you should give the full namespace and class name for your type (the only exception is types inside the System namespace). When looking through the information returned, you are presented with the datatype returned (if applicable), and in the case of methods, you also get the signature for that method. Where the member is implemented or inherited from another object, you will also see the full namespace for that member, in its original location.
<br>

Happy Searching!
</div>
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