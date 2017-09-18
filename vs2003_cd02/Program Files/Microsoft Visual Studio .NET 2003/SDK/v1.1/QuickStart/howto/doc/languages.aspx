<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/languages.inc" -->

<h4>Language Support</h4>

The Microsoft .NET Platform currently offers built-in support 
for three languages: C#, Visual Basic, and JScript.

<p>The exercises and code samples in this tutorial demonstrate how 
to use C#, Visual Basic, and
JScript to build .NET applications.  For information regarding the syntax of the
other languages, refer to the complete documentation for the .NET Framework SDK.

<p>The following table is provided to help you understand the 
code samples in this tutorial as well as the differences
between the three languages:

<style>
div.subhead {
  padding:0,10,0,10;
  border-style:solid;
  border-width:1;
  border-bottom:1;
  border-top:1;
  border-right:1;
  border-color:cccccc;
  background-color: ffffee;
  font-weight: bold;
  color: black;
  text-align: center;
}
</style>

<p>
<span class="subhead"><a name="VariableDeclaration">Variable Declarations</span>
<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
int x;
String s;
String s1, s2;
Object o;
Object obj = new Object();
public String name;
</Tab>

<Tab Name="VB">
Dim x As Integer
Dim s As String
Dim s1, s2 As String
Dim o 'Implicitly Object
Dim obj As New Object()
Public name As String
</Tab>

<Tab Name="JScript">
var x : int;
var s : String;
var s1 : String, s2 : String;
var o;
var obj : Object = new Object();
var name : String;
</Tab>
</Acme:TabControl>

<p>
<span class="subhead"><a name="Statements">Statements</span>
<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
Response.Write("foo");
</Tab>

<Tab Name="VB">
Response.Write("foo")
</Tab>

<Tab Name="JScript">
Response.Write("foo");
</Tab>
</Acme:TabControl>


<p>
<span class="subhead"><a name="Comments">Comments</span>
<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
// This is a comment

/*
This
is
a
multiline
comment
*/
</Tab>

<Tab Name="VB">
' This is a comment

' This
' is
' a
' multiline
' comment


</Tab>

<Tab Name="JScript">
// This is a comment

/*
This
is
a
multiline
comment
*/
</Tab>
</Acme:TabControl>


<p>
<span class="subhead"><a name="UseIndexedProperty">Accessing Indexed Properties</span>
<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
String s = Request.QueryString["Name"];
String value = Request.Cookies["key"];




</Tab>

<Tab Name="VB">
Dim s, value As String
s = Request.QueryString("Name")
value = Request.Cookies("Key").Value

'Note that default non-indexed properties
'must be explicitly named in VB
</Tab>

<Tab Name="JScript">
var s : String = Request.QueryString("Name");
var value : String = Request.Cookies("key");




</Tab>
</Acme:TabControl>

<p>
<span class="subhead"><a name="DeclareIndexedProperty">Declaring Indexed Properties</span>
<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
// Default Indexed Property
public String this[String name] {
    get {
        return (String) lookuptable[name];                                 
    }
}









</Tab>

<Tab Name="VB">
' Default Indexed Property
Public Default ReadOnly Property DefaultProperty(Name As String) As String
    Get
        Return CStr(lookuptable(Name))
    End Get
End Property









</Tab>

<Tab Name="JScript">
//JScript does not support the creation of indexed 
//or default indexed properties.  However, specifying the                    
//expando attribute on a class automatically provides 
//a default indexed property whose type is Object and 
//whose index type is String.

//To emulate these properties in JScript, use function
//declarations instead.

public function Item(name:String) : String {
    return String(lookuptable(name));
}
</Tab>
</Acme:TabControl>

<p>
<span class="subhead"><a name="SimpleProperty">Declaring Simple Properties</span>
<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
public String name {

  get {
    ...
    return ...;
  }

  set {
    ... = value;
  }

}
</Tab>

<Tab Name="VB">
Public Property Name As String

  Get
    ...
    Return ...
  End Get

  Set
    ... = Value
  End Set

End Property
</Tab>

<Tab Name="JScript">
function get name() : String {
    ...
    return ...;
}

function set name(value : String) {
    ... = value;
}




</Tab>
</Acme:TabControl>


<p>
<span class="subhead"><a name="Enumeration">Declare and Use an Enumeration</span>
<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
// Declare the Enumeration
public enum MessageSize {

    Small = 0,
    Medium = 1,
    Large = 2
}

// Create a Field or Property
public MessageSize msgsize;

// Assign to the property using the Enumeration values
msgsize = Small;
</Tab>

<Tab Name="VB">
' Declare the Enumeration
Public Enum MessageSize

    Small = 0
    Medium = 1
    Large = 2
End Enum

' Create a Field or Property
Public MsgSize As MessageSize

' Assign to the property using the Enumeration values
MsgSize = small
</Tab>

<Tab Name="JScript">
// Declare the Enumeration
enum MessageSize {
	
    Small = 0,
    Medium = 1,
    Large = 2
}
	
// Create a Field or Property
var msgsize:MessageSize
	
// Assign to the property using the Enumeration values
msgsize = MessageSize.Small
</Tab>
</Acme:TabControl>



<p>
<span class="subhead"><a name="EnumerateCollection">Enumerating a Collection</span>
<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
foreach ( String s in coll ) {
 ...
}

</Tab>

<Tab Name="VB">
Dim S As String
For Each S In Coll
 ...
Next
</Tab>

<Tab Name="JScript">
for (var s : String in coll) {
 ...
}

</Tab>
</Acme:TabControl>


<p>
<span class="subhead"><a name="Methods">Declare and Use Methods</span>
<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
// Declare a void return function
void voidfunction() {
 ...
}

// Declare a function that returns a value
String stringfunction() {
 ...
    return (String) val;
}

// Declare a function that takes and returns values
String parmfunction(String a, String b) {
 ...
    return (String) (a + b);
}

// Use the Functions
voidfunction();
String s1 = stringfunction();
String s2 = parmfunction("Hello", "World!");
</Tab>

<Tab Name="VB">
' Declare a void return function
Sub VoidFunction()
 ...
End Sub

' Declare a function that returns a value
Function StringFunction() As String
 ...
    Return CStr(val)
End Function

' Declare a function that takes and returns values
Function ParmFunction(a As String, b As String) As String
 ...
    Return CStr(A & B)
End Function

' Use the Functions
VoidFunction()
Dim s1 As String = StringFunction()
Dim s2 As String = ParmFunction("Hello", "World!")
</Tab>

<Tab Name="JScript">
// Declare a void return function
function voidfunction() : void {
 ...
}

// Declare a function that returns a value
function stringfunction() : String {
 ...
    return String(val);
}

// Declare a function that takes and returns values
function parmfunction(a:String, b:String) : String {
 ...
    return String(a + b);
}

// Use the Functions
voidfunction();
var s1:String = stringfunction();
var s2:String = parmfunction("Hello", "World!");
</Tab>
</Acme:TabControl>

<p>
<span class="subhead"><a name="CustomAttr">Custom Attributes</span>
<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
// Stand-alone attribute
[STAThread]

// Attribute with parameters
[Obsolete("Obsolete message here")]

// Attribute with named parameters
[Obsolete("Obsolete message here", true)]
</Tab>

<Tab Name="VB">
' Stand-alone attribute
&lt;STAThread&gt;

' Attribute with parameters
&lt;Obsolete("Obsolete message here")&gt;

' Attribute with named parameters
&lt;Obsolete("Obsolete message here", true)&gt;
</Tab>

<Tab Name="JScript">
// Stand-alone attribute
STAThreadAttribute

// Attribute with parameters
Obsolete("Obsolete message here")

// Attribute with named parameters
Obsolete("Obsolete message here", true)
</Tab>
</Acme:TabControl>

<p>
<span class="subhead"><a name="Arrays">Arrays</span>
<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
    String[] a = new String[3];
    a[0] = "1";
    a[1] = "2";
    a[2] = "3";

    String[][] a2 = new String[3][3];
    a[0][0] = "1";
    a[1][0] = "2";
    a[2][0] = "3";



</Tab>

<Tab Name="VB">
    Dim a(2) As String
    a(0) = "1"
    a(1) = "2"
    a(2) = "3"

    Dim a2(2,2) As String
    a(0,0) = "1"
    a(1,0) = "2"
    a(2,0) = "3"



</Tab>

<Tab Name="JScript">
    var a : String[] = new String[3];
    a[0] = "1";
    a[1] = "2";
    a[2] = "3";

    var a2 : String[][] = new (String[])[3];
    a2[0] = new String[3];
    a2[1] = new String[3];
    a2[2] = new String[3];
    a2[0][0] = "1";
    a2[1][0] = "2";
    a2[2][0] = "3";
</Tab>
</Acme:TabControl>


<p>
<span class="subhead"><a name="Initialization">Initialization</span>
<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
String s = "Hello World";
int i = 1;
double[] a =  { 3.00, 4.00, 5.00 };
</Tab>

<Tab Name="VB">
Dim s As String = "Hello World"
Dim i As Integer = 1
Dim a() As Double = { 3.00, 4.00, 5.00 }
</Tab>

<Tab Name="JScript">
var s : String = "Hello World";
var i : int = 1;
var a : double[] = [ 3.00, 4.00, 5.00 ];
</Tab>
</Acme:TabControl>


<p>
<span class="subhead"><a name="IFState">If Statements</span>
<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
if (Request.QueryString != null) {
  ...
}
</Tab>

<Tab Name="VB">
If Not (Request.QueryString = Nothing)
  ...
End If
</Tab>

<Tab Name="JScript">
if (Request.QueryString != null) {
  ...
}
</Tab>
</Acme:TabControl>


<p>
<span class="subhead"><a name="CaseState">Case Statements</span>
<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
switch (FirstName) {
  case "John" :
    ...
    break;
  case "Paul" :
    ...
    break;
  case "Ringo" :
    ...
    break;
  default:
    ...
    break;
}
</Tab>

<Tab Name="VB">
Select Case FirstName
  Case "John"
    ...
  Case "Paul"
    ...
  Case "Ringo"
    ...
  Case Else
    ...
End Select




</Tab>

<Tab Name="JScript">
switch (FirstName) {
  case "John" :
    ...
    break;
  case "Paul" :
    ...
    break;
  case "Ringo" :
    ...
    break;
  default:
    ...
    break;
}
</Tab>
</Acme:TabControl>

<p>
<span class="subhead"><a name="ForLoop">For Loops</span>
<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
for (int i=0; i<3; i++)
  a(i) = "test";


</Tab>

<Tab Name="VB">
  Dim I As Integer
  For I = 0 To 2
    a(I) = "test"
  Next
</Tab>

<Tab Name="JScript">
for (var i : int = 0; i < 3; i++)
  a[i] = "test";


</Tab>
</Acme:TabControl>


<p>
<span class="subhead"><a name="WhileLoop">While Loops</span>
<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
int i = 0;
while (i<3) {
  Console.WriteLine(i.ToString());
  i += 1;
}

</Tab>

<Tab Name="VB">
Dim I As Integer
I = 0
Do While I < 3
  Console.WriteLine(I.ToString())
  I += 1
Loop
</Tab>

<Tab Name="JScript">
var i : int = 0;
while (i < 3) {
  Console.WriteLine(i);
  i += 1;
}

</Tab>
</Acme:TabControl>









<p>
<span class="subhead"><a name="Exceptions">Exception Handling</span>
<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
try {
    // Code that throws exceptions
} catch(OverflowException e) {
    // Catch a specific exception
} catch(Exception e) {
    // Catch the generic exceptions
} finally {
    // Execute some cleanup code
}
</Tab>

<Tab Name="VB">
Try
    ' Code that throws exceptions
Catch E As OverflowException
    ' Catch a specific exception
Catch E As Exception
    ' Catch the generic exceptions
Finally
    ' Execute some cleanup code
End Try
</Tab>

<Tab Name="JScript">
try {
    // Code that throws exceptions
} catch(e:OverflowException) {
    // Catch a specific exception
} catch(e:Exception) {
    // Catch the generic exceptions
} finally {
    // Execute some cleanup code
}
</Tab>
</Acme:TabControl>


<p>
<span class="subhead"><a name="StringCat">String Concatenation</span>
<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
// Using Strings
String s1;
String s2 = "hello";
s2 += " world";
s1 = s2 + " !!!";

// Using StringBuilder class for performance
StringBuilder s3 = new StringBuilder();
s3.Append("hello");
s3.Append(" world");
s3.Append(" !!!");
</Tab>

<Tab Name="VB">
' Using Strings
Dim s1, s2 As String
s2 = "hello"
s2 &= " world"
s1 = s2 & " !!!"

' Using StringBuilder class for performance
Dim s3 As New StringBuilder()
s3.Append("hello")
s3.Append(" world")
s3.Append(" !!!")
</Tab>

<Tab Name="JScript">
// Using Strings
var s1 : String;
var s2 : String = "hello";
s2 += " world";
s1 = s2 + " !!!";

// Using StringBuilder class for performance
var s3:StringBuilder = new StringBuilder();
s3.Append("hello");
s3.Append(" world");
s3.Append(" !!!");
</Tab>
</Acme:TabControl>


<p>
<span class="subhead"><a name="DeclareHandler">Event Handler Delegates</span>
<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
void MyButton_Click(Object sender,
                    EventArgs E) {
...
}
</Tab>

<Tab Name="VB">
Sub MyButton_Click(Sender As Object,
                   E As EventArgs)
...
End Sub
</Tab>

<Tab Name="JScript">
function MyButton_Click(sender : Object,
                        E : EventArgs) {
...
}
</Tab>
</Acme:TabControl>

<p>
<span class="subhead"><a name="DeclareEvent">Declare Events</span>
<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
// Create a public event
public event EventHandler MyEvent;

// Create a method for firing the event
protected void OnMyEvent(EventArgs e) {
      MyEvent(this, e);
}
</Tab>

<Tab Name="VB">
' Create a public event
Public Event MyEvent(Sender as Object, E as EventArgs)

' Create a method for firing the event
Protected Sub OnMyEvent(E As EventArgs)
    RaiseEvent MyEvent(Me, E)
End Sub
</Tab>

<Tab Name="JScript">
JScript does not support the creation of events.  JScript can only
consume events by declaring event handler delegates and adding those
delegates to the events of another control.




</Tab>
</Acme:TabControl>


<p>
<span class="subhead"><a name="AddRemoveHandler">Add or Remove 
Event Handlers to Events</span>
<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
Control.Change += new EventHandler(this.ChangeEventHandler);
Control.Change -= new EventHandler(this.ChangeEventHandler);
</Tab>

<Tab Name="VB">
AddHandler Control.Change, AddressOf Me.ChangeEventHandler
RemoveHandler Control.Change, AddressOf Me.ChangeEventHandler
</Tab>

<Tab Name="JScript">
Control.add_Change(ChangeEventHandler);
Control.remove_Change(ChangeEventHandler);
</Tab>
</Acme:TabControl>

<p>
<span class="subhead"><a name="Casting">Casting</span>
<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
MyObject obj = (MyObject)Session["Some Value"];
IMyObject iObj = obj;





</Tab>

<Tab Name="VB">
Dim obj As MyObject
Dim iObj As IMyObject
obj = Session("Some Value")
iObj = CType(obj, IMyObject)



</Tab>

<Tab Name="JScript">
var obj : MyObject = MyObject(Session("Some Value"));
var iObj : IMyObject = obj;

Note: JScript will always make the cast automatically, 
as long as the cast is possible without loss of 
information. Explicit casts are only needed if 
information will be lost.
</Tab>
</Acme:TabControl>

<p>
<span class="subhead"><a name="Convert">Conversion</span>
<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
int i = 3;
String s = i.ToString();
double d = Double.Parse(s);






</Tab>

<Tab Name="VB">
Dim i As Integer
Dim s As String
Dim d As Double

i = 3
s = i.ToString()
d = CDbl(s)

' See also CDbl(...), CStr(...), ...
</Tab>

<Tab Name="JScript">
var i : int = 3;
var s : String = i.ToString();
var d : double = Number(s);

Note:  JScript will always make the conversion automatically, 
as long as the conversion is possible without loss of information.



</Tab>
</Acme:TabControl>

<p>
<span class="subhead"><a name="ClassDef">Class Definition with Inheritance</span>
<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
using System;

namespace MySpace {

  public class Foo : Bar {

    int x;

    public Foo() { x = 4; }
    public void Add(int x) { this.x += x; }
    override public int GetNum() { return x; }
  }

}

// csc /out:librarycs.dll /t:library
// library.cs










</Tab>

<Tab Name="VB">
Imports System

Namespace MySpace

  Public Class Foo : Inherits Bar

    Dim x As Integer

    Public Sub New()
      MyBase.New()
      x = 4
    End Sub

    Public Sub Add(x As Integer)
      Me.x = Me.x + x
    End Sub

    Overrides Public Function GetNum() As Integer
       Return x
    End Function

  End Class

End Namespace

' vbc /out:libraryvb.dll /t:library
' library.vb
</Tab>

<Tab Name="JScript">
import System;

package MySpace {

  class Foo extends Bar {

    private var x : int;

    function Foo() { x = 4; }
    function Add(x : int) { this.x += x; }
    override function GetNum() : int { return x; }
  }

}

// jsc /t:library /out:libraryjs.dll library.js











</Tab>
</Acme:TabControl>

<p>
<span class="subhead"><a name="InterfaceImpl">Implementing an Interface</span>
<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
public class MyClass : IEnumerable {
 ...

    IEnumerator IEnumerable.GetEnumerator() {
         ...
    }
}

</Tab>

<Tab Name="VB">
Public Class MyClass : Implements IEnumerable
 ...

    Function IEnumerable_GetEnumerator() As IEnumerator _
        Implements IEnumerable.GetEnumerator
         ...
    End Function
End Class
</Tab>

<Tab Name="JScript">
public class MyClass implements IEnumerable {
 ...

    function IEnumerable.GetEnumerator() : IEnumerator {
         ...
    }
}

</Tab>
</Acme:TabControl>







<p>
<span class="subhead"><a name="ClassMain">Class Definition with a Main Method</span>
<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
using System;

public class ConsoleCS {

  public ConsoleCS() {
    Console.WriteLine("Object Created");
  }

  public static void Main (String[] args) {
    Console.WriteLine("Hello World");
    ConsoleCS ccs = new ConsoleCS();
  }

}

// csc /out:consolecs.exe /t:exe console.cs

</Tab>

<Tab Name="VB">
Imports System

Public Class ConsoleVB

  Public Sub New()
    MyBase.New()
    Console.WriteLine("Object Created")
  End Sub

  Public Shared Sub Main()
    Console.WriteLine("Hello World")
    Dim cvb As New ConsoleVB
  End Sub

End Class

' vbc /out:consolevb.exe /t:exe console.vb
</Tab>

<Tab Name="JScript">
class ConsoleJS {
	
  function ConsoleJS() {
    print("Object Created");
  }
}
	
print("Hello World");
var cjs : ConsoleJS = new ConsoleJS();

	
// jsc /out:consolejs.exe console.js





</Tab>
</Acme:TabControl>

<p>
<span class="subhead"><a name="Module">Standard Module</span>
<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
using System;

public class Module {

public static void Main (String[] args) {
  Console.WriteLine("Hello World");
}

}
// csc /out:consolecs.exe /t:exe console.cs

</Tab>

<Tab Name="VB">
Imports System

Public Module ConsoleVB

  Public Sub Main()
    Console.WriteLine("Hello World")
  End Sub

End Module

' vbc /out:consolevb.exe /t:exe console.vb
</Tab>

<Tab Name="JScript">
print("Hello World");

// jsc /out:consolejs.exe /exe console.js








</Tab>
</Acme:TabControl>

<p>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->