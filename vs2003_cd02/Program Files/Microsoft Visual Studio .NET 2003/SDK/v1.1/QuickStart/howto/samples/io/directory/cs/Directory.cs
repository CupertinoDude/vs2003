//-----------------------------------------------------------------------
//  This file is part of the Microsoft .NET SDK Code Samples.
// 
//  Copyright (C) Microsoft Corporation.  All rights reserved.
// 
//This source code is intended only as a supplement to Microsoft
//Development Tools and/or on-line documentation.  See these other
//materials for detailed information regarding Microsoft code samples.
// 
//THIS CODE AND INFORMATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY
//KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
//IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
//PARTICULAR PURPOSE.
//-----------------------------------------------------------------------

using System;
using System.IO;

class DirectoryLister
{


    public static void Main(string[] args)
    {
	if(args.Length == 1)
	{
		ListDirectory(args[0]);
	}
	else
	{
		Console.WriteLine("Usage: Directory.exe <directory>");
	}
    }
    public static string ListDirectory(String dirToList)
    {
        //declare the StreamReader, for accessing the file
        StringWriter strWriter = new StringWriter();

	try {
		

		DirectoryInfo dir = new DirectoryInfo( dirToList );

		Console.WriteLine();
		Console.WriteLine();
		Console.WriteLine("Following is a listing for directory: {0}", Path.GetFullPath(dir.ToString()));
		Console.WriteLine();
	        Console.WriteLine("{0, -25} {1,-12:N0} {2, -12} {3,-20:g}", 
				"Name", ("Size").PadLeft(12), "Type", "Creation Time");
	        Console.WriteLine("----------------------------------------------------------------------------");

		foreach(FileSystemInfo fsi in dir.GetFileSystemInfos()) {
		    try {
			DateTime creationTime = fsi.CreationTime;
			int subLength = 25;

	                if (fsi is FileInfo)
        		{
				FileInfo f = (FileInfo)fsi;

				//this if statement simply ensures that we do not shorten the name of the file too much!
				if (f.Name.Length < subLength)
					subLength = f.Name.Length;

		        	String name = f.Name.Substring(0, subLength);

		                long size = f.Length;

				// format the output to the screen
        			Console.WriteLine("{0, -25} {1,-12:N0} {2, -12} {3,-20:g}", 
						name, (size + " KB").PadLeft(12), "File", creationTime);
	        	}
	        	else //it must be a directory
		        {
				DirectoryInfo d = (DirectoryInfo)fsi;

				//this if statement simply ensures that we do not shorten the name of the file too much!
				if (d.Name.Length < subLength)
					subLength = d.Name.Length;

				String dirName = d.Name.Substring(0, subLength);

				// format the output to the screen
        		        Console.WriteLine("{0, -25} {1,-12:N0} {2, -12} {3,-20:g}", 
						dirName, ("").PadLeft(12), "File Folder", creationTime);
		        }
		    } catch (Exception) {} //ignore the error, and try the next item...
		}
	}
	catch (Exception e) {
		Console.WriteLine("--- PROCESS ENDED ---");
		Console.WriteLine(e.Message);
		return strWriter.ToString();
	}

	return strWriter.ToString();
    }

}