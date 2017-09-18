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

public class Watcher {
    public static void Main(String[] args) {
        if(args.Length < 1) {
            Console.WriteLine("Usage: Watcher.exe <directory>");
        } else {
            FileSystemWatcher watcher = new FileSystemWatcher();
            watcher.Path= args[0];
            watcher.NotifyFilter = NotifyFilters.FileName | NotifyFilters.Attributes | NotifyFilters.LastAccess | NotifyFilters.LastWrite | NotifyFilters.Security | NotifyFilters.Size;

            watcher.Changed += new FileSystemEventHandler(OnChanged);
            watcher.Created += new FileSystemEventHandler(OnChanged);
            watcher.Deleted += new FileSystemEventHandler(OnChanged);
            watcher.Renamed += new RenamedEventHandler(OnRenamed);

            watcher.EnableRaisingEvents = true;
        }

        Console.WriteLine("Press Enter to quit the sample\r\n");
        Console.ReadLine();
    }

    public static void OnChanged(object source, FileSystemEventArgs e) {
        Console.WriteLine("File: {0} {1}", e.FullPath, e.ChangeType.ToString("G"));
    }

    public static void OnRenamed(Object source, RenamedEventArgs e) {
        Console.WriteLine("File: {0} Renamed to {1}", e.OldFullPath, e.FullPath);
    }
}