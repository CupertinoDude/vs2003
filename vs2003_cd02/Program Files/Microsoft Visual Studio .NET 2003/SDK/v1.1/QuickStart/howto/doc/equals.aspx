<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/basedatatypesheader.inc" -->

<h4>How Do I...Compare object references?</h4>

This topic illustrates the differences between comparing base data types using the operator == (= or 'Is' in VB) and
using the <b>Equals</b> method. The exception case, <b>Strings</b>, is also demonstrated and discussed. The
difference between reference and object equality is also covered, to help you determine where to use == (= or 'Is'), or <b>Equals</b>.
<p>
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/BaseDataTypes/equals/equals.src"
RunSample="/quickstart/howto/samples/BaseDataTypes/equals/CS/equals.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="C# Equals.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/BaseDataTypes/equals/equals.src"
RunSample="/quickstart/howto/samples/BaseDataTypes/equals/VB/equals.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB Equals.aspx"
runat="server" />
  </VbTemplate>
  <CpTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/BaseDataTypes/equals/equals.src"
RunSample="/quickstart/howto/samples/BaseDataTypes/equals/CP"
Icon = "/quickstart/images/genicon.gif"
Caption="C++ Equals.exe"
MapRunSamplePath=true
runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<p>
Comparing objects and base data types for equality is a common task. However, it is essential to know whether you are comparing the actual values of the items or the items themselves. To clarify the situation, the following code example demonstrates creating two <b>CultureInfo</b> objects, and then compares those objects using the <b>Equals</b> method and the == (= or 'Is' in VB) operator.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
using System;
using System.Globalization; // needed when using CultureInfo

class test {

    public static void Main() {

	CultureInfo cu = new CultureInfo("en-NZ");
	CultureInfo ci = new CultureInfo("en-NZ");

	Console.WriteLine( cu == ci );        //results in True, or False being printed to output?
	Console.WriteLine( cu.Equals( ci ) ); //results in True, or False being printed to output?
    }
}
</Tab>
<Tab Name="VB">
Imports System
Imports System.Globalization ' needed when using CultureInfo

Class test

    Public Shared Sub Main()

	Dim cu As CultureInfo = new CultureInfo("en-NZ")
	Dim ci As CultureInfo = new CultureInfo("en-NZ")

	Console.WriteLine( cu Is ci )        ' results in True, or False being printed to output?
	Console.WriteLine( cu.Equals( ci ) ) ' results in True, or False being printed to output?
    End Sub
End Class
</Tab>
<Tab Name="C++">
using namespace System;
using namespace System::Globalization;

__gc class test {

    public:
	void Main() {

	CultureInfo* cu = new CultureInfo("en-NZ");
	CultureInfo* ci = new CultureInfo("en-NZ");

	Console::WriteLine( cu == ci );        //results in True, or False being printed to output?
	Console::WriteLine( cu.Equals( ci ) ); //results in True, or False being printed to output?
    }
}
</Tab>
</Acme:TabControl>

<p>
You might expect both cases in the previous demonstration to return the value <b>True</b>. However, if you ran this code you would actually see the words <b>False</b> and <b>True</b>. This can take an unsuspecting programmer by surprise, but there is a valid reason for this result. Recall that when you create a new instance of an object, you actually only have a reference to that object. The object is made in the background somewhere, but in the above example when cu or ci is used, it is in reference to <b>CultureInfo</b> objects. Think of it as a 'name' for the objects. For example, you could make a car called 'MyCar'.  To change MyCar's color, you would need to do more than change the color of the word MyCar. Instead, you need to go to the actual car and repaint it.
<p>

Now imagine two people buy cars of the same kind and name them MyCar and YourCar. Even if they are the same model, color, and come with the same extras, they are not the exact same car. In the same way, two <b>Object</b> references do not necessarily refer to the same object, and the above <b>CultureInfo</b> sample is analogous to buying two different cars. They are the same kind of object, but they are not the same actual objects.
<p>

To ask the computer to see if two different object references refer to the same object, use == (= or 'Is' in VB). This is why this scenario in the above sample resulted in <b>False</b>. In contrast, when you use the <b>Equals</b> method, you are asking if the objects have the same information in them, regardless of the actual objects they refer to.
<p>

The following code example demonstrates creating an object that is actually made with the same reference of another object. This means the second object refers to the one instance of the object. To do this, assign the second object to the first object when a new instance of it is created.

<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
CultureInfo firstVal = new CultureInfo("en-NZ");      //new object
CultureInfo secondVal = new CultureInfo("en-US");     //new object
CultureInfo thirdVal = new CultureInfo("en-NZ");      //new object

//same reference as the FIRST object! fourthVal
//and firstVal both refer to the same object
CultureInfo fourthVal = firstVal;

Console.WriteLine( firstVal == secondVal );       //using == ... true/false? False
Console.WriteLine( firstVal == thirdVal );        //using == ... true/false? False
Console.WriteLine( firstVal == fourthVal );       //using == ... true/false? True

Console.WriteLine( firstVal.Equals (secondVal) ); //using Equals ... true/false? False
Console.WriteLine( firstVal.Equals (thirdVal) );  //using Equals ... true/false? True
Console.WriteLine( firstVal.Equals (fourthVal) ); //using Equals ... true/false? True

//Note that Equals and == did NOT result in the same output for all samples
</Tab>
<Tab Name="VB">
Dim firstVal CultureInfo = new CultureInfo("en-NZ")   ' new object
Dim secondVal CultureInfo = new CultureInfo("en-US")  ' new object
Dim thirdVal CultureInfo = new CultureInfo("en-NZ")   ' new object

' same reference as the FIRST object! fourthVal
' and firstVal both refer to the same object
Dim fourthVal As CultureInfo = firstVal

Console.WriteLine( firstVal Is secondVal )        ' using == ... true/false? False
Console.WriteLine( firstVal Is thirdVal )         ' using == ... true/false? False
Console.WriteLine( firstVal Is fourthVal )        ' using == ... true/false? True

Console.WriteLine( firstVal.Equals (secondVal) )  ' using Equals ... true/false? False
Console.WriteLine( firstVal.Equals (thirdVal) )   ' using Equals ... true/false? True
Console.WriteLine( firstVal.Equals (fourthVal) )  ' using Equals ... true/false? True

' Note that Equals and Is did NOT result in the same output for all samples
</Tab>
<Tab Name="C++">
CultureInfo* firstVal = new CultureInfo("en-NZ");      //new object
CultureInfo* secondVal = new CultureInfo("en-US");     //new object
CultureInfo* thirdVal = new CultureInfo("en-NZ");      //new object

//same reference as the FIRST object! fourthVal
//and firstVal both refer to the same object
CultureInfo* fourthVal = firstVal;

Console::WriteLine( firstVal == secondVal );       //using == ... true/false? False
Console::WriteLine( firstVal == thirdVal );        //using == ... true/false? False
Console::WriteLine( firstVal == fourthVal );       //using == ... true/false? True

Console::WriteLine( firstVal->Equals (secondVal) ); //using Equals ... true/false? False
Console::WriteLine( firstVal->Equals (thirdVal) );  //using Equals ... true/false? True
Console::WriteLine( firstVal->Equals (fourthVal) ); //using Equals ... true/false? True

//Note that Equals and == did NOT result in the same output for all samples
</Tab>
</Acme:TabControl>

<p>
It is important to understand that all object references work the same way, including an actual <b>Object</b> object. However, all base data types do not work in the same way. Imagine that there are two integers int1 and int2, which both have the value 1. Is it helpful to think of these as separate objects? Maybe in some scenarios, but in general, the only significant piece of information these integers have is their value. Therefore, when you ask if int1 == int 2 (int1 = int2 in VB), you actually want this to evaluate to true in this case. So for base data types, == and Equals are the same thing. The following code example demonstrates this for Booleans.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
Boolean firstVal = false;       //new base datatype instance
Boolean secondVal = true;       //new base datatype instance
Boolean thirdVal = false;       //new base datatype instance

//copies the value of the first instance to this instance
//does NOT refer to the same object
Boolean fourthVal = firstVal;




Console.WriteLine( firstVal == secondVal );       //using == ... true/false? False
Console.WriteLine( firstVal == thirdVal );        //using == ... true/false? TRUE     <==
Console.WriteLine( firstVal == fourthVal );       //using == ... true/false? True

Console.WriteLine( firstVal.Equals (secondVal) ); //using Equals ... true/false? False
Console.WriteLine( firstVal.Equals (thirdVal) );  //using Equals ... true/false? True
Console.WriteLine( firstVal.Equals (fourthVal) ); //using Equals ... true/false? True

//Note that Equals and == resulted in the same results, for each comparison
</Tab>
<Tab Name="VB">
Dim firstVal As Boolean = false ' new base datatype instance
Dim secondVal As Boolean = true ' new base datatype instance
Dim thirdVal As Boolean = false ' new base datatype instance

' copies the value of the first instance to this instance
' does NOT refer to the same object
Dim fourthVal As Boolean = firstVal

' NOTE: Do not use the Is keyword to compare value types in Visual Basic,
'       but instead use the = operator, as in this example. Only use Is when you
'       are dealing with non base-datatype object references
Console.WriteLine( firstVal = secondVal )         ' using == ... true/false? False
Console.WriteLine( firstVal = thirdVal )          ' using == ... true/false? TRUE     <==
Console.WriteLine( firstVal = fourthVal )         ' using == ... true/false? True

Console.WriteLine( firstVal.Equals (secondVal) )  ' using Equals ... true/false? False
Console.WriteLine( firstVal.Equals (thirdVal) )   ' using Equals ... true/false? True
Console.WriteLine( firstVal.Equals (fourthVal) )  ' using Equals ... true/false? True

' Note that Equals and == resulted in the same results, for each comparison
</Tab>
<Tab Name="C++">
Boolean* firstVal = false;       //new base datatype instance
Boolean* secondVal = true;       //new base datatype instance
Boolean* thirdVal = false;       //new base datatype instance

//copies the value of the first instance to this instance
//does NOT refer to the same object
Boolean* fourthVal = firstVal;




Console::WriteLine( firstVal == secondVal );       //using == ... true/false? False
Console::WriteLine( firstVal == thirdVal );        //using == ... true/false? TRUE     <==
Console::WriteLine( firstVal == fourthVal );       //using == ... true/false? True

Console::WriteLine( firstVal->Equals (secondVal) ); //using Equals ... true/false? False
Console::WriteLine( firstVal->Equals (thirdVal) );  //using Equals ... true/false? True
Console::WriteLine( firstVal->Equals (fourthVal) ); //using Equals ... true/false? True

//Note that Equals and == resulted in the same results, for each comparison
</Tab>
</Acme:TabControl>

<p>
<b>String</b> objects are inherently 'immutable'. Although they act like objects in many ways, you can think of them as base data types. For example, say you make a string, MyName, and then make a new string, YourName, which you could set = to MyName. If you then changed YourName so it was different, MyName would not change. This is demonstrated in the following example. Base data types operate in the same way.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
Car myCar = new Car("Red");       //My car, which is red!
Car yourCar = myCar;              //Your car, referring to the SAME car...
yourCar.Color = "Pink";           //Change the color of your car...
Console.WriteLine( myCar.Color ); //What color is MyCar now?

String myName = "Kayleen";        //Make my name
String yourName = myName;         //Make your name, which appears to reference the same string?
yourName = "Mary";                //Change your name...
Console.WriteLine( myName );      //what will my name be now?
</Tab>
<Tab Name="VB">
Car myCar = new Car("Red")        ' My car, which is red!
Car yourCar = myCar               ' Your car, referring to the SAME car...
yourCar.Color = "Pink"            ' Change the color of your car...
Console.WriteLine( myCar.Color )  ' what color is MyCar now?

String myName = "Kayleen"         ' Make my name
String yourName = myName          ' Make your name, which appears to reference the same string?
yourName = "Mary"                 ' Change your name...
Console.WriteLine( myName )       ' What will my name be now?
</Tab>
<Tab Name="C++">
Car* myCar = new Car("Red");       //My car, which is red!
Car* yourCar = myCar;              //Your car, referring to the SAME car...
yourCar->Color = "Pink";           //Change the color of your car...
Console::WriteLine( myCar->Color ); //What color is MyCar now?

String* myName = "Kayleen";        //Make my name
String* yourName = myName;         //Make your name, which appears to reference the same string?
yourName = "Mary";                //Change your name...
Console::WriteLine( myName );      //what will my name be now?
</Tab>
</Acme:TabControl>

<p>

<H4>Summary</H4>

Using the <b>Equals</b> method on objects and primitive data types always compares the values inside the items being
compared. If you want to compare whether an object's reference (that is, the actual object that it refers to) is
the same as another object, use the == (= or 'Is' in VB) operator. Note that Strings are the 'in-between' case,
and because of their immutable (unchangeable) nature, they are treated in the same way as base data types.

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->

