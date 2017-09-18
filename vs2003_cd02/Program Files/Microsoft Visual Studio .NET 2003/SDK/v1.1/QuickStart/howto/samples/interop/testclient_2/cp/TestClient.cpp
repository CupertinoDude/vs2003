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

#using <mscorlib.dll>
using namespace System;
using namespace System::Runtime::InteropServices;
#using <ExplorerLib.dll>

__gc struct S{
static void OnTitleChange(String * text)
{
   Console::WriteLine(S"Title changes to {0}", text);
}
};

void main()
{
   ExplorerLib::InternetExplorer * explorer = new ExplorerLib::InternetExplorerClass;
   ExplorerLib::IWebBrowserApp * webBrowser = __try_cast<ExplorerLib::IWebBrowserApp *>(explorer);
            
   //Title Change event
   ExplorerLib::DWebBrowserEvents2_TitleChangeEventHandler * dTitleChange
	   = new ExplorerLib::DWebBrowserEvents2_TitleChangeEventHandler(0, &S::OnTitleChange);
   dynamic_cast<ExplorerLib::InternetExplorerClass*>(explorer)->TitleChange += dTitleChange;    
                        
   webBrowser->Visible = true;
   webBrowser->GoHome();    
            
   Console::WriteLine(S"Press Enter to quit");    
   String * s = Console::ReadLine();    
                    
   while (s != S"")
   {
      s = Console::ReadLine();
   }
                
   try 
   {
      webBrowser->Quit();
   }
   catch(COMException *)    
   {
      Console::WriteLine(S"Explorer closed");
   }        
}

    
 


  