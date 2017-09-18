<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/exceptionsheader.inc" -->

<h4>How Do I...Throw an Exception?</h4>

This sample illustrates how to throw an exception.  A <b>try..catch..finally</b> block is used in to illustrate to use and catch the exception you threw. It is important to remember that when you throw an exception, you need to document the exception you throw, so that users are aware they need to include a <b>try...catch</b> block. If an exception is thrown, actions can be taken to recover, or alert the user.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/exceptions/throw/throw.src"
RunSample="/quickstart/howto/samples/exceptions/throw/CS/throw.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="C# Throw.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/exceptions/throw/throw.src"
RunSample="/quickstart/howto/samples/exceptions/throw/VB/throw.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB Throw.aspx"
runat="server" />
  </VbTemplate>
</Acme:LangSwitch>

<p>
Imagine that you are developing a class that creates and reads files. You have a <b>Create</b> method in your class, which accepts a string from the user that you use to create your file. Unfortunately, someone using your method may pass it a file name like "*\?/<". You could give your user a return code, indicating that the attempt to create a file failed, but that does not explain why it failed. A good solution is to throw an exception. This provides an opportunity to give the user detailed information about the problem.
<p>

Throwing an exception involves identifying actions which can result in unexpected or undesired behavior, preventing it from happening, and letting the person who is requesting that behavior know about it. They should always know in advance which exceptions might be thrown when using your code, so that they can catch them appropriately. In this first sample, we demonstrate a simple method, which accepts a decimal value, and determines if that value is within a specified range. If it is not, then we throw an exception to indicate that we cannot process that integer for the method in this sample.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
public static void ResetBurgerPrice(decimal d)
{
    // it should be noted that these exceptions do not utilize the runtime's resource
    // system which would make the text of the exception easily localizable.
    // For examples of using resources, see the Resources section of Quickstart.

    if (d < 2)
    {
	// let anyone using this method know that charging too little for an item is no good...
	// the type of the exception thrown is an out of range exception
	throw new ArgumentOutOfRangeException("NewPrice", "Disallowed: Charging less than $2.00 will mean we lose money!");
    }
    else if (d > 5)
    {
	// let anyone using this method know that charging too much for an item is no good either!
	// the type of the exception thrown is an out of range exception
	throw new ArgumentOutOfRangeException("NewPrice", "Disallowed: Charging more than $5.00 will scare people away!");
    }
    else
    {
	// reset the internal burger price to that specified. e.g.
	// _itemPrice = d;
	// update a database if necessary, etc.
	// ...
    }
}
</Tab>
<Tab Name="VB">
Public Shared Sub ResetBurgerPrice(d As Decimal)

    ' it should be noted that these exceptions do not utilize the runtime's resource
    ' system which would make the text of the exception easily localizable.
    ' For examples of using resources, see the Resources section of Quickstart.

    If d < 2 Then

	' let anyone using this method know that charging too little for an item is no good...
	' the type of the exception thrown is an out of range exception
	throw new ArgumentOutOfRangeException("NewPrice", "Disallowed: Charging less than $2.00 will mean we lose money!")

    ElseIf d > 5 Then

	' let anyone using this method know that charging too much for an item is no good either!
	' the type of the exception thrown is an out of range exception
	Throw New ArgumentOutOfRangeException("NewPrice", "Disallowed: Charging more than $5.00 will scare people away!")

    Else

	' reset the internal burger price to that specified. e.g.
	' _itemPrice = d
	' update a database if necessary, etc.
	' ...
    Endif
End Sub
</Tab>
</Acme:TabControl>

<p>
<div class="indent" style="width:660">
Before looking at how someone uses our method from outside, we are going to add example above. You may be in a situation where you want to make your own exceptions. This is not a difficult process. You must provide the basic constructors that will throw most exceptions, and inherit your exception from the <b>exception</b> class. The following example demonstrates an intentional exception that is designed specifically to be thrown when we try to change the price to 2.99.
</div>

<Acme:TabControl runat="server">
<Tab Name="C#">
// making your own exception...
    public class MyMadeUpException:Exception
    {
	public MyMadeUpException ()
		:base() {}

	public MyMadeUpException (string message)
		:base(message) {}

	public MyMadeUpException (string message, Exception inner)
		:base(message, inner) {}
    }
}
</Tab>
<Tab Name="VB">
' making your own exception...
public Class MyMadeUpException
    Inherits System.Exception
    Overloads Sub New ()
	MyBase.New
    End Sub

    Overloads Sub New(message As String)
	MyBase.New(message)
    End Sub

    Overloads Sub New(message As String, inner As Exception)
	MyBase.New(message, inner)
    End Sub
End Class
</Tab>
</Acme:TabControl>

<p>
<div class="indent" style="width:660">
Having created our new exception, we could add the following clause to the previous example of throwing an exception, to invoke our exception in particular.
</div>

<Acme:TabControl runat="server">
<Tab Name="C#">
if ( d < 2 )
{
	// ...
}
else if ( d > 5)
{
	// ...
}
else if ( d.Equals(2.99m) )
{
	// let anyone using this method know that we don't like 2.99!
	// the type of the exception thrown is a 'my made up' exception
	throw new MyMadeUpException("Disallowed: If you're going to make it $2.99, make it $3.00!");
}
else
{
	// ...
}
</Tab>
<Tab Name="VB">
If d < 2 Then

	' ...

Else If d > 5 Then

	' ...

Else If  d = 2.99 Then

	' let anyone using this method know that we don't like 2.99!
	' the type of the exception thrown is a 'my made up' exception
	Throw New MyMadeUpException("Disallowed: If you're going to make it $2.99, make it $3.00!")
Else

	' ...
End If
</Tab>
</Acme:TabControl>

<p>
<div class="indent" style="width:660">
From the previous section, <A HREF="/quickstart/howto/doc/catch.aspx">How Do I...Catch an Exception?</A>, we can develop the following code, which will exhibit the type of behavior that someone could expect when using our method. Note that we use a loop to try out all of our exceptions, as well as those situations where the value entered as the burger value is valid.
</div>

<Acme:TabControl runat="server">
<Tab Name="C#">
// This code shows how to catch an exception
Decimal [] d = {1.02m, 2.34m, 2.99m, 3.76m, 4.99m, 5.99m}; // the m forces the value to a decimal

// loop through the array, attempting each
for (int i=0; i < d.Length; i++ )
{

    try
    {
        Console.WriteLine();
        Console.WriteLine("{0}. Trying to call the method with an argument of '{1}'...", i + 1, d[i]);
        ResetBurgerPrice(d[i]);

	// if you get to this line, then everything worked for that value!
	Console.WriteLine("The value {0} was successfully assigned as the new burger price.", d[i]);
        Console.WriteLine();
    }
    catch (ArgumentOutOfRangeException aoe) // catch the out of range exceptions...
    {
        Console.WriteLine("The following Out Of Range Exception occurred:");
        Console.WriteLine(aoe.Message);
    }
    catch (MyMadeUpException mue) // catch the made up exception. Unnecessary to do this seperately, but a good demonstration
    {
        Console.WriteLine("The following Made Up Exception occurred:");
        Console.WriteLine(mue.Message);
    }
    finally
    {
        Console.WriteLine();
        Console.WriteLine("Move to the Next Value...");
    }
}

Console.WriteLine("Finished processing the Decimal Array.");
</Tab>
<Tab Name="VB">
' This code shows how to catch an exception
Dim d() As Decimal = {1.02, 2.34, 2.99, 3.76, 4.99, 5.99}
Dim intCount as Integer

' loop through the array, attempting each
For intCount = 0 to d.Length - 1

    Try

        Console.WriteLine()
        Console.WriteLine("{0}. Trying to call the method with an argument of '{1}'...", intCount + 1, d(intCount))
        ResetBurgerPrice(d(intCount))

	' if you get to this line, then everything worked for that value!
	Console.WriteLine("The value {0} was successfully assigned as the new burger price.", d(intCount))
        Console.WriteLine()

    Catch aoe As ArgumentOutOfRangeException ' catch the out of range exceptions...

        Console.WriteLine("The following Out Of Range Exception occurred:")
        Console.WriteLine(aoe.Message)

    Catch mue As MyMadeUpException ' catch the made up exception. Unnecessary to do this seperately, but a good demonstration

        Console.WriteLine("The following Made Up Exception occurred:")
        Console.WriteLine(mue.Message)

    Finally

        Console.WriteLine()
        Console.WriteLine("Move to the Next Value...")
    End Try

Next intCount

Console.WriteLine("Finished processing the Decimal Array.")
</Tab>
</Acme:TabControl>

<p>
<H4>Summary</H4>
<div class="indent" style="width:660">
When a method or class you are developing exhibits behavior that can cause you to end abnormally, it is a good idea to feed that error back to the person using your class by throwing the method up the calling stack.
</div>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->

