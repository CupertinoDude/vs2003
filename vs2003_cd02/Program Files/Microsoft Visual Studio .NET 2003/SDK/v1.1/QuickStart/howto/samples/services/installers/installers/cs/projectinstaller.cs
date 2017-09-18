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
using System.Diagnostics;
using System.Messaging;
using System.ComponentModel;

[RunInstaller(true)]
public class ProjectInstaller: Installer {

    private MessageQueueInstaller mqInstaller;
    private EventLogInstaller elInstaller;

    public ProjectInstaller() {

        mqInstaller = new MessageQueueInstaller();

        mqInstaller.Authenticate = true;
        mqInstaller.EncryptionRequired = EncryptionRequired.Body;
        mqInstaller.Label = "InstallersSample";
        mqInstaller.Path = ".\\InstallersSample";
        mqInstaller.Transactional = false;
        mqInstaller.UseJournalQueue = true;

        Installers.Add(mqInstaller);

        elInstaller = new EventLogInstaller();

        elInstaller.Log = "InstallersSample";
        elInstaller.Source = "InstallersSample";

        Installers.Add(elInstaller);
    }
}    
