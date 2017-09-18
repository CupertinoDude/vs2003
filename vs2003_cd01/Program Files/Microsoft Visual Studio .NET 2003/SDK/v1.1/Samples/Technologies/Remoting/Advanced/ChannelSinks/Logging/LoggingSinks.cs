/*=====================================================================

  File:      LoggingSink.cs

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
using System.IO;
using System.Reflection;
using System.Runtime.Remoting.Channels;
using System.Runtime.Remoting.Channels.Http;
using System.Runtime.Remoting.Messaging;
using System.Runtime.Remoting.Metadata;

namespace Logging
{ 
    

     public class LoggingClientChannelSinkProvider : IClientChannelSinkProvider
     {
        private IClientChannelSinkProvider _next = null;
   
        
        public LoggingClientChannelSinkProvider()
        {
        }

        public LoggingClientChannelSinkProvider(IDictionary properties, ICollection providerData)
        {
        }


        public IClientChannelSink CreateSink(IChannelSender channel, String url, 
                                             Object remoteChannelData)
        {
            IClientChannelSink nextSink = null;
            if (_next != null)
            {
                nextSink = _next.CreateSink(channel, url, remoteChannelData);
                if (nextSink == null)
                    return null;
            }

            return new LoggingClientChannelSink(nextSink);
        }

        public IClientChannelSinkProvider Next
        {
            get { return _next; }
            set { _next = value; }
        }
    } // class LoggingClientChannelSinkProvider




    internal class LoggingClientChannelSink : BaseChannelObjectWithProperties, IClientChannelSink,
                                              ILoggingSink
    {
        private IClientChannelSink _nextSink = null;

        private bool       _bEnabled = true;
        private TextWriter _output = Console.Out;
    

        public LoggingClientChannelSink(IClientChannelSink nextSink) : base()
        {
            _nextSink = nextSink;
        } // LoggingClientChannelSink

        public LoggingClientChannelSink(IChannelSender channel, String url, Object remoteChannelData,
                                        IClientChannelSink nextSink) : base()
        {
            _nextSink = nextSink;
        } // LoggingClientChannelSink


        public void ProcessMessage(IMessage msg,
                                   ITransportHeaders requestHeaders, Stream requestStream,
                                   out ITransportHeaders responseHeaders, out Stream responseStream)
        {
            if (_bEnabled)
                LoggingHelper.PrintRequest(_output, requestHeaders, ref requestStream);

            _nextSink.ProcessMessage(msg, requestHeaders, requestStream,
                                     out responseHeaders, out responseStream);

            if (_bEnabled)
                LoggingHelper.PrintResponse(_output, responseHeaders, ref responseStream);
        } // ProcessMessage

       
        public void AsyncProcessRequest(IClientChannelSinkStack sinkStack, IMessage msg,
                                        ITransportHeaders headers, Stream stream)
        {
            if (_bEnabled)
                LoggingHelper.PrintRequest(_output, headers, ref stream);

            // never gets called, this sink is always first
            sinkStack.Push(this, null);
            _nextSink.AsyncProcessRequest(sinkStack, msg, headers, stream);
        } // AsyncProcessRequest


        public void AsyncProcessResponse(IClientResponseChannelSinkStack sinkStack, Object state,
                                         ITransportHeaders headers, Stream stream)
        {
             if (_bEnabled)
                 LoggingHelper.PrintResponse(_output, headers, ref stream);
             sinkStack.AsyncProcessResponse(headers, stream);
        } // AsyncProcessResponse


        public Stream GetRequestStream(IMessage msg, ITransportHeaders headers)
        {
            // we always want a stream to read from
            return null;
        }


        public IClientChannelSink NextChannelSink
        {
            get { return _nextSink; }
        }


        public bool Enabled
        {
            get { return _bEnabled; }
            set { _bEnabled = value; }
        } // Enabled


        public TextWriter Out
        {
            set { _output = value; }
        } // Out


        //
        // Properties support
        //
 
        public override Object this[Object key]
        {
            get
            {
                if (key == typeof(LoggingSinkKey))
                    return this;
                
                return null;
            }

            set
            {
                throw new NotSupportedException();
            }
        }

        public override ICollection Keys
        {
            get
            {
                ArrayList keys = new ArrayList(1);
                keys.Add(typeof(LoggingSinkKey));
                return keys;
            }
        }

        //
        // end of Properties support
        // 

        
    } // class LoggingClientChannelSink
    


    public class LoggingServerChannelSinkProvider : IServerChannelSinkProvider
    {
        private IServerChannelSinkProvider _next = null;
   
        
        public LoggingServerChannelSinkProvider()
        {
        }

        public LoggingServerChannelSinkProvider(IDictionary properties, ICollection providerData)
        {
        }

        public void GetChannelData(IChannelDataStore channelData)
        {
        }

        public IServerChannelSink CreateSink(IChannelReceiver channel)
        {
            IServerChannelSink nextSink = null;
            if (_next != null)
                nextSink = _next.CreateSink(channel);
            return new LoggingServerChannelSink(nextSink);
        }

        public IServerChannelSinkProvider Next
        {
            get { return _next; }
            set { _next = value; }
        }
    } // class LoggingServerChannelSinkProvider

    
    internal class LoggingServerChannelSink : BaseChannelObjectWithProperties, IServerChannelSink,
                                              ILoggingSink
    {
        private IServerChannelSink _nextSink = null;
        
        private bool       _bEnabled = true;
        private TextWriter _output = Console.Out;

    
        public LoggingServerChannelSink(IServerChannelSink nextSink) : base()
        {
            _nextSink = nextSink;
        } // LoggingServerChannelSink


        public LoggingServerChannelSink(IChannelReceiver channel, 
                                        IServerChannelSink nextSink) : base()
        {
            _nextSink = nextSink;
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

            if (_bEnabled)
                LoggingHelper.PrintRequest(_output, requestHeaders, ref requestStream);

            sinkStack.Push(this, null);
            ServerProcessing processing =
                _nextSink.ProcessMessage(sinkStack, null, requestHeaders, requestStream, out responseMsg,
                                         out responseHeaders, out responseStream);

            switch (processing)
            {

            case ServerProcessing.Complete:
            {
                sinkStack.Pop(this);
                if (_bEnabled)
                    LoggingHelper.PrintResponse(_output, responseHeaders, ref responseStream);
                break;
            }

            case ServerProcessing.OneWay:
            {
                sinkStack.Pop(this);
                break;
            }

            case ServerProcessing.Async:
            {
                sinkStack.Store(this, null);
                break;
            }

            } // switch (processing)

            return processing;
        } // ProcessMessage


        public void AsyncProcessResponse(IServerResponseChannelSinkStack sinkStack, Object state,
                                        IMessage msg, ITransportHeaders headers, Stream stream)
        {
             if (_bEnabled)
                 LoggingHelper.PrintResponse(_output, headers, ref stream);
             sinkStack.AsyncProcessResponse(msg, headers, stream);
        } // AsyncProcessResponse


        public Stream GetResponseStream(IServerResponseChannelSinkStack sinkStack, Object state,
                                        IMessage msg, ITransportHeaders headers)
        {
            // we always want a stream to read from 
            return null;
        } // GetResponseStream


        public IServerChannelSink NextChannelSink
        {
            get { return _nextSink; }
        }



        public bool Enabled
        {
            get { return _bEnabled; }
            set { _bEnabled = value; }
        } // Enabled


        public TextWriter Out
        {
            set { _output = value; }
        } // Out

        
        //
        // Properties support
        //
 
        public override Object this[Object key]
        {
            get
            {
                if (key == typeof(LoggingSinkKey))
                    return this;
                
                return null;
            }

            set
            {
                throw new NotSupportedException();
            }
        }

        public override ICollection Keys
        {
            get
            {
                ArrayList keys = new ArrayList(1);
                keys.Add(typeof(LoggingSinkKey));
                return keys;
            }
        }
        //
        // end of Properties support
        // 


    } // class LoggingServerChannelSink



    internal class LoggingHelper
    {

        internal static void PrintRequest(TextWriter output,
                                          ITransportHeaders requestHeaders, ref Stream requestStream)
        {
            output.WriteLine("----------Request Headers-----------");
            PrintHeaders(output, requestHeaders);

            // print request message
            String contentType = requestHeaders["Content-Type"] as String;
            if ((contentType != null) && contentType.StartsWith("text"))
            {
                output.WriteLine("----------Request Message-----------");
                PrintStream(output, ref requestStream);
                output.WriteLine("------End of Request Message--------");
            }   
            output.Flush();
        } // PrintRequest


        internal static void PrintResponse(TextWriter output,
                                           ITransportHeaders responseHeaders, ref Stream responseStream)
        {            
            output.WriteLine("----------Response Headers----------");
            PrintHeaders(output, responseHeaders);

            // print response message
            String contentType = responseHeaders["Content-Type"] as String;
            if ((contentType != null) && contentType.StartsWith("text"))
            {
                output.WriteLine("----------Response Message----------");
                PrintStream(output, ref responseStream); 
                output.WriteLine("------End of Response Message-------");
            }
            output.Flush();
        } // PrintResponse


        private static void PrintHeaders(TextWriter output, ITransportHeaders headers)
        {
            foreach (DictionaryEntry header in headers)
            {
                output.WriteLine(header.Key + ": " + header.Value);   
            }
        } // PrintHeaders


        private static void PrintStream(TextWriter output, ref Stream stream)
        {
            // If we can't reset the stream's position after printing its content,
            //   we must make a copy.
            if (!stream.CanSeek)
                stream = CopyStream(stream);


            long startPosition = stream.Position;

            StreamReader sr = new StreamReader(stream);
            String line;
            while ((line = sr.ReadLine()) != null)
            {
                output.WriteLine(line);
            }

            stream.Position = startPosition;
        } // PrintStream
    

        private static Stream CopyStream(Stream stream)
        {
            Stream streamCopy = new MemoryStream();

            const int bufferSize = 1024;
            byte[] buffer = new byte[bufferSize];

            int readCount;
            do
            {
                readCount = stream.Read(buffer, 0, bufferSize);
                if (readCount > 0)
                    streamCopy.Write(buffer, 0, readCount);
            } while (readCount > 0);
            
            // close original stream
            stream.Close();

            streamCopy.Position = 0;
            return streamCopy;
        } // CopyStream  

    } // class LoggingHelper



    public interface ILoggingSink
    {
        bool Enabled { get; set; }

        TextWriter Out { set; }
    } // interface ILoggingSink
  

    // The type of this class is used as the key to get the ILoggingSink interface
    // to one of the logging sinks.
    public class LoggingSinkKey
    {
    }

    

} // namespace Logging
