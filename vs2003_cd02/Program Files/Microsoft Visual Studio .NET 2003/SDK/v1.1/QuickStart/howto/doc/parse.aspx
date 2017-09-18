<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/basedatatypesheader.inc" -->

<h4>How Do I...Parse datatypes?</h4>

Moving information from one data type to another is essential when dealing with data. Parsing information from a string into another data type is available with almost all the nonstring data types you will work with, through the use of the <b>Parse</b> method. You can also convert data into Strings using the <b>ToString</b> method. This demonstration includes examples of methods inside the <b>Convert</b> class, to convert nonstring data types to and from each other.

<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/BaseDataTypes/parse/parse.src"
RunSample="/quickstart/howto/samples/BaseDataTypes/parse/CS/parse.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="C# Parse.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/BaseDataTypes/parse/parse.src"
RunSample="/quickstart/howto/samples/BaseDataTypes/parse/VB/parse.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB Parse.aspx"
runat="server" />
  </VbTemplate>
  <CpTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/BaseDataTypes/parse/parse.src"
RunSample="/quickstart/howto/samples/BaseDataTypes/parse/CP"
Icon = "/quickstart/images/genicon.gif"
Caption="C++ Parse.exe"
MapRunSamplePath=true
runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<p>
First, you need to convert information from some arbitrary base data type into a string. The <b>Object</b> class (the class from which all other objects derive) has a <b>ToString</b> method that is automatically inherited by all other objects. Converting an object to a string may be less useful (if you don't override it, expect to receive the name of the class), so the derived class must override the method, and make it more useful. In its simplest form, the <b>ToString</b> method needs to be applied to an instance of a particular object, with no parameters, as in the following sample.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
Int32 intExample = 76;
String strExample = intExample.ToString();

// example one, having put the value in a string
Console.WriteLine("The string value is " + strExample);

// example two, converting the integer to a string on the fly
Console.WriteLine("The string value is " + intExample.ToString());

// example three, not converting the integer to a string at all???
Console.WriteLine("The string value is " + intExample);
</Tab>
<Tab Name="VB">
Dim intExample As Integer = 76
Dim strExample As String = intExample.ToString()

'  example one, having put the value in a string
Console.WriteLine("The string value is " & strExample)

'  example two, converting the integer to a string on the fly
Console.WriteLine("The string value is " & intExample.ToString())

'  example three, not converting the integer to a string at all???
Console.WriteLine("The string value is " & intExample)
</Tab>
<Tab Name="C++">
int intExample = 76;
String* strExample = intExample.ToString();

//example one, having put the value in a string
Console::WriteLine("The string value is {0}" , strExample);

// example two, converting the integer to a string on the fly
Console::WriteLine("The string value is {0}", intExample.ToString());

// example three, not converting the integer to a string at all???
Console::WriteLine("The string value is {0}" , __box(intExample)) ;
</Tab>
</Acme:TabControl>

<p>
In the previous example, there are three lines being printed to the standard out stream. Which ones do you think will work? Believe it or not, all three lines will result in the same output to the output stream. The first one is hopefully pretty clear; having converted the integer to a string, you can concatenate that string to another string. The second one is fairly intuitive as well, if you remember that the <b>ToString</b> method on intExample returns a string, and therefore concatenates this return value onto the string being printed.
<p>

But what about the third example? This may look like it should not work, but in fact, there are some helpful routines that will convert nonstring data types into strings for you automatically (this is known as 'implicit conversion'). Don't rely on implicit conversion, however; until you learn where implicit conversion does and does not occur, you should use either of the first two examples.
<p>

To convert from a String to an integer, a Boolean, or some other non-String data type, use the non-instantiated <b>Parse</b> method, passing in the String you want to convert. The following lines are examples of using parse. To print the String you just parsed out to the screen, it needs to be converted back to a String by the <b>WriteLine</b> method.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
String strExample1 = "true";
String strExample2 = "00.987";
String strExample3 = "127";
String strExample4 = "42";

Console.WriteLine( "Parsing {0} = {1}", strExample1, Boolean.Parse(strExample1) ); //to boolean
Console.WriteLine( "Parsing {0} = {1}", strExample2, Double.Parse(strExample2) );  //to double
Console.WriteLine( "Parsing {0} = {1}", strExample3, Int32.Parse( strExample3) );  //to Int
Console.WriteLine( "Parsing {0} = {1}", strExample4, Byte.Parse(strExample4) );    //to byte

strExample5 = "three";

//catching any exceptions...
try {
     Console.WriteLine("The integer value is " + Int32.Parse(strExample5));
} catch (Exception){
     Console.WriteLine("The value '{0}' cannot be converted to a integer value.", strExample5);
}
</Tab>
<Tab Name="VB">
Dim strExample1 As String = "true"
Dim strExample2 As String = "00.987"
Dim strExample3 As String = "127"
Dim strExample4 As String = "42"

Console.WriteLine( "Parsing {0} = {1}", strExample1, Boolean.Parse(strExample1) ) '  to boolean
Console.WriteLine( "Parsing {0} = {1}", strExample2, Double.Parse(strExample2) )  '  to double
Console.WriteLine( "Parsing {0} = {1}", strExample3, Int32.Parse( strExample3) )  '  to Int
Console.WriteLine( "Parsing {0} = {1}", strExample4, Byte.Parse(strExample4) )    '  to byte

Dim strExample5 As String = "three"

' catching any exceptions...
Try
     Console.WriteLine("The integer value is " & Int32.Parse(strExample5))
catch e As Exception
     Console.WriteLine("The value '{0}' cannot be converted to a integer value.", strExample5)
End Try
</Tab>
<Tab Name="C++">
String* strExample1 = "true";
String* strExample2 = "00.987";
String* strExample3 = "127";
String* strExample4 = "42";

Console::WriteLine( "Parsing {0} = {1}", strExample1, __box(Boolean::Parse(strExample1)) );// ' convert to a boolean
Console::WriteLine( "Parsing {0} = {1}", strExample2, __box(Double::Parse(strExample2)) );//  ' convert to a double value
Console::WriteLine( "Parsing {0} = {1}", strExample3, __box(Int32::Parse( strExample3)) );//  ' convert to an Int
Console::WriteLine( "Parsing {0} = {1}", strExample4, __box(Byte::Parse(strExample4)) );//    ' convert to a byte

String* strExample5 = "three";

//catching any exceptions...
try {
	Console::WriteLine("The integer value is {0} " , __box( Int32::Parse(strExample5)));
} catch(Exception *) {
	Console::WriteLine("The value '{0}' cannot be converted to a integer value.", strExample5);
}
</Tab>
</Acme:TabControl>

<p>
Now that you can convert information to and from Strings, the next issue is how to convert information from other data types. Fortunately, there is a <b>Convert</b> class designed specifically for this. The <b>Convert</b> class has a number of static methods, beginning with 'To' and ending with the target data type of the Object you want to convert; for example, <b>ToInt32</b> or <b>ToByte</b>. If successful, the returned variable from the method you use is an object of the target data type. Not all conversions will be possible when using the <b>Convert</b> method, so use a try...catch block if you think you may get uncertain results. The following examples demonstrate some of the 'To' methods in the <b>Convert</b> object.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
Int32 intExample = 76;

// the methods inside convert...
Console.WriteLine("Convert.ToString, result = {0}", Convert.ToString(intExample));   //displays 76
Console.WriteLine("Convert.ToBoolean, result = {0}", Convert.ToBoolean(intExample)); //displays True
Console.WriteLine("Convert.ToByte, result = {0}", Convert.ToByte(intExample));       //displays 76
Console.WriteLine("Convert.ToChar, result =  {0}", Convert.ToChar(intExample));      //displays L
Console.WriteLine("Convert.ToDouble, result = {0}", Convert.ToDouble(intExample));   //displays 76
</Tab>
<Tab Name="VB">
Dim intExample as Integer = 76

'  the methods inside convert...
Console.WriteLine("Convert.ToString, result = {0}", Convert.ToString(intExample))   '  displays 76
Console.WriteLine("Convert.ToBoolean, result = {0}", Convert.ToBoolean(intExample)) '  displays True
Console.WriteLine("Convert.ToByte, result = {0}", Convert.ToByte(intExample))       '  displays 76
Console.WriteLine("Convert.ToChar, result =  {0}", Convert.ToChar(intExample))      '  displays L
Console.WriteLine("Convert.ToDouble, result = {0}", Convert.ToDouble(intExample))   '  displays 76
</Tab>
<Tab Name="C++">
int intExample = 76;

//the methods inside convert...
Console::WriteLine("Using Convert::ToString, result = {0}", Convert::ToString(intExample));//   'String conversion, displays 76
Console::WriteLine("Using Convert::ToBoolean, result = {0}", __box(Convert::ToBoolean(intExample)));// 'Boolean conversion, displays True
Console::WriteLine("Using Convert::ToByte, result = {0}", __box(Convert::ToByte(intExample)));//       'Byte conversion, displays 76
Console::WriteLine("Using Convert::ToChar, result =  {0}", __box(Convert::ToChar(intExample)));//      'Char conversion, displays L (char value of 76)
Console::WriteLine("Using Convert::ToDouble, result = {0}", __box(Convert::ToDouble(intExample)));//   'Double conversion, displays 76</Tab>
</Acme:TabControl>

<p>
If you want to convert dates into and out of strings (perhaps for formatting), you can use either the <b>Parse</b> method on the <b>DateTime</b> data type, or you can use a string's <b>ToDateTime</b> method. Both will achieve the same objective. Because dates can often be entered incorrectly by your users, don't forget to include appropriate exception handling to make sure that any conversion errors are caught. If you want to provide more control over parsing a date, see the <b>ParseExact</b> method.
<p>

Also note in the following sample that the first line forces this parse to work, because dates for the U.S. culture are used. If you want to try this code in your own culture, omit the first line, and then pick dates that make sense for your culture.
<p>
 
<Acme:TabControl runat="server">
<Tab Name="C#">
System.Threading.Thread.CurrentThread.CurrentCulture = new CultureInfo("en-US");

String date = "03/17/77";

// Simple DateTime parsing
Console.WriteLine("Parsing {0}, using the Parse method.",date);

DateTime d = DateTime.Parse(date);
Console.WriteLine("The date parsed as {0}",d);

// DateTime parsing using ParseExact
String date2 = "Thursday, March 17, 1977";
Console.WriteLine("Parsing {0}, using the ParseExact method.",date2);

DateTime d2 = DateTime.ParseExact(date2,"D", null);
Console.WriteLine("The date parsed as {0}",d2);
</Tab>
<Tab Name="VB">
System.Threading.Thread.CurrentThread.CurrentCulture = new CultureInfo("en-US")

Dim strDate As String = "03/17/77"

'  Simple DateTime parsing
Console.WriteLine("Parsing {0}, using the Parse method.", strDate)

Dim d As DateTime = DateTime.Parse(strDate)
Console.WriteLine("The date parsed as {0}",d)

'  DateTime parsing using ParseExact
Dim strDate2 As String = "Thursday, March 17, 1977"
Console.WriteLine("Parsing {0}, using the ParseExact method.", strDate2)

Dim d2 As DateTime = DateTime.ParseExact(strDate2,"D", DBNull)
Console.WriteLine("The date parsed as {0}",d2)
</Tab>
<Tab Name="C++">
System::Threading::Thread::CurrentThread->CurrentCulture = new CultureInfo("en-US");

String* strDate = "03/17/77";

// Simple DateTime parsing
Console::WriteLine("Parsing {0}, using the Parse method.", strDate);
DateTime d = DateTime::Parse(strDate);
Console::WriteLine("The date parsed as {0}",__box(d));

// DateTime parsing using ParseExact
Console::WriteLine();
String* strDate2 = "Thursday, March 17, 1977";
Console::WriteLine("Parsing {0}, using the ParseExact method.", strDate2);
DateTime d2 = DateTime::ParseExact(strDate2,"D", 0);
Console::WriteLine("The date parsed as {0}",__box(d2));

</Tab>
</Acme:TabControl>

<p>
One great feature of parsing is that it allows you to remove unnecessary or mistyped information. For example, let's imagine that you have asked users to enter their area code as a set of three digits. People often just go ahead and type whatever they want, so users could put brackets and extra spaces on the front of the area code. Parsing can remove that information for you, rather than asking the user go back and retype the number, or perform some checking on the number yourself. In the following example, the enumeration <b>NumberStyles</b> is used to identify which style should be allowed from the user. The Bitwise '|' (BitOr in VB) is used as an 'or', indicating that the user may enter this string with parentheses, leading spaces, or trailing spaces, and the number is still acceptable. Note that a space in the middle of the number will not meet these requirements.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
String toBeParsed = "  (555)  ";

Console.WriteLine("Parsing the string {0}, with whitespace and parentheses", toBeParsed);

int j = Int32.Parse(toBeParsed,
		NumberStyles.AllowParentheses | NumberStyles.AllowLeadingWhite |
		NumberStyles.AllowTrailingWhite);

// note that the output may well be negative, because of the parentheses
Console.WriteLine("The string parsed to {0}.", j);
</Tab>
<Tab Name="VB">
Dim toBeParsed As String = "   (555)   "

Console.WriteLine("Parsing the string {0}, with whitespace and parentheses", toBeParsed)

Dim j As Integer = Int32.Parse(toBeParsed, _
		NumberStyles.AllowParentheses BitOr NumberStyles.AllowLeadingWhite BitOr _
		NumberStyles.AllowTrailingWhite)

'  note that the output may well be negative, because of the parentheses
Console.WriteLine("The string parsed to {0}.", j)
</Tab>
<Tab Name="C++">
// Parsing using NumberStyles
String* toBeParsed = "   (555)   ";

Console::WriteLine("Parsing the string \t{0}\t which contains leading/trailing white space and parentheses", toBeParsed);
int j = Int32::Parse(toBeParsed,static_cast<NumberStyles>( NumberStyles::AllowParentheses | NumberStyles::AllowLeadingWhite | NumberStyles::AllowTrailingWhite));
Console::WriteLine("The string parsed to {0}.",__box(j));// 'note that the output may well be negative, because of the parentheses
</Tab>
</Acme:TabControl>

<p>
<H4>Summary</H4>

String and data type conversion and manipulation is essential when dealing with information on a daily basis. Because most screen inputs are automatically interpreted as textual or string information, it is often necessary to convert this information into other data types before you can use it appropriately. When dealing with conversions between base data types, keep the following items in mind:
<OL>
<LI>Use the <b>ToString</b> method to convert nonstring data types into strings.
<LI>Avoid implicit conversions where possible.
<LI>To convert string information into other data types, use the <b>Parse</b> method on the target datatype of your string conversion (for example, Boolean.Parse).
<LI>To convert nonstring information from one data type to another, use any of the provided methods inside the <b>Convert</b> class, designed for this purpose. These methods begin with the word 'To' followed by the name of the target data type.
<LI>Parsing can provide richer functionality when combined with the <b>NumberStyles</b> enumeration, to help parse incorrectly entered information into numerical data.
</OL>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->

