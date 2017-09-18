/*+==========================================================================
  File:      ResGenX.cs

  Summary:   Command-line utility to produce .resX files from binary files.
 
----------------------------------------------------------------------------
  This file is part of the Microsoft .NET Framework SDK.

  Copyright (C) Microsoft Corporation.  All rights reserved.

  THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
  KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
  IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
  PARTICULAR PURPOSE.

==========================================================================+*/


using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Resources;
using System.Windows.Forms;
 
[assembly: System.Reflection.AssemblyVersion("1.0.2510.0")]

public class MainApp {

    public static int Main(string[] args) {
	Console.WriteLine("Microsoft (R) .ResX Generator - Version 1.0.3.0\r");
	Console.WriteLine("Copyright (c) Microsoft Corp 2001.  All rights reserved.\r\n");

	ResXGenArgParser ap = new ResXGenArgParser();
        if (!ap.Parse(args)) {
            // An error occurrend while parsing
            return 1;
       	}
	
	try {
		Image img = Image.FromFile(ap.InputFile);
		ResXResourceWriter rsxw = new ResXResourceWriter(ap.OutputFile); 

		rsxw.AddResource(ap.ResourceName, img);
		Console.WriteLine ("Results written to " + ap.OutputFile);
		rsxw.Close();
	}
		
	catch (FileNotFoundException) {
		 Console.WriteLine("Error: Inputfile " + ap.InputFile + " could not be found.\r\n",args[0]);
	}
		
	catch (Exception e) {
		Console.WriteLine(e.Message);
	}
        return 0;
    }
}

///////////////////////////////////////////////////////////////////////////////

class ResXGenArgParser : ArgParser {

    private string  inputFile = "";
    private string  outputFile = "";
    private string  resourceName = "";


    // Members identifying command-line argument settings
    public string filename = "";


    // Give the set of valid command-line switches to the base class
	public ResXGenArgParser() : base(new string[] { "?", "i:", "n:", "o:", "s"}) { 
    }


    // Shows resource schema.
    public override void OnSchema() {
	Console.WriteLine(ResXResourceWriter.ResourceSchema);
    }

    // Returns the user-specified input filename
    public String InputFile { get { return inputFile; } }


    // Returns the user-specified output filename
    public String OutputFile { get { return outputFile; } }


    // Returns the user-specified resource name
    public String ResourceName { get { return resourceName; } }


    // Shows application's usage info and also reports command-line argument errors.
    public override void OnUsage(String errorInfo) {
        if (errorInfo != null) {
            // An command-line argument error occurred, report it to user
            // errInfo identifies the argument that is in error.
            Console.WriteLine("Command-line switch error: {0}\n", errorInfo);
        }

	Console.WriteLine("");
	Console.WriteLine("Usage:\r");
	Console.WriteLine("    ResXGen [/i:<inputfile> /o:<outputfile> /n:<name>] [/s] [/?]\r\n");
	Console.WriteLine("Parameters:\r");
	Console.WriteLine("    /i:           Input image filename to convert\r");
	Console.WriteLine("    /o:           Output .resx filename\r");
	Console.WriteLine("    /n:           Name of the resource\r");
	Console.WriteLine("");
	Console.WriteLine("    /s            Displays ResX Resource Schema.\r");
	Console.WriteLine("");
	Console.WriteLine("    /?            Show usage information\r");
	Console.WriteLine("");
	Console.WriteLine("ResXGen.exe is a file generator utility that reads image files\r");
	Console.WriteLine("and generates .ResX (XML-based resource format) files as output."); 
    }


    // Called for each non-switch command-line argument (filespecs)
    protected override SwitchStatus OnNonSwitch(String switchValue) {
        SwitchStatus ss = SwitchStatus.Error;
		filename = switchValue;
        return(ss);
    }


    // Called for each switch command-line argument
    protected override SwitchStatus OnSwitch(String switchSymbol, String switchValue) {
        // NOTE: For case-insensitive switches, 
        //       switchSymbol will contain all lower-case characters

        SwitchStatus ss = SwitchStatus.NoError;
        switch (switchSymbol) {  

        case "i:":   // Input filename
            if (switchValue.Length < 1) {
                Console.WriteLine("No input file specified.");
                ss = SwitchStatus.Error; 
            } else {
                inputFile = switchValue;
            }
            break;

        case "o:":   // Output filename
            if (switchValue.Length < 1) {
                Console.WriteLine("No output file specified.");
                ss = SwitchStatus.Error; 
            } else {
                outputFile = switchValue;
            }
            break;

        case "n:":   // Resource name
            if (switchValue.Length < 1) {
                Console.WriteLine("No resourcename file specified.");
                ss = SwitchStatus.Error; 
            } else {
                resourceName = switchValue;
            }
            break;

        case "s":   // User wants to see Schema
            ss = SwitchStatus.ShowSchema;
            break;

        case "?":   // User wants to see Usage
            ss = SwitchStatus.ShowUsage; 
            break;

        default:
    	    Console.WriteLine("Invalid switch: \"" + switchSymbol + "\".\n");
            ss = SwitchStatus.Error; 
            break;
        }
        return(ss);
    }


    // Called when all command-line arguments have been parsed
    protected override SwitchStatus OnDoneParse() {
        SwitchStatus ss = SwitchStatus.NoError;
        // Sort all the filenames in the list
        if (inputFile == "") {
            Console.WriteLine("Error: Must include input filename.");
            ss = SwitchStatus.Error;
        }
        if (outputFile == "") {
            Console.WriteLine("Error: Must include output filename.");
            ss = SwitchStatus.Error;
        }
        if (resourceName == "") {
            Console.WriteLine("Error: Must include resource name.");
            ss = SwitchStatus.Error;
        }
        return(ss);
    }
}

