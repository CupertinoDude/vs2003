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

public class ClientWebException {
    public static void Main(string[] args) {
        bool ResolvedUri = false;
        String UriToResolve = null;

        while ( !ResolvedUri ) {
            try {
                //Get a uri from the user
                Console.Write("Please enter the uri to resolve: ");
                UriToResolve = Console.ReadLine();
                Console.WriteLine();

                //Create the request object
                WebRequest request = WebRequest.Create(UriToResolve);

                request.Credentials = new NetworkCredential("invaliduser", "invalidpassword");

                //Create the response object
                WebResponse response = request.GetResponse();
                Console.WriteLine("URI Resolved");

                //Successfully resolved the Uri
                ResolvedUri = true;

                //Get a readable stream from the server
                Stream ReceiveStream = response.GetResponseStream();
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

            } catch (WebException WebExcp) {
                // If you get to this point, the exception has been caught
                Console.WriteLine("A WebException has been caught!");

                // Write out the Exception message
                Console.WriteLine(WebExcp.ToString());

                // Get the WebException status code
                if (WebExcp.Status == WebExceptionStatus.ProtocolError) // 7 indicates a protocol error, thus a WebResonse object should exist
                {
                    // Write out the WebResponse protocol status
                    Console.WriteLine("There was an error retrieving the URI");
                }
            } catch (UriFormatException UriExcp) {
                // If you get to this point, the exception has been caught
                Console.WriteLine("A UriFormatException has been caught!");

                // Write out the Exception message
                Console.WriteLine(UriExcp.ToString());
            } catch (Exception exc) {
                Console.WriteLine(exc.ToString());
            }
        }

        Console.WriteLine();
        Console.WriteLine("Press Enter to continue...");
        Console.ReadLine();
    }
}
