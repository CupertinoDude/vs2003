// Self contained resource sample that iterates the resourcs in resource files

using System;
using System.Collections;
using System.IO;
using System.Resources;

class MainApp {
    public static int Main(String[] args) {

		ResDumpArgParser ap = new ResDumpArgParser();
        if (!ap.Parse(args)) {
            // An error occurrend while parsing
            return 1;
        }
	
		// Iterate through the English resources
		ResourceReader rr;
		try {
			rr = new ResourceReader(ap.filename);
			IDictionaryEnumerator de = rr.GetEnumerator();

			while (de.MoveNext()) {
				Console.WriteLine(de.Key + "\t" + " - " + de.Value);
			}
		}

		catch (FileNotFoundException e) {
			Console.WriteLine(e.ToString());
			Console.WriteLine("File not found - " + ap.filename);
		}
		catch (Exception e) {
			Console.WriteLine(e.ToString());
		}
	return 0;
	}
}

///////////////////////////////////////////////////////////////////////////////

class ResDumpArgParser : ArgParser {

    // Members identifying command-line argument settings
    public string filename = "";


    // Give the set of valid command-line switches to the base class
	public ResDumpArgParser() : base(new string[] { "?"}) { 
    }


    // Shows application's usage info and also reports command-line argument errors.
    public override void OnUsage(String errorInfo) {
        if (errorInfo != null) {
            // An command-line argument error occurred, report it to user
            // errInfo identifies the argument that is in error.
            Console.WriteLine("Command-line switch error: {0}\n", errorInfo);
        }

	    Console.WriteLine("Usage: ResDump input-filename...");
	    Console.WriteLine("   -?  Show this usage information");
    }


    // Called for each non-switch command-line argument (filespecs)
    protected override SwitchStatus OnNonSwitch(String switchValue) {
        SwitchStatus ss = SwitchStatus.NoError;
		filename = switchValue;
        return(ss);
    }


    // Called for each switch command-line argument
    protected override SwitchStatus OnSwitch(String switchSymbol, String switchValue) {
        // NOTE: For case-insensitive switches, 
        //       switchSymbol will contain all lower-case characters

        SwitchStatus ss = SwitchStatus.NoError;
        switch (switchSymbol) {  

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
        if (filename == "") {
            Console.WriteLine("Must include 1 filename.");
            ss = SwitchStatus.Error;
        }
        return(ss);
    }
}

