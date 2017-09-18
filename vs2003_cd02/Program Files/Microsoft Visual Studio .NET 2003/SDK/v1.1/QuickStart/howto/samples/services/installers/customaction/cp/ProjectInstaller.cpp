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
#using <system.configuration.install.dll>
#using <system.dll>

#include "CustomInstaller.cpp"

using namespace System;
using namespace System::Configuration::Install;
using namespace System::ComponentModel;

[RunInstaller(true)]
public __gc class ProjectInstaller : public Installer {
private:

    CustomInstaller* customInstaller;

public:
    ProjectInstaller() {
        customInstaller = new CustomInstaller;
        Installers->Add(customInstaller);
    }
};
