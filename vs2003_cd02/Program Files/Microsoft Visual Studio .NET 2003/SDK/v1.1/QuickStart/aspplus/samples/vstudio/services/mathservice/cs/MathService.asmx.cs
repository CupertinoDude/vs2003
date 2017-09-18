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

namespace Services.MathService.Cs
{
    using System;
    using System.Web.Services;

    /// <summary>
    ///    A simple XML web service.
    /// </summary>
    public class MathService : System.Web.Services.WebService
    {
        public MathService()
        {
            //CODEGEN: This call is required by the XML Web Services created using ASP.NET Designer
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

        [WebMethod]
        public float Add(float a, float b)
        {
            return a + b;
        }

        [WebMethod]
        public float Subtract(float a, float b)
        {
            return a - b;
        }

        [WebMethod]
        public float Multiply(float a, float b)
        {
            return a * b;
        }

        [WebMethod]
        public float Divide(float a, float b)
        {
            if (b==0) return -1;
            return a / b;
        }
    }
}
