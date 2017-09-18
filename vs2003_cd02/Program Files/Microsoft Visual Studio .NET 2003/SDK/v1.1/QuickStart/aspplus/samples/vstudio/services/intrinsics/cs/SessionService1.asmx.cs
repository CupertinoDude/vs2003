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

using System.Reflection;

[assembly: AssemblyTitle("")]
[assembly: AssemblyDescription("A QuickStart Tutorial Assembly")]
[assembly: AssemblyConfiguration("")]
[assembly: AssemblyCompany("Microsoft Corporation")]
[assembly: AssemblyProduct("Microsoft QuickStart Tutorials")]
[assembly: AssemblyCopyright(" Microsoft Corporation.  All rights reserved.")]
[assembly: AssemblyTrademark("")]
[assembly: AssemblyCulture("")]
[assembly: AssemblyVersion("1.1.*")]

namespace Intrinsics.Cs
{
    using System;
    using System.Collections;
    using System.ComponentModel;
    using System.Data;
    using System.Web;
    using System.Web.Services;

    /// <summary>
    ///    Summary description for SessionService1.
    /// </summary>
    public class SessionService1 : System.Web.Services.WebService
    {
        public SessionService1()
        {
            //CODEGEN: This call is required by the XML Web services created using ASP.NET Designer
            InitializeComponent();
        }

        /// <summary>
        ///    Required method for Designer support - do not modify
        ///    the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
        }

        /// <summary>
        ///    Clean up any resources being used.
        /// </summary>
        protected override void Dispose(bool disposing)
        {
        }

		[ WebMethod(EnableSession=true) ]
		public String UpdateHitCounter()
		{

			if (Session["HitCounter"] == null)
			{
				Session["HitCounter"] = 1;
			}
			else
			{
				Session["HitCounter"] = ((int) Session["HitCounter"]) + 1;
			}

			return "You have accessed this service " + Session["HitCounter"].ToString() + " times.";
		}

		[ WebMethod(EnableSession=false)]
		public String UpdateAppCounter()
		{

			if (Application["HitCounter"] == null)
			{
				Application["HitCounter"] = 1;
			}
			else
			{
				Application["HitCounter"] = ((int) Application["HitCounter"]) + 1;
			}

			return "This service has been accessed " + Application["HitCounter"].ToString() + " times.";
		}
	}
}
