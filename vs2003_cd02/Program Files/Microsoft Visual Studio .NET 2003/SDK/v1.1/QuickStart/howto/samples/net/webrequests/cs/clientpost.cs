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
using System.Web;

class ClientPOST {
    public static void Main(string[] args) {

        if (args.Length < 1) {
            showusage();
        } else {
            if (args.Length < 2 ) {
                getPage(args[0], "s1=food&s2=bart");
            } else {
                getPage(args[0], args[1]);
            }
        }

        Console.WriteLine();
        Console.WriteLine("Press any key to continue...");
        Console.ReadLine();

        return;
    }

    public static void showusage() {
        Console.WriteLine("Attempts to POST into to a URL");
        Console.WriteLine();
        Console.WriteLine("Usage:");
        Console.WriteLine("ClientPOST URL [postdata]");
        Console.WriteLine();
        Console.WriteLine("Examples:");
        Console.WriteLine("ClientPOST http://www.microsoft.com s1=food&s2=bart");
    }

    public static void getPage(String url, String payload) {
        WebResponse result = null;

        try {

            WebRequest req = WebRequest.Create(url);
            req.Method = "POST";
            req.ContentType = "application/x-www-form-urlencoded";
	    StringBuilder UrlEncoded = new StringBuilder();
	    Char[] reserved = {'?', '=', '&'};
	    byte[] SomeBytes = null;

	    if (payload != null) {
		int i=0, j;
		while(i<payload.Length){
		    j=payload.IndexOfAny(reserved, i);
		    if (j==-1){
			UrlEncoded.Append(HttpUtility.UrlEncode(payload.Substring(i, payload.Length-i)));
			break;
		    }
		    UrlEncoded.Append(HttpUtility.UrlEncode(payload.Substring(i, j-i)));
		    UrlEncoded.Append(payload.Substring(j,1));
		    i = j+1;
		}
		SomeBytes = Encoding.UTF8.GetBytes(UrlEncoded.ToString());
                req.ContentLength = SomeBytes.Length;
                Stream newStream = req.GetRequestStream();
		newStream.Write(SomeBytes, 0, SomeBytes.Length);
                newStream.Close();
            } else {
                req.ContentLength = 0;
            }


            result = req.GetResponse();
            Stream ReceiveStream = result.GetResponseStream();
        	Encoding encode = System.Text.Encoding.GetEncoding("utf-8");
        	StreamReader sr = new StreamReader( ReceiveStream, encode );
            Console.WriteLine("\r\nResponse stream received");
            Char[] read = new Char[256];
    	    int count = sr.Read( read, 0, 256 );
            Console.WriteLine("HTML...\r\n");
            while (count > 0) {
		        String str = new String(read, 0, count);
                Console.Write(str);
                count = sr.Read(read, 0, 256);
            }
            Console.WriteLine("");
        } catch(Exception e) {
	        Console.WriteLine( e.ToString());
            Console.WriteLine("\r\nThe request URI could not be found or was malformed");
        } finally {
            if ( result != null ) {
                result.Close();
            }
        }
    }
}
