/*=====================================================================

  File:      FileServerSink.cs

---------------------------------------------------------------------
This file is part of the Microsoft .NET Framework SDK Code Samples.

  Copyright (C) Microsoft Corporation.  All rights reserved.

This source code is intended only as a supplement to Microsoft
Development Tools and/or on-line documentation.  See these other
materials for detailed information regarding Microsoft code samples.
 
THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
PARTICULAR PURPOSE.
=====================================================================*/

using System;
using System.Collections;
using System.Globalization;
using System.IO;
using System.Reflection;
using System.Runtime.Remoting;
using System.Runtime.Remoting.Channels;
using System.Runtime.Remoting.Channels.Http;
using System.Runtime.Remoting.Messaging;


namespace FileServer
{

    public class FileServerChannelSinkProvider : IServerChannelSinkProvider
    {
        private IServerChannelSinkProvider _next = null;
   
        private String _rootDirectory = null; // root of where files should be shared from


        public FileServerChannelSinkProvider()
        {
        } // FileServerChannelSinkProvider

        public FileServerChannelSinkProvider(IDictionary properties, ICollection providerData)
        {
            foreach (DictionaryEntry entry in properties)
            {
                switch (((String)entry.Key).ToLower(CultureInfo.InvariantCulture))
                {
                case "root": _rootDirectory = (new DirectoryInfo((String)entry.Value)).FullName; break;
                }
            }
        } // FileServerChannelSinkProvider

        public void GetChannelData(IChannelDataStore channelData)
        {
        }

        public IServerChannelSink CreateSink(IChannelReceiver channel)
        {
            if (_rootDirectory == null)
                _rootDirectory = new DirectoryInfo("root").FullName;
            Console.WriteLine(_rootDirectory);

            IServerChannelSink nextSink = null;
            if (_next != null)
                nextSink = _next.CreateSink(channel);

            FileServerChannelSink fileServer = new FileServerChannelSink(_rootDirectory, nextSink);

            // Set up extensions
            IDictionary extensionMap = fileServer.FileExtensionToContentTypeMap;
            extensionMap[".txt"] = "text/plain";
            extensionMap[".htm"] = "text/html";
            extensionMap[".html"] = "text/html";
            extensionMap[".xml"] = "text/xml";
            extensionMap[".jpg"] = "image/jpeg";
            extensionMap[".jpeg"] = "image/jpeg";
            extensionMap[".gif"] = "image/gif";

            return fileServer;
        }

        public IServerChannelSinkProvider Next
        {
            get { return _next; }
            set { _next = value; }
        }
    } // class FileServerChannelSinkProvider

    
    internal class FileServerChannelSink : BaseChannelSinkWithProperties, IServerChannelSink
    {
        private IServerChannelSink _nextSink = null;

        // Settings
        private String _appName;
        private String _rootDirectory;
        private Hashtable _fileExtensionToContentTypeMap;

    
        public FileServerChannelSink(String rootDirectory, IServerChannelSink nextSink) : base()
        {
            _nextSink = nextSink;

            _appName = RemotingConfiguration.ApplicationName.ToLower(CultureInfo.InvariantCulture);
            if ((_appName != null) && (_appName.Length == 0))            
                _appName = null;                        
            else
                _appName = _appName + "/";

            _rootDirectory = rootDirectory;
            _fileExtensionToContentTypeMap = new Hashtable(CaseInsensitiveHashCodeProvider.Default, CaseInsensitiveComparer.Default);
        } // LoggingServerChannelSink


        public ServerProcessing ProcessMessage(IServerChannelSinkStack sinkStack,
                                               IMessage requestMsg,
                                               ITransportHeaders requestHeaders, Stream requestStream,
                                               out IMessage responseMsg, out ITransportHeaders responseHeaders,
                                               out Stream responseStream)
        {
            if (requestMsg != null)
            {
                // The message has already been deserialized so delegate to the next sink.
                return _nextSink.ProcessMessage(
                    sinkStack,
                    requestMsg, requestHeaders, requestStream, 
                    out responseMsg, out responseHeaders, out responseStream);
            }

            // check to make sure the verb is GET
            String verb = (String)requestHeaders["__RequestVerb"];        
            if (!verb.Equals("GET"))
            {
                // This is not a resource request, so delegate to the next sink
                return _nextSink.ProcessMessage(
                    sinkStack,
                    requestMsg, requestHeaders, requestStream, 
                    out responseMsg, out responseHeaders, out responseStream);
            }

            String requestUri = (String)requestHeaders[CommonTransportKeys.RequestUri];
            String objectUri = GetObjectUriFromRequestUri(requestUri).ToLower(CultureInfo.InvariantCulture);
                
            FileInfo fileInfo = null;
                   
            if ((_appName == null) || objectUri.StartsWith(_appName))
            {
                if (_appName != null)
                    objectUri = objectUri.Substring(_appName.Length);                   
                fileInfo = new FileInfo(_rootDirectory + "\\" + objectUri);
            }

            if ((fileInfo != null) &&
                fileInfo.Exists && fileInfo.DirectoryName.StartsWith(_rootDirectory))
            {
                // determine content-type
                String contentType = (String)_fileExtensionToContentTypeMap[fileInfo.Extension];
                if (contentType == null)
                    contentType = "application/octet-stream";

                responseHeaders = new TransportHeaders();
                responseHeaders["Content-Type"] = contentType;  
                responseStream = fileInfo.OpenRead();            
                responseMsg = null;   
                return ServerProcessing.Complete;
            }
            else
            {
                responseHeaders = new TransportHeaders();
                responseHeaders["__HttpStatusCode"] = "404";
                responseHeaders["__HttpReasonPhrase"] = "File not found.";
                responseStream = null;
                responseMsg = null;
                return ServerProcessing.Complete;  
            }            
   
        } // ProcessMessage


        public void AsyncProcessResponse(IServerResponseChannelSinkStack sinkStack, Object state,
                                        IMessage msg, ITransportHeaders headers, Stream stream)
        {
             // We never push ourselves to the stack, so we don't need to implement this.
        } // AsyncProcessResponse


        public Stream GetResponseStream(IServerResponseChannelSinkStack sinkStack, Object state,
                                        IMessage msg, ITransportHeaders headers)
        {
            // We never push ourselves to the stack, so we don't need to implement this.
            throw new NotSupportedException();
        } // GetResponseStream


        public IServerChannelSink NextChannelSink
        {
            get { return _nextSink; }
        }

        
        private static String GetObjectUriFromRequestUri(String uri)
        {
            int start, end; // range of characters to use
            int index;
            start = 0;
            end = uri.Length;

            const String http = "http://";
            const String https = "https://";

            // first see if uri starts with http:// or http:// and remove up to next slash if it does
            bool domainPresent = false; // do we need to get rid of domain name?
            if (String.Compare(uri, 0, http, 0, http.Length, true,CultureInfo.InvariantCulture) == 0)
            {
                start = http.Length;
                domainPresent = true;
            }
            else
            if (String.Compare(uri, 0, https, 0, https.Length, true,CultureInfo.InvariantCulture) == 0)
            {
                start = https.Length;
                domainPresent = true;
            }

            if (domainPresent)
            {
                index = uri.IndexOf('/', start);
                if (index != -1)
                    start = index + 1;
                else
                    start = end; // uri will end up being ""
            }
            else // remove "/" if this is an absolute path
            if (uri[start] == '/')
                start++;

            // remove query string if present ('?' and everything past it)
            index = uri.IndexOf('?');
            if (index != -1)
                end = index;

            if (start < end)
                return uri.Substring(start, end - start);
            else
                return "";
        } // GetObjectURIFromRequestURI


        //
        // Properties support
        //

        public override Object this[Object key]
        {
            get
            {
                if (key == typeof(FileServerSinkKey))                                
                    return this;
            
                return null;
            }

            set
            {
            }
        }
 
        public override ICollection Keys
        {
            get
            {
                ArrayList keys = new ArrayList(1);
                keys.Add(typeof(FileServerSinkKey));

                return keys;
            }
        }

        //
        // end of Properties support
        // 


        public IDictionary FileExtensionToContentTypeMap
        {
            get { return _fileExtensionToContentTypeMap; }
        }
        


    } // class FileServerChannelSink



    // The type of this class is used as the key to get the ILoggingSink interface
    // to one of the logging sinks.
    public class FileServerSinkKey
    {
    }

    

} // namespace FileServer
