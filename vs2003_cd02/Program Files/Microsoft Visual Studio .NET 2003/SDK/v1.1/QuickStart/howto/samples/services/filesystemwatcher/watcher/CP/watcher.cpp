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

#using<mscorlib.dll>
#using<system.dll>
using namespace System;
using namespace System::IO;


__delegate void OnChangedHandler (Object* source, FileSystemEventArgs * e);
__delegate void OnRenamedHandler(Object* source, RenamedEventArgs* e);


__gc class Watcher
{
public:
	void Go(String * s){
		FileSystemWatcher * watcher = new FileSystemWatcher();
		watcher->Path= s;
		watcher->NotifyFilter = static_cast<NotifyFilters> (NotifyFilters::FileName | NotifyFilters::Attributes | NotifyFilters::LastAccess | NotifyFilters::LastWrite | NotifyFilters::Security | NotifyFilters::Size);

		watcher->Changed += new FileSystemEventHandler(this,OnChanged);
		watcher->Created += new FileSystemEventHandler(this,OnChanged);
		watcher->Deleted += new FileSystemEventHandler(this,OnChanged);
		watcher->Renamed += new RenamedEventHandler(this,OnRenamed);

		watcher->EnableRaisingEvents = true;


		Console::WriteLine(S"Press Enter to quit the sample\r\n");
		Console::ReadLine();

	}
	void OnChanged (Object* source, FileSystemEventArgs* e)
	{
		WatcherChangeTypes   watchtypes= e->ChangeType;
		Console::WriteLine( S"File: {0} {1}", e->FullPath, __box( watchtypes));
	}

	void OnRenamed(Object* source, RenamedEventArgs* e)
	{
		Console::WriteLine(S"File: {0} renamed to {1}", e->OldFullPath, e->FullPath);
	}

};


void main (int argc ,char *argv[])
{
	if(argc < 2)
		Console::WriteLine(S"Usage: Watcher.exe <directory>");

	else 
	{ Watcher * w=new Watcher(); 

	w->Go(argv[1]);
	}
}
