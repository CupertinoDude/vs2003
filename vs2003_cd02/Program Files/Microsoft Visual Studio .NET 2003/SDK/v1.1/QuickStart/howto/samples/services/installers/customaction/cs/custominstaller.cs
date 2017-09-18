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
using System.Collections;
using System.Configuration.Install;

public class CustomInstaller: Installer{

  public override void Install(IDictionary state) {
    Context.LogMessage("Installing");
    base.Install(state);
    Console.WriteLine("Installing: Any code could be executed here!");
  }

  public override void Uninstall(IDictionary state) {
    Context.LogMessage("Uninstalling");
    Console.WriteLine("Uninstalling: Any code could be executed here!");
    base.Uninstall(state);
  }
}
