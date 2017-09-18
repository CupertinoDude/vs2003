/*=====================================================================

  File:      IPFilterSink.cs

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


/*

Accept/Reject Mode
------------------
The IP filter sink may be set up to be in accept or reject mode.
In accept mode, the sink will only accept requests from ip addresses
that matches one of the filters. In reject mode, the sink will reject
requests from any ip address that matches one of the filters.

Filters
-------
A filter consists of a mask and an ip address. An incoming ip address
is said to match the filter if it equals the filter ip address when
it is bitwise and'ed together with the filter mask.
Example: If the filter mask is 255.255.0.0 and the filter ip address
is 192.168.0.0. Then, all ip addresses of the form 192.168.X.Y will
match this filter.
Note: It is an error to specify a filter ip address that is more specific
than the mask. In other words, the filter ip address and'ed together
with the mask must equal 0.0.0.0.

NOTE: this sample only works with IPv4; it fails if IPv6 is enabled.
For this reason it will throw warnings during compilation in version 1.1
of the .NET Framework.
*/


using System;
using System.IO;
using System.Collections;
using System.Net;
using System.Reflection;
using System.Runtime.Remoting.Channels;
using System.Runtime.Remoting.Channels.Http;
using System.Runtime.Remoting.Messaging;



namespace IPFilter
{

    public class IPFilterChannelSinkProvider : IServerChannelSinkProvider
    {
        private IServerChannelSinkProvider _next;

        private bool _acceptMode = true;
        private ICollection _providerData = null; 


        public IPFilterChannelSinkProvider()
        {
        }

        public IPFilterChannelSinkProvider(IDictionary properties, ICollection providerData)
        {        
            String mode = (String)properties["mode"];
            if (String.Compare(mode, "accept", true) == 0)
                _acceptMode = true;
            else
            if (String.Compare(mode, "reject", true) == 0)
                _acceptMode = false;

            _providerData = providerData;
        }


        public void GetChannelData(IChannelDataStore localChannelData)
        {
        }
   
        public IServerChannelSink CreateSink(IChannelReceiver channel)
        {
            IServerChannelSink nextSink = null;
            if (_next != null)
                nextSink = _next.CreateSink(channel);

            IPFilterChannelSink sink = new IPFilterChannelSink(_acceptMode, nextSink);

            // add filters
            foreach (SinkProviderData data in _providerData)
            {                
                String maskStr = (String)data.Properties["mask"];
                String ipStr = (String)data.Properties["ip"];
                String machineStr = (String)data.Properties["machine"];
                
                IPAddress mask = null;
                IPAddress ip = null;

                if (ipStr != null)
                {
                    mask = IPAddress.Parse(maskStr);
                    ip = IPAddress.Parse(ipStr);
                }
                else
                {
                    mask = IPAddress.Parse("255.255.255.255");
                    ip = Dns.Resolve(machineStr).AddressList[0];
                }
                
                sink.AddFilter(mask, ip);
            }

            return sink;
        }

        public IServerChannelSinkProvider Next
        {
            get { return _next; }
            set { _next = value; }
        }

        public FilterMode Mode
        {
            get { return (_acceptMode ? FilterMode.Accept : FilterMode.Reject); }
            set { _acceptMode = (value == FilterMode.Accept); }
        }

    } // class IPFilterChannelSinkProvider

   
    

    public class IPFilterChannelSink : BaseChannelSinkWithProperties, IServerChannelSink,
                                       IFilterSink
    {
        private IServerChannelSink _nextSink;

        private bool _bAccept; // Is this an accept filter or a reject filter?
                               //   An accept filter only allows calls to pass through from matching ip addresses.
                               //   A reject filter only rejects calls from matching ip addresses.

        private ArrayList _filterSet;         // list of filters to filter with

        private class Filter : IFilter
        {
            private long _mask;
            private long _ipAddr;

            private IPAddress _maskObject;
            private IPAddress _ipAddrObject;

            public Filter(IPAddress mask, IPAddress ipAddress)
            {
                _maskObject = mask;
                _ipAddrObject = ipAddress;

                _mask = mask.Address;
                _ipAddr = ipAddress.Address;

                if ((~_mask & _ipAddr) != 0)
                {
                    throw new Exception("Unable to create filter: IP address (" +
                        ipAddress.ToString() + ") cannot be more specific than mask (" +
                        mask.ToString() + ")");
                }
            }

            public bool MatchIPAddress(long ipToMatch)
            {
                return (_mask & ipToMatch) == _ipAddr;
            } // MatchIPAddress

            //
            // IFilter implementation
            //

            public IPAddress Mask { get { return _maskObject; } }
            public IPAddress IP   { get { return _ipAddrObject; } }

            //
            // end of IFilter implementation
            //
        }
      
    
        public IPFilterChannelSink(bool acceptMode, IServerChannelSink nextSink) : base()
        {
            _filterSet = new ArrayList();
            _nextSink = nextSink;

            _bAccept = acceptMode;
        } // IPFilterChannelSink


        public void AddFilter(IPAddress mask, IPAddress ipAddress)
        {
            Filter f = new Filter(mask, ipAddress);
            _filterSet.Add(f);
        }


        public ServerProcessing ProcessMessage(IServerChannelSinkStack sinkStack,
            IMessage requestMsg,
            ITransportHeaders requestHeaders, Stream requestStream,
            out IMessage responseMsg, out ITransportHeaders responseHeaders, 
            out Stream responseStream)
        {
            IPAddress ipAddress = requestHeaders[CommonTransportKeys.IPAddress] as IPAddress;
            Console.WriteLine(ipAddress);

            bool accept = !MatchIPAddress(ipAddress) ^ _bAccept;

            if (accept)
            {                
                return _nextSink.ProcessMessage(sinkStack, requestMsg, requestHeaders, requestStream,
                                                out responseMsg, out responseHeaders, out responseStream);
            }
            else
            {
                responseHeaders = new TransportHeaders();
                responseHeaders["__HttpStatusCode"] = "403";
                responseHeaders["__HttpReasonPhrase"] = "Forbidden";
                Console.WriteLine("Reject.");

                responseMsg = null;
                responseStream = null;

                return ServerProcessing.Complete;
            }                                       
        } // ProcessMessage


        public void AsyncProcessResponse(IServerResponseChannelSinkStack sinkStack, Object state,
                                         IMessage msg, ITransportHeaders headers, Stream stream)
        {
            // We don't need to implement this because we never push ourselves to the sink
            //   stack.
        } // AsyncProcessResponse


        public Stream GetResponseStream(IServerResponseChannelSinkStack sinkStack, Object state,
                                        IMessage msg, ITransportHeaders headers)
        {
            // We don't need to implement this because we never push ourselves
            //   to the sink stack.
            return null;
        } // GetResponseStream    


        public IServerChannelSink NextChannelSink
        {
            get { return _nextSink; }
        }

        
        
        // match ip address against all filters in the filter set
        private bool MatchIPAddress(IPAddress ipAddr)
        {
            long ip = ipAddr.Address;
            
            foreach (Filter f in _filterSet)
            {
                if (f.MatchIPAddress(ip))
                    return true;
            }

            return false;
        } // MatchIPAddress


        //
        // IFilterSink implementation
        //

        public FilterMode Mode 
        {
            get { return (_bAccept ? FilterMode.Accept : FilterMode.Reject); }
        }

        public ICollection Filters { get { return _filterSet; } }

        //
        // end of IFilterSink implementation
        //

        //
        // Properties support
        //
 
        public override Object this[Object key]
        {   
            get
            {
                if (key == typeof(FilterSinkKey))            
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
                keys.Add(typeof(FilterSinkKey));

                return keys;
            }
        }

        //
        // end of Properties support
        // 


    } // class IPFilterChannelSink


    
    public enum FilterMode
    {
        Accept,
        Reject
    }


    public interface IFilter
    {
        IPAddress Mask { get; }
        IPAddress IP { get; }
    } // interface IFilter


    public interface IFilterSink
    {
        FilterMode  Mode { get; }
        ICollection Filters { get; }
    }


    // The type of this class is used as the key to get the IFilterSink interface
    // to one of the logging sinks.
    public class FilterSinkKey
    {
    }


} // namespace IPFilter


