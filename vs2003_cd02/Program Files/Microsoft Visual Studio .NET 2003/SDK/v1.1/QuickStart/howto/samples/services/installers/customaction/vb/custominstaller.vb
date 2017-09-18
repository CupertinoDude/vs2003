'-----------------------------------------------------------------------
'  This file is part of the Microsoft .NET SDK Code Samples.
' 
'  Copyright (C) Microsoft Corporation.  All rights reserved.
' 
'This source code is intended only as a supplement to Microsoft
'Development Tools and/or on-line documentation.  See these other
'materials for detailed information regarding Microsoft code samples.
' 
'THIS CODE AND INFORMATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY
'KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
'IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
'PARTICULAR PURPOSE.
'-----------------------------------------------------------------------

Imports System
Imports System.Collections
Imports System.Configuration.Install

public class CustomInstaller: Inherits Installer

  public overrides sub Install(state As IDictionary)
    Context.LogMessage("Installing")
    MyBase.Install(state)
    Console.WriteLine("Installing: Any code could be executed here!")
  end sub

  public overrides sub Uninstall(state As IDictionary)
    Context.LogMessage("Uninstalling")
    Console.WriteLine("Uninstalling: Any code could be executed here!")
    MyBase.Uninstall(state)
  end sub
end class
