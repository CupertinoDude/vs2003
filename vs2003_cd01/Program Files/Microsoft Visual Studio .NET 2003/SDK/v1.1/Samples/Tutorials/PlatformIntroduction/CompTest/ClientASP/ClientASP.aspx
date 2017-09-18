<%@ Page Language="C#" Description="ASP.NET Component Test" %>
<%@ Import Namespace="CompCS"%>
<%@ Import Namespace="CompVC"%>
<%@ Import Namespace="CompVB"%>

<html>
<script language="C#" runat=server>
void Page_Load(Object sender, EventArgs EvArgs) {
	String Out = "";
	Int32 Count = 0;

	// Iterate over component's strings and concatenate 
	Out = Out + "Strings from C# StringComponent<br>";
	CompCS.StringComponent myCSStringComp = new CompCS.StringComponent();
	for (int index = 0; index < myCSStringComp.Count; index++) {
	   Out = Out + myCSStringComp.GetString(index) + "<br>";
	}
	Out = Out + "<br>";

	// Iterate over component's strings and concatenate 
	Out = Out + "Strings from Visual C++ StringComponent<br>";
	CompVC.StringComponent myVCStringComp = new CompVC.StringComponent();
	for (int index = 0; index < myVCStringComp.Count; index++) {
	   Out = Out + myVCStringComp.GetString(index) + "<br>";
	}
	Out = Out + "<br>";

	// Iterate over component's strings and concatenate 
	Out = Out + "Strings from Visual Basic StringComponent<br>";
	CompVB.StringComponent myVBStringComp = new CompVB.StringComponent();
	for (int index = 0; index < myVBStringComp.Count; index++) {
	   Out = Out + myVBStringComp.GetString(index) + "<br>";
	}

	Message.InnerHtml = Out;
}
</script>
<body>
   <span id="Message" runat=server/>
</body>
</html>