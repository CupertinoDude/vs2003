<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/BaseDatatypesHeader.inc" -->

<h4>How Do I...Use mathematical functions?</h4>

This example demonstrates using the methods and constants built into the <b>Math</b> class. The methods in the <b>Math</b> class provide you with most of the standard functions you will want to use in daily computations, and are all provided as non-instantiated methods, perfect for quickly being able to perform the function you require. See the .NET Framework SDK for a full listing of all the functions you can access using the <b>Math</b> class. At the end of this page is an example allowing you to invoke all the methods on the <b>Math</b> class, which uses the <b>Reflection</b> namespace to call the methods dynamically.

<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/basedatatypes/Math/Math.src"
RunSample="/quickstart/howto/samples/basedatatypes/Math/CS/Math.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="C# Math.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/basedatatypes/Math/Math.src"
RunSample="/quickstart/howto/samples/basedatatypes/Math/VB/Math.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB Math.aspx"
runat="server" />
  </VbTemplate>
  <CpTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/basedatatypes/Math/Math.src"
RunSample="/quickstart/howto/samples/basedatatypes/Math/CP"
Icon = "/quickstart/images/genicon.gif"
Caption="C++ Math.exe"
MapRunSamplePath=True
runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<p>
The <b>Math</b> class contains a number of standard functions for assisting you with mathematical operations. Because you don't want to actually have a 'Math' object lying around in memory, all the tools you are going to use through <b>Math</b> are provided as non-instantiated functionality. All the methods are intuitive and easy to use.
<p>

The following example demonstrates using the <b>Max</b> and <b>Min</b> functions. These functions allow you to determine which is the larger or smaller of two numbers, and returns the identified number back out of the called function.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
int i = -10;

double d1 = 39.25;
double d2 = -27.84;

Console.WriteLine( Math.Max(i, d1) );  //returns 39.25
Console.WriteLine( Math.Max(d2, i) );  //returns -10
Console.WriteLine( Math.Max(d1, d2) ); //returns 39.25

Console.WriteLine( Math.Min(i, d1) );  //returns -10
Console.WriteLine( Math.Min(d2, i) );  //returns -27.84
Console.WriteLine( Math.Min(d1, d2) ); //returns -27.84
</Tab>
<Tab Name="VB">
Dim i As Integer = -10

Dim d1 As double = 39.25
Dim d2 As double = -27.84

Console.WriteLine( Math.Max(i, d1) )   ' returns 39.25
Console.WriteLine( Math.Max(d2, i) )   ' returns -10
Console.WriteLine( Math.Max(d1, d2) )  ' returns 39.25

Console.WriteLine( Math.Min(i, d1) )   ' returns -10
Console.WriteLine( Math.Min(d2, i) )   ' returns -27.84
Console.WriteLine( Math.Min(d1, d2) )  ' returns -27.84
</Tab>
<Tab Name="C++">
int i = -10;

double d1 = 39.25;
double d2 = -27.84;

Console::WriteLine("Using the Max Method");
Console::WriteLine("-----------------------------------");
Console::WriteLine("The maximum value of {0} and {1} is {2}", i.ToString(), d1.ToString(),  Math::Max((double)i, d1).ToString());
Console::WriteLine("The maximum value of {0} and {1} is {2}", d2.ToString(), i.ToString(), Math::Max(d2, (double)i).ToString());
Console::WriteLine("The maximum value of {0} and {1} is {2}", d1.ToString(), d2.ToString(), Math::Max(d1, d2).ToString());
Console::WriteLine();

Console::WriteLine("Using the Min Method");
Console::WriteLine("-----------------------------------");
Console::WriteLine("The minimum value of {0} and {1} is {2}", i.ToString(), d1.ToString(),  Math::Min((double)i, d1).ToString());
Console::WriteLine("The minimum value of {0} and {1} is {2}", d2.ToString(), i.ToString(), Math::Min(d2, (double)i).ToString());
Console::WriteLine("The minimum value of {0} and {1} is {2}", d1.ToString(), d2.ToString(), Math::Min(d1, d2).ToString());
Console::WriteLine();
</Tab>
</Acme:TabControl>

<p>
You may think the previous example goes a little overboard, since a demonstration of just two numbers would give you the idea. The purpose is to point out that the data types, and the order of those data types, is different in each example. In the first call to the <b>Max</b> function, an integer and a double are passed, in that order, and then you call the same function, with a double, and then an integer. The <b>Math</b> class provides many overloaded methods, so you can pass many different data types in different orders, and still get the functionality you require, as demonstrated above.
<p>

The <b>Ceiling</b> method rounds a number up to the first whole number larger than the number you pass, and the <b>Floor</b> method rounds a number down to the first whole number smaller. The <b>Abs</b> method returns the absolute value of the number you pass (defined as the non-negative distance from zero), and the <b>Sqrt</b> method returns the square root of a number. Note that rather than throwing an exception, if you pass the <b>Sqrt</b> method a negative number then the result is 'NaN', signifying that the result is 'Not a Number'.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
// refer to the previous sample for the variable declarations being used...

// NB: Floor and Ceiling are fairly meaningless with integer values,
// since by definition, they are already whole numbers!
Console.WriteLine( Math.Floor(i) );     //returns -10
Console.WriteLine( Math.Floor(d1) );    //returns 39
Console.WriteLine( Math.Floor(d2) );    //returns -28

Console.WriteLine( Math.Ceiling(i) );   //returns -10
Console.WriteLine( Math.Ceiling(d1)) ); //returns 40
Console.WriteLine( Math.Ceiling(d2)) ); //returns -27

Console.WriteLine( Math.Abs(i) );       //returns 10
Console.WriteLine( Math.Abs(d1) );      //returns 39.25
Console.WriteLine( Math.Abs(d2) );      //returns 27.84

Console.WriteLine( Math.Sqrt(d1) );     //returns 6.26
Console.WriteLine( Math.Sqrt(i) );      //returns NaN
</Tab>
<Tab Name="VB">
'  refer to the previous sample for the variable declarations being used...

'  NB: Floor and Ceiling are fairly meaningless with integer values,
'  since by definition, they are already whole numbers!
Console.WriteLine( Math.Floor(i) )      ' returns -10
Console.WriteLine( Math.Floor(d1) )     ' returns 39
Console.WriteLine( Math.Floor(d2) )     ' returns -28

Console.WriteLine( Math.Ceiling(i) )    ' returns -10
Console.WriteLine( Math.Ceiling(d1)) )  ' returns 40
Console.WriteLine( Math.Ceiling(d2)) )  ' returns -27

Console.WriteLine( Math.Abs(i) )        ' returns 10
Console.WriteLine( Math.Abs(d1) )       ' returns 39.25
Console.WriteLine( Math.Abs(d2) )       ' returns 27.84

Console.WriteLine( Math.Sqrt(d1) )      ' returns 6.26
Console.WriteLine( Math.Sqrt(i) )       ' returns NaN
</Tab>
<Tab Name="C++">
// refer to the previous sample for the variable declarations being used...

// NB: Floor and Ceiling are fairly meaningless with integer values,
Console::WriteLine("Using the Abs Method");
Console::WriteLine("-----------------------------------");
Console::WriteLine("The absolute value of {0} is {1}", i.ToString(), Math::Abs(i).ToString());
Console::WriteLine("The absolute value of {0} is {1}", d1.ToString(), Math::Abs(d1).ToString());
Console::WriteLine("The absolute value of {0} is {1}", d2.ToString(), Math::Abs(d2).ToString());
Console::WriteLine();

Console::WriteLine("Using the Floor Method");
Console::WriteLine("-----------------------------------");
Console::WriteLine("Using the Floor method to round down {0} you get {1}", i.ToString(), Math::Floor(i).ToString());
Console::WriteLine("Using the Floor method to round down {0} you get {1}", d1.ToString(), Math::Floor(d1).ToString());
Console::WriteLine("Using the Floor method to round down {0} you get {1}", d2.ToString(), Math::Floor(d2).ToString());
Console::WriteLine();

Console::WriteLine("Using the Ceiling Method");
Console::WriteLine("-----------------------------------");
Console::WriteLine("Using the Ceiling method to round down {0} you get {1}", i.ToString(),  Math::Ceiling(i).ToString());  
Console::WriteLine("Using the Ceiling method to round down {0} you get {1}", d1.ToString(), Math::Ceiling(d1).ToString()); 
Console::WriteLine("Using the Ceiling method to round down {0} you get {1}", d2.ToString(), Math::Ceiling(d2).ToString()); 
Console::WriteLine();

Console::WriteLine("Using the Sqrt Method");
Console::WriteLine("-----------------------------------");
Console::WriteLine("The square root of {0} is {1}", d1.ToString(), Math::Sqrt(d1).ToString());
Console::WriteLine("The square root of {0} is {1}", i.ToString(), Math::Sqrt(i).ToString());
Console::WriteLine();
</Tab>
</Acme:TabControl>

<p>
Using the <b>Math</b> class is fairly straightforward. You can perform many other functions using other methods, including sin, cos, and tan functions, and logarithmic functions. There are two constant values defined in the <b>Math</b> class: PI and E. PI is the constant ratio between a circle and its diameter, and is provided for quick and fairly accurate computations where it is required. E is the natural exponent (generally written as a lowercase e) also used in many mathematical operations. The following code example demonstrates how to invoke each constant.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
Console.WriteLine(" e equals {0}", Math.E );
Console.WriteLine(" PI equals {0}", Math.PI );
</Tab>
<Tab Name="VB">
Console.WriteLine(" e equals {0}", Math.E )
Console.WriteLine(" PI equals {0}", Math.PI )
</Tab>
<Tab Name="C++">
Console::WriteLine(" e equals {0}", Math::E );
Console::WriteLine(" PI equals {0}", Math::PI );
</Tab>
</Acme:TabControl>
<p>

This final example allows you to invoke all the static methods on the <b>Math</b> class. It uses members in the <b>Reflection</b> namespace to determine the methods available dynamically, and builds a list of all the methods you can select to invoke. For details on the code in this sample, see the How Do I samples listed under the Reflection topic.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/basedatatypes/Math/MathRefl.src"
RunSample="/quickstart/howto/samples/basedatatypes/Math/CS/MathRefl.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="C# MathRefl.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/basedatatypes/Math/MathRefl.src"
RunSample="/quickstart/howto/samples/basedatatypes/Math/VB/MathRefl.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB MathRefl.aspx"
runat="server" />
  </VbTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->

