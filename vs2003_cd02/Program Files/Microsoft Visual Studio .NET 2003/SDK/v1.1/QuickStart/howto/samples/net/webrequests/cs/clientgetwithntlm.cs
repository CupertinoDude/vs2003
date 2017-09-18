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
using System.IO;
using System.Text;

class ClientGETwithNTLM {
    private static bool bShow;

    public static void Main(string[] args) {

        if (args.Length < 4) {
            showusage();
        } else {
            if (args.Length > 4)
                bShow = false;
            else
                bShow = true;

            getPage(args[0], args[1], args[2], args[3]);
        }

        Console.WriteLine();
        Console.WriteLine("Press Enter to continue...");
        Console.ReadLine();

        return;
    }

    public static void showusage() {
        Console.WriteLine("Attempts to GET a URL with NTLM authentication");
        Console.WriteLine("\r\nUsage:");
        Console.WriteLine("ClientGETwithNTLM URL username password domain");
        Console.WriteLine("Examples:");
        Console.WriteLine("ClientGETwithNTLM http://www.microsoft.com/net/ Bobby BobbyLovesMangos THEDOMAIN");
    }

    public static void getPage(String url, String username, String password, String Domain) {
        try {
            WebRequest req = WebRequest.Create(url);
            NetworkCredential sc = new NetworkCredential(username, password, Domain);
            req.Credentials = sc;
            WebResponse result = req.GetResponse();
            Stream ReceiveStream = result.GetResponseStream();
        	Encoding encode = System.Text.Encoding.GetEncoding("utf-8");
        	StreamReader sr = new StreamReader( ReceiveStream, encode );
            Console.WriteLine("\r\nResponse stream received");
            if (bShow) {
                Char[] read = new Char[256];
        	    int count = sr.Read( read, 0, 256 );

                Console.WriteLine("HTML...\r\n");
                while (count > 0) {
    		        String str = new String(read, 0, count);
                    Console.Write(str);
                    count = sr.Read(read, 0, 256);
                }
                Console.WriteLine("");
            }
        } catch(Exception) {
            Console.WriteLine("\r\nThe request URI could not be found or was malformed");
        }
    }
}
