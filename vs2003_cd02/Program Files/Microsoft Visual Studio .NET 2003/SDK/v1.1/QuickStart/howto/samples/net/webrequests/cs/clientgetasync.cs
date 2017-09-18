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
using System.Threading;
using System.Text;
using System.IO;


// The RequestState class is used to pass data
// across async calls
public class RequestState
{
		const int BUFFER_SIZE = 1024;
		public StringBuilder RequestData;
		public byte[] BufferRead;
		public HttpWebRequest Request;
		public Stream ResponseStream;
		// Create Decoder for appropriate encoding type
		public Decoder StreamDecode = Encoding.UTF8.GetDecoder();

		public RequestState()
		{
			BufferRead = new byte[BUFFER_SIZE];
			RequestData = new StringBuilder("");
			Request = null;
			ResponseStream = null;
		}
}

// ClientGetAsync issues the async request
class ClientGetAsync
{
	public static ManualResetEvent allDone = new ManualResetEvent(false);
   	const int BUFFER_SIZE = 1024;

    public static void Main(string[] args)
    {

        if (args.Length < 1)
        {
            showusage();
            return;
        }

		// Get the URI from the command line
        Uri HttpSite = new Uri(args[0]);

		// Create the request object
        HttpWebRequest wreq = (HttpWebRequest) WebRequest.Create(HttpSite);

		// Create the state object
		RequestState rs = new RequestState();

		// Add the request into the state so it can be passed around
		rs.Request = wreq;

		// Issue the async request
        IAsyncResult r = (IAsyncResult) wreq.BeginGetResponse(new AsyncCallback(RespCallback), rs);

		// Set the ManualResetEvent to Wait so that the app
		// doesn't exit until after the callback is called
        allDone.WaitOne();
    }

    public static void showusage() {
        Console.WriteLine("Attempts to GET a URL");
        Console.WriteLine("\r\nUsage:");
        Console.WriteLine("ClientGetAsync URL");
        Console.WriteLine("Examples:");
        Console.WriteLine("ClientGetAsync http://www.microsoft.com/net/");
    }

    private static void RespCallback(IAsyncResult ar)
    {
    	// Get the RequestState object from the async result
		RequestState rs = (RequestState) ar.AsyncState;

    	// Get the HttpWebRequest from RequestState
        HttpWebRequest req = rs.Request;

    	// Calling EndGetResponse produces the HttpWebResponse object
    	// which came from the request issued above
        HttpWebResponse resp = (HttpWebResponse) req.EndGetResponse(ar);

    	// Now that we have the response, it is time to start reading
    	// data from the response stream
		Stream ResponseStream = resp.GetResponseStream();

    	// The read is also done using async so we'll want
    	// to store the stream in RequestState
		rs.ResponseStream = ResponseStream;

    	// Note that rs.BufferRead is passed in to BeginRead.  This is
    	// where the data will be read into.
		IAsyncResult iarRead = ResponseStream.BeginRead(rs.BufferRead, 0, BUFFER_SIZE, new AsyncCallback(ReadCallBack), rs);
    }


	private static void ReadCallBack(IAsyncResult asyncResult)
	{
		// Get the RequestState object from the asyncresult
		RequestState rs = (RequestState)asyncResult.AsyncState;

		// Pull out the ResponseStream that was set in RespCallback
		Stream responseStream = rs.ResponseStream;
		
		// At this point rs.BufferRead should have some data in it.
		// Read will tell us if there is any data there
		int read = responseStream.EndRead( asyncResult );

		if (read > 0)
		{
			// Prepare Char array buffer for converting to Unicode
			Char[] charBuffer = new Char[BUFFER_SIZE];
			
			// Convert byte stream to Char array and then String
			// len shows how many characters are converted to Unicode
			int len = rs.StreamDecode.GetChars( rs.BufferRead, 0, read, charBuffer, 0 );
			String str = new String( charBuffer, 0, len); 			

			// Append the recently read data to the RequestData stringbuilder object
			// contained in RequestState
			rs.RequestData.Append(str);
			

			// Now fire off another async call to read some more data
			// Note that this will continue to get called until
			// responseStream.EndRead returns -1
			IAsyncResult ar = responseStream.BeginRead( rs.BufferRead, 0, BUFFER_SIZE, new AsyncCallback(ReadCallBack), rs);
		}
		else
		{
			if(rs.RequestData.Length>1)
			{
				// All of the data has been read, so display it to the console
				string strContent;
				strContent = rs.RequestData.ToString();
				Console.WriteLine(strContent);
			}

			// Close down the response stream
			responseStream.Close();

			// Set the ManualResetEvent so the main thread can exit
			allDone.Set();
		}
		return;
	}
}
