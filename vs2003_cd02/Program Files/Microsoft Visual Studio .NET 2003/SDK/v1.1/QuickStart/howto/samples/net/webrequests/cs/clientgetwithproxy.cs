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

class ClientGETwithProxy {
    private static bool bShow;

    public static void Main(string[] args) {

        if (args.Length < 2) {
            showusage();
        } else {
            if (args.Length > 2)
                bShow = false;
            else
                bShow = true;

            getPage(args[0], args[1]);
        }

        Console.WriteLine();
        Console.WriteLine("Press Enter to continue...");
        Console.ReadLine();

        return;
    }

    public static void showusage() {
        Console.WriteLine("Attempts to GET a URL with a proxy");
        Console.WriteLine();
        Console.WriteLine("Usage:");
        Console.WriteLine("ClientGETwithProxy URL proxyname");
        Console.WriteLine();
        Console.WriteLine("Examples:");
        Console.WriteLine("ClientGETwithProxy http://www.microsoft.com/net/ myproxy");
    }

    public static void getPage(string url, string proxy) {
        try {
            WebProxy proxyObject = new WebProxy(proxy, 80);

            // Disable Proxy use when the host is local i.e. without periods.
            proxyObject.BypassProxyOnLocal = true;

            // Now actually take over the global with our new settings, all new requests
            // use this proxy info
            GlobalProxySelection.Select = proxyObject;

            WebRequest req = WebRequest.Create(url);
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
