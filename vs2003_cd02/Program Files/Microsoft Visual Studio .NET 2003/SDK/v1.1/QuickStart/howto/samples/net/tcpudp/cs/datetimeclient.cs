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
using System.Net;
using System.Net.Sockets;
using System.IO;
using System.Text;

class Client {
    public static void Main(String[] args) {

        TcpClient tcpc = new TcpClient();
        Byte[] read = new Byte[32];

        if (args.Length != 1) {
            Console.WriteLine("Please specify a server name in the command line");
            return;
        }

        String server = args[0];

        // Verify that the server exists
        if (Dns.GetHostByName(server) == null) {
            Console.WriteLine("Cannot find server: {0}", server);
            return;
        }

        // Try to connect to the server
        try {
            tcpc.Connect(server, 13);
        } catch (SocketException exc) {
            Console.WriteLine("Cannot connect to {0}: {1}", server, exc.Message);
            return;
        }

        // Get the stream
        Stream s;
        try {
            s = tcpc.GetStream();
        } catch (InvalidOperationException exc) {
            Console.WriteLine("Cannot connect to {0}: {1}", server, exc.Message);
            return;
        }

        // Read the stream and convert it to ASII
        int bytes = s.Read(read, 0, read.Length);
        String Time = Encoding.ASCII.GetString(read);

        // Display the data
        Console.WriteLine("Received {0} bytes", bytes);
        Console.WriteLine("Current date and time is: {0}", Time);

        tcpc.Close();

        // Wait for user response to exit
        Console.WriteLine("Press Return to exit");
        Console.Read();
    }
}
