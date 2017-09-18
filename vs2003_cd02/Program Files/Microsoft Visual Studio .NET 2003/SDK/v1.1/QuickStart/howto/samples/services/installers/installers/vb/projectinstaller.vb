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

imports System
imports System.Collections
imports System.Configuration.Install
imports System.Diagnostics
imports System.Messaging
imports System.ComponentModel

<RunInstaller(true)> public class ProjectInstaller: Inherits Installer

    private mqInstaller As MessageQueueInstaller
    private elInstaller As EventLogInstaller

    public Sub New()
        MyBase.New()

        mqInstaller = new MessageQueueInstaller()

        mqInstaller.Authenticate = true
        mqInstaller.EncryptionRequired = EncryptionRequired.Body
        mqInstaller.Label = "InstallersSample"
        mqInstaller.Path = ".\InstallersSample"
        mqInstaller.Transactional = false
        mqInstaller.UseJournalQueue = true

        Installers.Add(mqInstaller)

        elInstaller = new EventLogInstaller()

        elInstaller.Log = "InstallersSample"
        elInstaller.Source = "InstallersSample"

        Installers.Add(elInstaller)
    end sub
end class
