// ==============================================================================
// Filename: wordapp.cs
//
// Summary:  C# application demonstrating the use of the Microsoft Word object model
//
// This file is part of the Microsoft CLR Samples
//
// Copyright (C) Microsoft Corporation. All rights reserved
//
// This source code is intended only as a supplement to Microsoft
// Development Tools and/or on-line documentation.  See these other
// materials for detailed information reagrding Microsoft code samples.
//
// THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
// KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
// PARTICULAR PURPOSE.
//

using System;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Reflection;
using System.Collections;
using System.Threading;
using Word;

namespace WordApp
{
	class WordAppMain
    {
		static object missing = Missing.Value;
	
    	static int Main()
    	{
			
			WordAppMain myWord = new WordAppMain();
			int return_Result = 0;
			
			// Create a word object that we can manipulate
			Word.Application Word_App = null;
			Word.Document Word_doc=null;
			try
			{
				Word_App = new Word.Application();
				Word_doc=new Word.Document();
			}
			catch(Exception e)
			{
				Console.WriteLine("Can't create a word document " + e.ToString());
				return_Result = 1;
				goto Exit;
			}

			AutoCorrect autocorrect = Word_App.AutoCorrect;
			Word.AutoCorrectEntries autoEntries = autocorrect.Entries; 

			string theEnd= "\nThe End";
			autoEntries.Add("Inntroduction", "Introduction");

			Word.Documents Docs = Word_App.Documents;
			if (Docs == null)
			{
				Console.WriteLine("Docs is null");
			}
			else
			{	
				Console.WriteLine("Docs exists:" + Docs.Count);
			}

			Word_App.Visible=true;
			Word._Document my_Doc= (Word._Document) Word_doc;
			Word_doc=Docs.Add(ref missing, ref missing, ref missing, ref missing);

			object start = 0;
			object end = 0;
			Word.Range range = Word_doc.Range(ref missing,ref missing);	
			
			// add text to the doc -- this contains some deliberate misspellings so that we can correct them in a short while
			range.Text="Microsoft Word Interoperability Sample\n\nInntroduction:\n\nMicrosoft .NET will alow the creation of truly distributed XML Web services. These services will integrate and collaborate with a range of complementary services to work for customers in ways that today's internet companies can only dream of. Microsoft .NET will drive the Next Generation Internet and will shift the focus from individual Web sites or devices connected to the Internet, to constellations of computers, devices, and services that work together to deliver broader, richer solutions.\nFor more info go to:\n   ";

			// Wait so the starting state can be admired
			Thread.Sleep(2000);

			// Format the title
			Word.Font fc= new Word.Font();
			try
			{
				Console.WriteLine("Formatting the title");
				start = 0; end = 40;
				range=Word_doc.Range(ref start, ref end);
				range.Font.Size=24;
				range.Font.Bold=1; 
				range.Font.Color=Word.WdColor.wdColorGray30;
				start = 40; end = 54;
				range=Word_doc.Range(ref start, ref end);
				range.Font.Size=14;
				

			}
			catch(Exception e)
			{
				Console.WriteLine(" Font exception:{0}", e.ToString());
			}


			// Wait so the new formatting can be appreciated
			Thread.Sleep(3000);

			autocorrect.ReplaceTextFromSpellingChecker=true;
			// Fix inntroduction
			object obj = "Inntroduction";
			Word.AutoCorrectEntry errEntry= autoEntries.Item(ref obj);

			Word.Words myWords=Word_doc.Words;
			Word.Range errRange= myWords.Item(7);
			errEntry.Apply(errRange);

			// Add a caption to the window and get it back 			
			Word.Window myWindow = Word_App.ActiveWindow;
			myWindow.Caption = "Managed Word execution from C# ";
			string gotCaption = myWindow.Caption;
			if (gotCaption.Equals("Managed Word execution from C# "))
			{
				Console.WriteLine("Caption assigned and got back");
				return_Result = 1;
			}
			Thread.Sleep(2000);

			// define the selection object, find and  replace text
			Word.Selection mySelection = myWindow.Selection; 
			Word.Find myFind = mySelection.Find;
			object findText = "alow";
			object replaceText ="allow";

			// Find "alow" and replace with "allow"
			try
			{
				myFind.Execute(ref findText,ref missing,ref missing,ref missing,ref missing,ref missing,ref missing,ref missing,ref missing,ref replaceText,ref missing,ref missing,ref missing,ref missing,ref missing);
			}
			catch(Exception e)
			{
				Console.WriteLine(e);
			}
			Thread.Sleep(2000);
			Console.WriteLine(myFind.Text + " has been corrected");

			try
			{
				start = 65; end = 69;
				range=Word_doc.Range(ref start, ref end);
				Console.WriteLine("The color of .NET is being changed");
				
				range.Font.Bold=16;
				range.Font.Color=Word.WdColor.wdColorLavender;

			}
			catch(Exception e)
			{
				Console.WriteLine(" Font exception:{0}", e.ToString());
			}
			Thread.Sleep(2000);
			
			// underline the selected text
 			range=Word_doc.Range(ref start,ref end);
			range.Underline=(Word.WdUnderline.wdUnderlineDouble);

			// add hyperlink and follow the hyperlink
			Word.Hyperlinks my_Hyperlinks = Word_doc.Hyperlinks;

			// Make the range past the end of all document text
			mySelection.Start = 9999;
			mySelection.End   = 9999;
			range = mySelection.Range;

			// Add a hyperlink
			string myAddress = "http://go.microsoft.com/fwlink/?linkid=3269&clcid=0x409";
			object obj_Address = myAddress;
			Console.WriteLine("Adding hyperlink to the document");
			Word.Hyperlink my_Hyperlink1= my_Hyperlinks._Add(range, ref obj_Address, ref missing);  			
			Word_App.ActiveWindow.Selection.InsertAfter("\n");

			Thread.Sleep(5000);

			// Open a window to Hyperlink
			Process ie = Process.Start("iexplore.exe", my_Hyperlink1.Address);			

			// Wait for a short spell to allow the page to be examined
			Thread.Sleep(10000);
			
			// close the browser first
			Console.WriteLine("Removing browser window");
			ie.Kill();

			// Display "The End"
			Word_App.ActiveWindow.Selection.InsertAfter(theEnd);
			Word_App.ActiveWindow.Selection.Start = 0;
			Word_App.ActiveWindow.Selection.End = 0;
			Word_App.Activate();
			Thread.Sleep(5000);

			// Close Microsoft Word
			object myBool = Word.WdSaveOptions.wdDoNotSaveChanges;
			Word_App.ActiveWindow.Close(ref myBool,ref missing);

			Word_App.Quit(ref missing, ref missing, ref missing);

	    Exit:
			return return_Result;
	    }
	}
}
