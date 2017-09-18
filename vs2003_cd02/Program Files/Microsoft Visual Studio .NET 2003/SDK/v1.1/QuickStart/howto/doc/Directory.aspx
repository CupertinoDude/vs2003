<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/inputoutputheader.inc" -->

<h4>How Do I...Enumerate directories and their contents?</h4>

This sample illustrates how to use the <b>DirectoryInfo</b> class to create a directory listing. This is a great way to quickly list files for users or reports, or to find basic information about a specific directory. When used in combination with <b>FileInfo</b>, you can get all the information you need about files and directories in a specific directory.
<p>
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/IO/directory/directory.src"
RunSample="/quickstart/howto/samples/IO/directory/CS"
Icon = "/quickstart/images/genicon.gif"
Caption="C# Directory.exe"
MapRunSamplePath=true
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/IO/directory/directory.src"
RunSample="/quickstart/howto/samples/IO/directory/VB"
Icon = "/quickstart/images/genicon.gif"
Caption="VB Directory.exe"
MapRunSamplePath=true
runat="server" />
  </VbTemplate>
  <CpTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/IO/directory/directory.src"
RunSample="/quickstart/howto/samples/IO/directory/CP"
Icon = "/quickstart/images/genicon.gif"
Caption="C++ Directory.exe"
MapRunSamplePath=true
runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<p>
The ability to look over files and subdirectories for a given directory is essential for many programming tasks. This QuickStart shows you how to use the <b>FileInfo</b> and <b>DirectoryInfo</b> classes.
Why not the <b>File</b> and <b>Directory</b> classes? This QuickStart intends to display information such as the size, and creation date for a given file. In this
case, it is easier to use <b>FileInfo</b> and <b>DirectoryInfo</b> objects. The <b>File</b> class focuses on the use of non-instantiated
(static in C#, or shared in Visual Basic) methods, while the <b>FileInfo</b> class offers methods based on an instance of a <b>FileInfo</b> object. <b>Directory</b> and <b>DirectoryInfo</b> are similar.
<p>

The first task explains how create an instance of the <b>DirectoryInfo</b> object (based on the current directory), then find the fully-qualified path of that directory. Next, you can make a
table of all the files and directories inside our current directory, so it will print the full
path of the current directory at the top of that table. We use the <b>GetFullPath</b> method of the </b>Path</b>
class to determine the fully-qualified path of our directory.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
//Do not forget your using statements at the top of your code.
using System;
using System.IO;
//...

// make an object which represents our current directory. The dot (".") represents this directory
DirectoryInfo dir = new DirectoryInfo(".");

// make the header for our table, letting the user know the path we are in...
Console.WriteLine("Following is a listing for directory: {0}", Path.GetFullPath(dir.ToString()));
</Tab>
<Tab Name="VB">
' don't forget your Imports statements at the top of your code...
Imports System
Imports System.IO
' ...

'  make an object which represents our current directory. The dot (".") represents this directory
Dim dir As DirectoryInfo = new DirectoryInfo(".")

'  make the header for our table, letting the user know the path we are in...
Console.WriteLine("Following is a listing for directory: {0}", Path.GetFullPath(dir.ToString()))
</Tab>
<Tab Name="C++">
//Do not forget your using statements at the top of your code.
using namespace System;
using namespace System::IO;
//...

// make an object which represents our current directory. The dot (".") represents this directory
DirectoryInfo* dir = new DirectoryInfo(".");

// make the header for our table, letting the user know the path we are in...
Console::WriteLine("Following is a listing for directory: {0}", Path::GetFullPath(dir->ToString()));
</Tab>
</Acme:TabControl>

<p>
The objects inside the directory can be files or directories. You can iterate through the directory twice, looking for files first, and directories next. An alternate solution is to use the <b>FileSystemInfo</b> object, which can represent a <b>FileInfo</b> or a <b>DirectoryInfo</b> object. This means you only have to iterate through the collection once. Then, call the <b>GetFileSystemInfos</b> method of the object created in the code above, which returns an array of <b>FileSystemInfo</b> objects. You can iterate through that array with the <b>foreach</b> (<b>For Each</b> in Visual Basic), as the following code demonstrates.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">


// loop through our array of FileSysteminfo objects
foreach(FileSystemInfo fsi in dir.GetFileSystemInfos()) {

	// ... the code in the following samples goes here.

}
</Tab>
<Tab Name="VB">
Dim fsi As FileSystemInfo

'  loop through our array of FileSysteminfo objects
For Each fsi In dir.GetFileSystemInfos()

	'  ... the code in the following samples goes here.

Next fsi
</Tab>
<Tab Name="C++">

// loop through our array of FileSysteminfo objects
IEnumerator* ie=dir->GetFileSystemInfos()->GetEnumerator();
while (ie->MoveNext())
{
	'  ... the code in the following samples goes here.
 
}
</Tab>
</Acme:TabControl>

<p>
So now you can see what kind of object each element of the <b>FileSystemInfo</b> array is, and process it accordingly.  First test the instance of the <b>FileSystemObject</b> to see if it is a file. If it is, create a new instance of the <b>FileInfo</b> object to represent it. This enables you to call the methods particular to that kind of object. If you do not do this, you could not call properties such as <b>Length</b>, which does not exist in <b>FileSystemInfo</b>. In contrast, <b>CreationTime</b> is a property of the <b>FileSystemInfo</b> object, which is why you can deal with it before you enter your <b>If</b> statement, regardless of whether you have a file or a directory.
<p>

Notice that you are shortening the name you display to the user, primarily to save screen space.  Because there can be file access or other related exceptions, execute this code in a <b>Try</b> block, to make sure it does not end abnormally. Put this code together with the code in the previous examples, and you have your program (once inside a method, of course). Note that this only demonstrates how to process a file.

<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
try {
	DateTime creationTime = fsi.CreationTime;
	int subLength = 25;

        if (fsi is FileInfo) {    // check to see if the current object is a file...

		FileInfo f = (FileInfo)fsi;

		// this if statement simply ensures that we do not shorten the
		// name of the file too much!
		if (f.Name.Length < subLength)
			subLength = f.Name.Length;
		}

		string name = f.Name.Substring(0, subLength);
                long size = f.Length;

		// format the output to the screen
       	        Console.WriteLine("{0, -25} {1,-12:N0} {2, -12} {3,-20:g}",
				name, (size + " KB").PadLeft(12), "File", creationTime);
        }
	else { // it must be a directory
		// ...
	}
} catch (Exception) {} // ignore errors such as 'file being used' etc...

</Tab>
<Tab Name="VB">
Try
	Dim creationTime As DateTime = fsi.CreationTime
	Dim subLength As Integer = 25

        If (fsi is FileInfo) Then '  check to see if the current object is a file...

		Dim f As FileInfo = CType(fsi, FileInfo)

		'  this if statement simply ensures that we do not shorten the
		'  name of the file too much!
		if f.Name.Length < subLength Then
			subLength = f.Name.Length
		End If

		Dim name As string = f.Name.Substring(0, subLength)
                Dim size As long = f.Length

		'  format the output to the screen
       	        Console.WriteLine("{0, -25} {1,-12:N0} {2, -12} {3,-20:g}", _
				name, (size + " KB").PadLeft(12), "File", creationTime)

	Else   '  it must be a directory
		'  ...
	End If
Catch                  '  ignore!!! errors such as 'file being used' and so on...
End Try
</Tab>
<Tab Name="C++">
try {

	FileSystemInfo* fsi= __try_cast<FileSystemInfo*> (ie->Current);
	DateTime creationTime = fsi->CreationTime;
	int subLength = 25;
	
	if (FileInfo *f=dynamic_cast<FileInfo *> (fsi))
	{// This is a file
	
		//this if statement simply ensures that we do not shorten the name of the file too much!
		if (f->Name->Length < subLength)
			subLength = f->Name->Length;
	
		String* name = f->Name->Substring(0, subLength);
	
		long size = f->Length;
	
		// format the output to the screen
		Console::WriteLine(S"{0, -25} {1,-12:N0} {2, -12} {3,-20:g}", 
			name, String::Concat(size.ToString() , " KB")->PadLeft(12), S"File",  creationTime.ToString());
	}
	else { // it must be a directory
		// ...
	}
} catch (Exception&) {} // ignore errors such as 'file being used' etc...

</Tab>
</Acme:TabControl>

<p>
<H4>Summary</H4>
You can working with files and directories using <b>FileInfo</b> and <b>DirectoryInfo</b>, although you can also use <b>File</b> and <b>Directory</b> as alternatives. By working with the Info-based objects, you need an instance of the class, but you can easily obtain specific information about a file or directory (such as size, or creation date).

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->

