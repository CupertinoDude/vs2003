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
using System.Runtime.InteropServices;

namespace TestClient 
{
    public class Test 
    {
        public static void Main() 
        {
            ExplorerLib.InternetExplorer explorer;
            ExplorerLib.IWebBrowserApp webBrowser;			
			
            explorer = new ExplorerLib.InternetExplorer();
            webBrowser = (ExplorerLib.IWebBrowserApp) explorer;
			
            webBrowser.Visible = true;
            webBrowser.GoHome();
			
            Console.WriteLine("Press Enter to quit");	
            String s = Console.ReadLine();	
					
            while (s != "") 
            {
                s = Console.ReadLine();
            }
            
            try 
            {
            	webBrowser.Quit();
            }
            catch(COMException)	
            {
            	Console.WriteLine("Explorer closed");
            }		
        }
    }
}


