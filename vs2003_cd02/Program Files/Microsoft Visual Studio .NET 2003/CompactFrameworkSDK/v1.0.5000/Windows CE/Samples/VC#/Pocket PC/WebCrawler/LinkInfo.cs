/*=====================================================================
  File:      LinkInfo.cs

  
  ---------------------------------------------------------------------
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
using System.Net;

namespace WebCrawler
{
	/// <summary>
	/// Class describing a link
	/// </summary>
	public class LinkInfo
	{
		/// <summary>
		/// The link's address (ex: http://www.microsoft.com)
		/// </summary>
        public readonly string LinkPath;
		
		/// <summary>
		/// HttpStatusCode received when we attempted to
        /// connect to the link
        /// NOTE: Other possible values
        ///  0 == no connection attempted
        /// -1 == generic failure
        /// -2 == link does not point to html data
		/// </summary>
        public HttpStatusCode StatusCode;
		
		/// <summary>
		/// 
		/// </summary>
		/// <param name="linkPath">
        /// The link's address
        /// </param>
		/// <param name="status">
        /// Status code from connection attempt
        /// </param>
		public LinkInfo(string linkPath,
		                HttpStatusCode status)
		{
		    this.LinkPath = linkPath;
		    this.StatusCode = status;		
		}
	}
}
