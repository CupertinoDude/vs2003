<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/exceptionsheader.inc" -->

<h4>How Do I...Catch an Exception?</h4>

This sample illustrates how to catch an exception.  A <b>try...catch...finally</b>
block is used in this sample.  Any code that might throw an exception is
placed inside of the <b>try</b> block.  If an exception is thrown, the <b>catch</b>
block is entered and the program can perform the appropriate operation to recover or
alert the user.  The code in the <b>finally</b> block is always executed and can perform cleanup after an exception has occurred.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/exceptions/catch/catch.src"
RunSample="/quickstart/howto/samples/exceptions/catch/CS/catch.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="Catch.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/exceptions/catch/catch.src"
RunSample="/quickstart/howto/samples/exceptions/catch/VB/catch.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="Catch.aspx"
runat="server" />
  </VbTemplate>
</Acme:LangSwitch>

<p>
Catching and dealing with exceptions is a standard part of any object-oriented program.
A <b>try...catch</b> block consists of a statement that you are going to try to do something that
you know might cause an exception to occur. If an exception occurs, control is immediately passed to
your <b>catch</b> block, which can deal with the exception. If an exception does not occur, then your code will execute normally. As an option, you can add a <b>finally</b> block after your <b>catch</b> block, which contain code segments which will execute, whether any exceptions
are raised or not.
<p>

The following code fragment demonstrates a <b>try...catch...finally</b> statement. The key points to note
are the structure and the flow of control, depending on when an error may occur.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
//This code shows how to catch an exception
try {
	Console.WriteLine("We're going to divide 10 by 0 and see what happens...");
	Console.WriteLine();

	int i = 10;
	int j = 0;
	int k = i/j;             //error on this line. Control will jump to the catch block...
}
catch (Exception e) { //perform code which deals with the exception, or informs the user what occurred...
	Console.WriteLine("The following error occurred:");
	Console.WriteLine(e.ToString()); //print the error message to the user...
}
finally { //this section will be performed, regardless of the above processing
	Console.WriteLine();
	Console.WriteLine("This statement is always printed");
}
</Tab>
<Tab Name="VB">
' This code shows how to catch an exception
Try
	Console.WriteLine("We're going to divide 10 by 0 and see what happens...")
	Console.WriteLine()

	Dim i as Integer = 10
	Dim j as Integer = 0
	Dim k As Integer k = i/j ' error on this line. Control will jump to the catch block...

Catch e As Exception  ' perform code which deals with the exception, or informs the user what occurred...
	Console.WriteLine("The following error occurred:")
	Console.WriteLine(e.ToString())  ' print the error message to the user...

Finally   ' this section will be performed, regardless of the above processing
	Console.WriteLine()
	Console.WriteLine("This statement is always printed")
End Try
</Tab>
</Acme:TabControl>

<p>
You can use the <b>exception</b> object in a number of ways. An exception has a number of properties that can help
you identify help, source, or even stack information about an exception. This can be very useful for
tracking down the original cause of the exception, or providing a better explanation of its source. If you
do not think you are going to actually use the exception for any information, do not actually catch an
object, even though you may still have a catch block. The following sample demonstrates the properties
of an <b>exception</b> object and declares a <b>catch</b> block without an <b>exception</b> object.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
//using properties of an exception object
try {
	// ... Actions which may cause an exception go here
}
catch (Exception e) {
	Console.WriteLine( e.Source );     //the name of the application or object that caused the error
	Console.WriteLine( e.Message );    //an alternate to using the ToString method, as above
	Console.WriteLine( e.StackTrace ); //a string containing the stack trace for this exception
	Console.WriteLine( e.HelpLink );   //a reference to a file which contains help information
}

//the following segment defines a try...catch block. Note that
//we do not actually define a usable Exception object, although we must include the Exception
//keyword
try {
    //... Actions
}
catch ( Exception ) { //no 'e' required, if you're not going to use the exception object
    //... Actions
}
</Tab>
<Tab Name="VB">
' using properties of an exception object
Try
	'  ... Actions which may cause an exception go here

Catch e As Exception
	Console.WriteLine( e.Source )      ' the name of the application or object that caused the error
	Console.WriteLine( e.Message )     ' an alternate to using the ToString method, as above
	Console.WriteLine( e.StackTrace )  ' a string containing the stack trace for this exception
	Console.WriteLine( e.HelpLink )    ' a reference to a file which contains help information
End Try

' the following segment defines a try...catch block. Note that
' we do not actually define a usable Exception object

Try
    ' ... Actions

Catch                 ' no 'e As Exception' required, if you're not going to use the exception object
    ' ... Actions
End Try
</Tab>
</Acme:TabControl>

<p>
Why are these blocks important? Try making the above application without the <b>try...catch</b>
statements. Clearly, this demonstration will always raise an exception. However, imagine you have a
situation where an exception might occur. If you forget to include a <b>try...catch</b> block, then your application can crash on your users.

<p>
You can take the above examples one step further. We have dealt with the particular case of a non-specific
exception. However, you might know in advance what kind of exception is going to occur. When you do, you can catch
the anticipated exception, and do process it accordingly. You can then catch all other exceptions, and deal with
them as well. The next sample demonstrates this.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
//we are going to attempt to do some file processing. This can cause a number of potential exceptions
//Note that you can use the specific exceptions to get extra information about that exception,
//but this example is focused on showing control execution for those exceptions
try {
	File.Create("c:/temp/test.txt"); //can fail for a number of reasons...
}
catch ( IOException ) {  //this error may occur if the temp directory does not exist...
	Console.WriteLine("An IO error occurred. It may be that the c:\temp folder does not exist");
}
catch ( SecurityException ) { //you don't have the rights to make this action...
	Console.WriteLine("You don't have the security permissions to take this action!");
}
catch ( Exception e ) { //catch all other exceptions...
	Console.WriteLine( e.ToString() ); //simply print the standard exception information
}
</Tab>
<Tab Name="VB">
' we are going to attempt to do some file processing. This can cause a number of potential exceptions
' Note that you can use the specific exceptions to get extra information about that exception,
' but this example is focused on showing control execution for those exceptions
Try
	File.Create("c:/temp/test.txt")  ' can fail for a number of reasons...

Catch ioe As IOException ' this error may occur if the temp directory does not exist...
	Console.WriteLine("An IO error occurred. It may be that the c:\temp folder does not exist")

Catch se As SecurityException ' you don't have the rights to make this action...
	Console.WriteLine("You don't have the security permissions to take this action!")

Catch e As Exception    ' catch all other exceptions...
	Console.WriteLine( e.ToString() )  ' simply print the standard exception information
End Try
</Tab>
</Acme:TabControl>

<p>
<H4>Summary</H4>
Catching exceptions is an essential part of object-oriented programming. Using <b>try...catch</b> statements is a simple way to make sure that your users are not confronted with unexpected crashes. You can get helpful
information from the <b>exception</b> object about the source and nature of the exception if needed, or even catch specific
exceptions if you want to customize the kind of information you want to give the user for a given exception.
<p>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->