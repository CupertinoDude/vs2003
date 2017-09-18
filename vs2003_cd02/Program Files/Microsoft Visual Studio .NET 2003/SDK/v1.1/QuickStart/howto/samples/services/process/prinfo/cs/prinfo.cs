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
using System.Diagnostics;
using System.Threading;

public class ProcessInfo
{
    public static void Main(String[] args)
    {
        string appName = Environment.GetCommandLineArgs()[0];

        if(args.Length != 2 && (args.Length != 1 || args[0]!="e"))
        {
            Console.WriteLine("Usage: ");
            Console.WriteLine("\t" + appName +" e: Enumerate processes");
            Console.WriteLine("\t" + appName +" <command> <process_id>");
            Console.WriteLine("");
            Console.WriteLine("\t\t<command> =");
            Console.WriteLine("\t\t\ti: Show process info");
            Console.WriteLine("\t\t\tc: Close");
            Console.WriteLine("\t\t\tk: Kill");
            Console.WriteLine("\t\t\tp: show curent priority");
            return;
        }

        string command = args[0];

        if(command =="e")
        {
            Process[] processes = Process.GetProcesses();

            foreach(Process process in processes)
            {
                Console.WriteLine(process.Id + "\t: " + process.ProcessName);
            }
        }
        else
        {

            Int32 processid = Int32.Parse(args[1]);
            Process process = Process.GetProcessById(processid);

            switch (command)
            {
            case "c":
                process.CloseMainWindow();
                break;
            case "k":
                process.Kill();
                break;
            case "p":
                Console.WriteLine("Priority: "+ process.PriorityClass.ToString("G"));
                break;
            case "i":
                Console.WriteLine("Priority Class         :{0}", process.PriorityClass.ToString("G"));
                Console.WriteLine("Handle Count           :{0}", process.HandleCount);
                Console.WriteLine("Main Window Title      :{0}", process.MainWindowTitle);
                Console.WriteLine("Min Working Set        :{0}", process.MinWorkingSet);
                Console.WriteLine("Max Working Set        :{0}", process.MaxWorkingSet);
                Console.WriteLine("Paged Memory Size      :{0}", process.PagedMemorySize);
                Console.WriteLine("Peak Paged Memory Size :{0}", process.PeakPagedMemorySize);
                break;
            }


        }
    }
}

