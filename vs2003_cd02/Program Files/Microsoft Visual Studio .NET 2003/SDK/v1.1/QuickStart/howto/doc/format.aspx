<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/basedatatypesheader.inc" -->

<h4>How Do I...Format basic types?</h4>

This sample illustrates how to format base data types for display. Traditionally, formatting the user can see, such as brackets and the
dash in a phone number, has not been viewed as the kind of information you want to
store in a permanent datastore. The formatting
provided in these demonstrations enables you to take unformatted information and make
it easier for the user to read.
<p>

The following section includes examples of formatting dates, integral and
floating-point numbers. You can also find out how to customize formatting for your own
types of data, and adding your own formatting codes. To support formatting,
your object should implement the <b>IFormattable</b> interface.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/BaseDataTypes/format/stringformat.src"
RunSample="/quickstart/howto/samples/BaseDataTypes/format/CS/stringformat.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="C# StringFormat.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/BaseDataTypes/format/stringformat.src"
RunSample="/quickstart/howto/samples/BaseDataTypes/format/VB/stringformat.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB StringFormat.aspx"
runat="server" />
  </VbTemplate>
  <CpTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/BaseDataTypes/format/stringformat.src"
RunSample="/quickstart/howto/samples/BaseDataTypes/format/CP"
Icon = "/quickstart/images/genicon.gif"
Caption="C++ StringFormat.exe"
MapRunSamplePath=True
runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<p>
When using the <b>Console</b> object, you can request it to write out a line of information to the standard output stream (unless you have previously requested a different output location). Using the <b>Write</b> or <b>WriteLine</b> methods, you can give <b>Console</b> a string with parameters you want to be printed, referenced inside the string. This is a simple way of formatting, where you are requesting nothing to be done to the information you have provided, except embed it in the string at the specified place.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
String strFirst = "John";
String strLast = "Doe";

// the output from this line displays 'My name is John Doe'
Console.WriteLine("My name is {0} {1}.", strFirst, strLast);
</Tab>
<Tab Name="VB">
Dim strFirst As String = "John"
Dim strLast As String = "Doe"

'  the output from this line displays 'My name is John Doe'
Console.WriteLine("My name is {0} {1}.", strFirst, strLast)
</Tab>
<Tab Name="C++">
String* strFirst = "John";
String* strLast = "Doe";

// the output from this line displays 'My name is John Doe'
Console::WriteLine("My name is {0} {1}.", strFirst, strLast);
</Tab>
</Acme:TabControl>

<p>
Suppose you have some tabular information you want to make sure is lined up from one row to the next. You could use tabs to achieve this, but tabs are a predefined size. Instead, inside your embedded instruction in the string you passed to <b>WriteLine</b>, include another tag specifying the size of the parameter you are passing. If the actual size (or length) of your parameter is shorter than this size, it will be formatted with space to fill out the area leftover. A negative sign is on the specified size; this indicates that the text for that parameter should be left-aligned. Therefore if you want it right-aligned, omit the negative sign.
<p>

In the following example, two formattable parameters are defined. The first should take a minimum of four columns, and the second, a minimum of 20 columns. Note that if the strings you are formatting exceed this minimum, your results will not look as good.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
string [] names = {"Mary-Beth", "Aunt Alma", "Sue",
		"My Really Long Name", "Matt"};



for (int k = 0; k < 5; k++) {

	// the | in this example are included simply to show you
	// the boundaries of the formatting
	Console.WriteLine ("| {0,-4}{1,-20} |", k, names[k]);
}
</Tab>
<Tab Name="VB">
Dim names() as String = {"Mary-Beth", "Aunt Alma", "Sue", _
		"My Really Long Name", "Matt"}

Dim intCount as Integer

For intCount = 0 to 4 Step 1

	'  the | in this example are included simply to show you
	'  the boundaries of the formatting
	Console.WriteLine ("| {0,-4}{1,-20} |", k, names(k))
Next intCount
</Tab>
<Tab Name="C++">
String * names[]= {S"Mary-Beth", S"Aunt Alma", S"Sue", 
		  S"My Really Long Name", S"Matt"};
for (int k = 0; k < 5; k++)
{
	// the | in this example are included simply to show you
	// the boundaries of the formatting
	Console::WriteLine ("| {0,-4}{1,-20} |", k.ToString(), names[k]);
}
</Tab>
</Acme:TabControl>

<p>
Of course, you don't only want to be able to format string information. The ability to format dates can save you a lot of time and effort. Imagine having to figure out how to change a short date format such as 01/06/1996 into a full string naming the day and the month. Fortunately, formatting can do all of this for you.<p>

Dates support the <b>IFormattable</b> interface. This interface provides access to one method: a <b>ToString</b> method which accepts a format specifier, and an <b>IFormatProvider</b>. To use
the <b>ToString</b> method, you have to know the format specifier you want to use (such as "d" for the short date format). The format specifier you specify determines what will happen when using the <b>ToString</b> method. A short sub-selection is displayed here; see the .NET Framework SDK for information on each of the format specifiers.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
DateTime d = DateTime.Now;

Console.WriteLine ("{0,-2} {1}", "d", d.ToString ("d", null) ); // short date
Console.WriteLine ("{0,-2} {1}", "D", d.ToString ("D", null) ); // long date
Console.WriteLine ("{0,-2} {1}", "G", d.ToString ("G", null) ); // short date and time
Console.WriteLine ("{0,-2} {1}", "m", d.ToString ("m", null) ); // Month and day only
Console.WriteLine ("{0,-2} {1}", "r", d.ToString ("r", null) ); // GMT time
Console.WriteLine ("{0,-2} {1}", "T", d.ToString ("T", null) ); // time only (hh:mm:ss)
Console.WriteLine ("{0,-2} {1}", "u", d.ToString ("u", null) ); // UTC date and time
</Tab>
<Tab Name="VB">
Dim d As DateTime = DateTime.Now

Console.WriteLine ("{0,-2} {1}", "d", d.ToString ("d", null) )  '  short date
Console.WriteLine ("{0,-2} {1}", "D", d.ToString ("D", null) )  '  long date
Console.WriteLine ("{0,-2} {1}", "G", d.ToString ("G", null) )  '  short date and time
Console.WriteLine ("{0,-2} {1}", "m", d.ToString ("m", null) )  '  Month and day only
Console.WriteLine ("{0,-2} {1}", "r", d.ToString ("r", null) )  '  GMT time
Console.WriteLine ("{0,-2} {1}", "T", d.ToString ("T", null) )  '  time only (hh:mm:ss)
Console.WriteLine ("{0,-2} {1}", "u", d.ToString ("u", null) )  '  UTC date and time
</Tab>
<Tab Name="C++">
DateTime d = DateTime::Now;
IFormattable * id = __box( d );

PrintFormat (id, "d"); // short date
PrintFormat (id, "D"); // long date
PrintFormat (id, "G"); // short date and time
PrintFormat (id, "m"); // Month and day only
PrintFormat (id, "r"); // GMT time
PrintFormat (id, "T"); // time only (hh:mm:ss)
PrintFormat (id, "u"); // UTC date and time

...
void PrintFormat (IFormattable* value, String *formatString)
{
	Console::WriteLine ("{0}\t{1}", formatString, value->ToString (formatString, 0));
}
</Tab>
</Acme:TabControl>

<p>
You can also use 'picture' formats for dates to control what gets displayed if you don't want to use the predefined formats above. A picture format is a string of letters instructing a particular display. For example, 'ddd' instructs the formatter to display the day segment of your <b>DateTime</b> object as a three letter selection. 'MMMM' indicates to display the full word for the month. You can then put these picture formats together in your own way, as in the following sample.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
DateTime d = DateTime.Now;

// example output: Sat
Console.WriteLine ("{0}", "ddd", d.ToString ("ddd", null) );

// example output: October 17, 2000
Console.WriteLine ("{0}", d.ToString ("MMMM dd, yyyy", null) );
</Tab>
<Tab Name="VB">
Dim d As DateTime = DateTime.Now

'  example output: Sat
Console.WriteLine ("{0}", "ddd", d.ToString ("ddd", null) )

'  example output: October 17, 2000
Console.WriteLine ("{0}", d.ToString ("MMMM dd, yyyy", null) )
</Tab>
<Tab Name="C++">
DateTime d = DateTime::Now;
IFormattable * id = __box( d );

// example output: Sat
PrintFormat (id, "ddd");
// example output: October 17, 2000
PrintFormat (id, "MMMM dd, yyyy");

...
void PrintFormat (IFormattable* value, String *formatString)
{
	Console::WriteLine ("{0}\t{1}", formatString, value->ToString (formatString, 0));
}
</Tab>
</Acme:TabControl>

<p>
In addition, you may need to format numeric information. In these situations, you can use predefined or picture formats (just like you can for dates). Use a hash (#) to denote a number, and if you want to use a particular number of spaces, simply add that many hashes. When using these formats, make sure you only use numeric information, as in the following example (for more information on the formatting codes, see the .NET Framework SDK.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
double dblNum = 12.9625;
int intNum = 73;
double dblPercent = 0.25;

//predefined formats
Console.WriteLine ("{0,-8} {1}", "c", dblNum.ToString ("c", null) ); //currency
Console.WriteLine ("{0,-8} {1}", "d", intNum.ToString ("d", null) ); //Decimal Format
Console.WriteLine ("{0,-8} {1}", "e", dblNum.ToString ("e", null) ); //Engineering (scientific)
Console.WriteLine ("{0,-8} {1}", "f", dblNum.ToString ("f", null) ); //Fixed Point format
Console.WriteLine ("{0,-8} {1}", "g", dblNum.ToString ("g", null) ); //General Format
Console.WriteLine ("{0,-8} {1}", "n", dblNum.ToString ("n", null) ); //add comma separators
Console.WriteLine ("{0,-8} {1}", "x", intNum.ToString ("x", null) ); //Hexadecimal

//pictures formats
Console.WriteLine ("{0,-8} {1}", "#", intNum.ToString ("#", null) );       // the number
Console.WriteLine ("{0,-8} {1}", "###", intNum.ToString ("###", null) );   // take three places
Console.WriteLine ("{0,-8} {1}", "#.00", intNum.ToString ("#.00", null) ); // decimal holder on the end
Console.WriteLine ("{0,-8} {1}", "D4", intNum.ToString ("D4", null) );     // leading zeroes
Console.WriteLine ("{0,-8} {1}", "%#", dblPercent.ToString ("%#", null) ); // percentage
</Tab>
<Tab Name="VB">
Dim dblNum As double = 12.9625
Dim intNum As Integer = 73
Dim dblPercent As double = 0.25

' predefined formats
Console.WriteLine ("{0,-8} {1}", "c", dblNum.ToString ("c", null) )  ' currency
Console.WriteLine ("{0,-8} {1}", "d", intNum.ToString ("d", null) )  ' Decimal Format
Console.WriteLine ("{0,-8} {1}", "e", dblNum.ToString ("e", null) )  ' Engineering (scientific)
Console.WriteLine ("{0,-8} {1}", "f", dblNum.ToString ("f", null) )  ' Fixed Point format
Console.WriteLine ("{0,-8} {1}", "g", dblNum.ToString ("g", null) )  ' General Format
Console.WriteLine ("{0,-8} {1}", "n", dblNum.ToString ("n", null) )  ' add comma separators
Console.WriteLine ("{0,-8} {1}", "x", intNum.ToString ("x", null) )  ' Hexadecimal

' pictures formats
Console.WriteLine ("{0,-8} {1}", "#", intNum.ToString ("#", null) )        '  the number
Console.WriteLine ("{0,-8} {1}", "###", intNum.ToString ("###", null) )    '  take three places
Console.WriteLine ("{0,-8} {1}", "#.00", intNum.ToString ("#.00", null) )  '  decimal holder on the end
Console.WriteLine ("{0,-8} {1}", "D4", intNum.ToString ("D4", null) )      '  leading zeroes
Console.WriteLine ("{0,-8} {1}", "%#", dblPercent.ToString ("%#", null) )  '  percentage
</Tab>
<Tab Name="C++">

// Number standard formats
double num = 12.9625;

Console::WriteLine("Numeric Formatting:  Predefined formats");
Console::WriteLine ("{0}\t{1}" ,S"Code", S"Format");
Console::WriteLine ("{0}\t{1}" ,S"----", S"------");
IFormattable *  inum = __box(num);   
PrintFormat (inum, "c");
PrintFormat (__box(103), "d");
PrintFormat (inum, "e");
PrintFormat (inum, "f");
PrintFormat (inum, "g");
PrintFormat (inum, "n");
PrintFormat (__box(1102), "x");

Console::WriteLine ();


// Number custom formats
int i = 25;

Console::WriteLine("Numeric Formatting:  Picture formats");
Console::WriteLine ("{0}\t{1}" ,S"Code", S"Format");
Console::WriteLine ("{0}\t{1}" ,S"----", S"------");
IFormattable* bi=__box(i);
PrintFormat (bi, "#");
PrintFormat (bi, "###");
PrintFormat (bi, "#.00");
PrintFormat (__box(i/100.0), "%#");
PrintFormat (bi, "D4");

Console::WriteLine ();

...
void PrintFormat (IFormattable* value, String *formatString)
{
	Console::WriteLine ("{0}\t{1}", formatString, value->ToString (formatString, 0));
}
</Tab>
</Acme:TabControl>

<p>
You can also use formatting to get both name and value information about the entries in an enumeration (enum). An enumeration defines names that programmers can use to identify constant values (the constant integer values need not even have a specific number: the system can work it out for you). This allows you to make code that is more readable. For example, is it easier to say 'Car.Color = Green' or 'Car.Color = 67'? The former is far easier to read and understand. Enumerations have their own fields and methods that allow you to retrieve the values and names in a particular enum; however, you can achieve the same objective using formatting. In the following example, an enum called <b>Color</b> is defined, and then use formatting to print the values, and names inside that enum.
<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
// an enum to be used for Color
public enum Color {

	Red,
	Blue,
	Green = 27	// if need be, you can specify a value
			// (27 is arbitrary). Otherwise, the system will
			// define the value. Red is given 0, Blue 1, etc.
}

// now, to format the names and values.
Console.WriteLine ("Name: {0}, Value: {1}", Color.Red.ToString(), Color.Red.ToString ("D", null));
Console.WriteLine ("Name: {0}, Value: {1}", Color.Blue.ToString(), Color.Blue.ToString ("D", null));
Console.WriteLine ("Name: {0}, Value: {1}", Color.Green.ToString(), Color.Green.ToString ("D", null));
</Tab>
<Tab Name="VB">
'  an enum to be used for Color
Public Enum Color

	Red
	Blue
	Green = 27	'  if need be, you can specify a value
			'  (27 is arbitrary). Otherwise, the system will
			'  define the value. Red is given 0, Blue 1, etc.
End Enum

'  now, to format the names and values.
Console.WriteLine ("Name: {0}, Value: {1}", Color.Red.ToString(), Color.Red.ToString ("D", null))
Console.WriteLine ("Name: {0}, Value: {1}", Color.Blue.ToString(), Color.Blue.ToString ("D", null))
Console.WriteLine ("Name: {0}, Value: {1}", Color.Green.ToString(), Color.Green.ToString ("D", null))
</Tab>
<Tab Name="C++">
// an enum to be used for Color
__value  enum Color
{
	Red,
	Blue,
	Green
};

// Enum formatting
Console::WriteLine("Enum Formatting");
Console::WriteLine ("Name: {0}, Value: {1}", __box(Color::Red)->ToString("G"), __box(Color::Red)->ToString ("D"));
Console::WriteLine();
</Tab>
</Acme:TabControl>

<p>
Now that you know about predefined and picture formats, you can try a few things out. You may be asking the question: what if you want to format information for a class you have made, in your own way? You can do this by making a class that implements the <b>IFormattable</b> interface, and make sure you include a <b>ToString</b> method in this class that accepts a string, and an <b>IFormatProvider</b>. The string that gets passed in is the format code, so you will have to make sure that people know the valid codes to pass your object when calling this function. For most demonstrations, the IFormatProvider can be null. Below is a class, <b>MyType</b>, which defines its own formatting. <b>MyType</b> accepts an integer and allows you to format that integer as a binary (b), octal (o), decimal (d), or hexadecimal (h) number. Note that a good approach to formatting is that if you have determined your own custom codes are not supported, determine if the object supports the IFormattable interface and call through to it's ToString method appropriately, allowing it's formatting codes to be used if needed. Otherwise, simply convert the value to a string. Because, in this example, we know the value is an int, we do not need to check to see if the value supports IFormattable, we already know it does.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
public class MyType : IFormattable {

	private int _value; // to store the value internally

	public MyType (int value) {

		_value = value;
	}

	// This is the formatting method called by String.Format.
	// In it, look for the "b" format and then
	// fall through to Int32's format for anything else you don't know about.
	public string ToString (string format, IFormatProvider provider) {


		if (format.Equals ("b"))
			return Convert.ToString (_value, 2);
		else if (format.Equals ("o"))
			return Convert.ToString (_value, 8);
		else if (format.Equals ("d"))
			return Convert.ToString (_value, 10);
		else if (format.Equals ("h"))
			return Convert.ToString (_value, 16);
		else
			return _value.ToString (format, provider);

	}
}
</Tab>
<Tab Name="VB">
Public class MyType : Implements IFormattable

	Private _value As Integer ' to store the value internally

	Public Sub New(value As Integer)
		MyBase.New()
		_value = value
	End Sub

	'  This is the formatting method called by String.Format.
	'  In it, look for the "b" format and then
	'  fall through to Int32's format for anything else you don't know about.
	Function ToString(ByVal format As String, _
				ByVal provider As System.IFormatProvider) As String

		If (format.Equals ("b")) Then
			Format = Convert.ToString (_value, 2)
		Else If (format.Equals ("o")) Then
			Format = Convert.ToString (_value, 8)
		Else If (format.Equals ("d")) Then
			Format = Convert.ToString (_value, 10)
		Else If (format.Equals ("h")) Then
			Format = Convert.ToString (_value, 16)
		Else
			Format = _value.ToString (format, provider)
		End If
	End Function
End Class
</Tab>
<Tab Name="C++">
__gc class MyType : public IFormattable
{

private:
	int _value;// to store the value internal
public:
	MyType (int value)
	{
		_value = value;
	}
	// This is the formatting method called by String.Format.  In it, we look for the "b" format
	// which we respect  and then fall through to Int32's format for anything else we don't know about.
	String* Format (String *format, IFormatProvider* sop)
	{
		if (format->Equals ("b"))
			return Convert::ToString (_value, 2);
		else if (format->Equals ("o"))
			return Convert::ToString (_value, 8);
		else if (format->Equals ("d"))
			return Convert::ToString (_value, 10);
		else if (format->Equals ("h"))
			return Convert::ToString (_value, 16);

		return _value.ToString (format, sop);
	}

	String* ToString (String* format, IFormatProvider* sop) // included via requirements
	{ 
		if (format->Equals ("b"))
			return Convert::ToString (_value, 2);
		else if (format->Equals ("o"))
			return Convert::ToString (_value, 8);
		else if (format->Equals ("d"))
			return Convert::ToString (_value, 10);
		else if (format->Equals ("h"))
			return Convert::ToString (_value, 16);

		return _value.ToString (format, sop);
	}
};
</Tab>
</Acme:TabControl>

<p>
Having defined your own object, and formatting, you can then use the format method of that object as in this sample.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
MyType t = new MyType (43);

Console.WriteLine ("{0}", t.Format ("b", null) ); //binary
Console.WriteLine ("{0}", t.Format ("o", null) ); //octal
Console.WriteLine ("{0}", t.Format ("d", null) ); //decimal
Console.WriteLine ("{0}", t.Format ("h", null) ); //number
</Tab>
<Tab Name="VB">
Dim t As MyType = new MyType (43)

Console.WriteLine ("{0}", t.Format ("b", null) )  ' binary
Console.WriteLine ("{0}", t.Format ("o", null) )  ' octal
Console.WriteLine ("{0}", t.Format ("d", null) )  ' decimal
Console.WriteLine ("{0}", t.Format ("h", null) )  ' number
</Tab>
<Tab Name="C++">
MyType* t = new MyType (43);

PrintFormat (t, "b"); //binary
PrintFormat (t, "o"); //octal
PrintFormat (t, "d"); //decimal
PrintFormat (t, "h"); //number

...
void PrintFormat (IFormattable* value, String *formatString)
{
	Console::WriteLine ("{0}\t{1}", formatString, value->ToString (formatString, 0));
}
</Tab>
</Acme:TabControl>

<p>
You can also define your own Formatter if you need to. This allows you to define formatting rules that can be used across many classes, whereas the previous example applies formatting rules to a specific class (namely, that in which it was defined). The following example defines the general rule for creating a formatter. The critical steps are to implement the <b>ICustomFormatter</b> interface, and provide a <b>Format</b> function that defines your formatting rule.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
public class BaseFormatter : IFormatProvider, ICustomFormatter {

// ...

        public string Format (string format, object arg, IFormatProvider provider) {


                // verification code here, to ensure the suer has entered
                // a supported format....

                // this sample assumes the custom format is a capital B, followed by a number
                format = format.Trim (new char [] {'B'});
                int b = Convert.ToInt32 (format);
                return Convert.ToString ((int)arg, b);

                // If the user has not entered a supported custom format,
                // see if the datatype supports IFormattable. If it does, then
                // call through to it's IFormattable implementation of ToString.
                // Otherwise, call the default version of ToString
        }
}
</Tab>
<Tab Name="VB">
Public Class BaseFormatter : Implements IFormatProvider, ICustomFormatter

'  ...

        Public Function Format (format as String, arg As Object, _
                provider As IFormatProvider)  as string implements ICustomFormatter.Format

                '  verification code here, to ensure the suer has entered
                '  a supported format....

                '  this sample assumes the custom format is a capital B, followed by a number
                format = format.Trim (new char () {"B"})
                Dim b As Integer = Convert.ToInt32 (format)
                Format = Convert.ToString ((int)arg, b)

                '  If the user has not entered a supported custom format,
                '  see if the datatype supports IFormattable. If it does, then
                '  call through to it's IFormattable implementation of ToString.
                '  Otherwise, call the default version of ToString
         End Function
End Class
</Tab>
<Tab Name="C++">
__gc class BaseFormatter ;

// ...

	String* Format (String *format, IFormatProvider* sop)
	{
		if (format->Equals ("b"))
			return Convert::ToString (_value, 2);
		else if (format->Equals ("o"))
			return Convert::ToString (_value, 8);
		else if (format->Equals ("d"))
			return Convert::ToString (_value, 10);
		else if (format->Equals ("h"))
			return Convert::ToString (_value, 16);

		return _value.ToString (format, sop);
	}
}
</Tab>
</Acme:TabControl>

<p>
<div class="indent" style="width:660">
Using the custom formatter is slightly different, however. To do this, call the format function on string, and pass the new formatter in the appropriate position (the final parameter). In this example, the 'B8' instructs the custom formatter to format the number passed in as an octal number.
</div>

<Acme:TabControl runat="server">
<Tab Name="C#">
Console.WriteLine (String.Format
		("{0} in the custom B8 format is {1:B8}",
		new BaseFormatter(), 100, 100 ));
</Tab>
<Tab Name="VB">
Console.WriteLine (String.Format _
		("{0} in the custom B8 format is {1:B8}", _
		new BaseFormatter(), 100, 100 ))
</Tab>
<Tab Name="C++">
Console::WriteLine (String::Format
		("{0} in the custom B8 format is {1:B8}",
		new BaseFormatter(), 100, 100 ));
</Tab>
</Acme:TabControl>

<p>

<H4>Summary</H4>

<OL>
<LI>Formatting provides you with a quick and easy way to format information you want to display to the user. It works well with raw information straight from databases, which you want to put into a more human-readable format, for display purposes.
<LI>You can use the standard formatting provided with <b>Console.Write</b> and <b>Console.WriteLine</b> methods to include parameters to pass to these methods to format. This standard formatting can be extended to provide tabular formatting, as well as other formats.
<LI>Dates can be formatted in a wide range of predefined styles, and you can also use picture formatting, to define your own stylized formats.
<LI>Numbers can be formatted in much the same way as dates, but instead using a hash (#) to denote numeric formatting
<LI>If required, you can include your own formatting on a class, by implementing the <b>IFormattable</b> interface on that class, and defining a <b>ToString</b> method within it which accepts a format specifier, and a n IFormatProvider.
<LI>If you want to provide custom formatting and make it available to many different classes, you can create a class that implements <b>ICustomFormatter</b>.
</LI></OL>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->

