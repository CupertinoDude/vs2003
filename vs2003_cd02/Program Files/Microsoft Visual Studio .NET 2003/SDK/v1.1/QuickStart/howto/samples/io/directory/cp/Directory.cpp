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
using namespace System::Collections;
void  ListDirectory( String* dirToList )
{

	try {
		DirectoryInfo* dir = new DirectoryInfo( dirToList );

		Console::WriteLine();
		Console::WriteLine();
		Console::WriteLine("Following is a listing for directory: {0}", Path::GetFullPath(dir->ToString()));
		Console::WriteLine();
		Console::WriteLine("{0, -25} {1,-12:N0} {2, -12} {3,-20:g}", 
			S"Name", (S"Size")->PadLeft(12), S"Type", S"Creation Time");
		Console::WriteLine("----------------------------------------------------------------------------");
		IEnumerator* ie=dir->GetFileSystemInfos()->GetEnumerator();
		while (ie->MoveNext())
		{    
			try{
				FileSystemInfo* fsi= __try_cast<FileSystemInfo*> (ie->Current);
				DateTime creationTime = fsi->CreationTime;
				int subLength = 25;

				if (FileInfo *f=dynamic_cast<FileInfo *> (fsi))
				{// This is a file

					//this if statement simply ensures that we do not shorten the name of the file too much!
					if (f->Name->Length < subLength)
						subLength = f->Name->Length;

					String* name = f->Name->Substring(0, subLength);

					long size = f->Length;

					// format the output to the screen
					Console::WriteLine(S"{0, -25} {1,-12:N0} {2, -12} {3,-20:g}", 
						name, String::Concat(size.ToString() , " KB")->PadLeft(12), S"File",  creationTime.ToString());
				}
				else //it must be a directory
				{
					DirectoryInfo* d = __try_cast<DirectoryInfo *> (fsi);

					//this if statement simply ensures that we do not shorten the name of the file too much!
					if (d->Name->Length < subLength)
						subLength = d->Name->Length;

					String* dirName = d->Name->Substring(0, subLength);

					// format the output to the screen
					Console::WriteLine("{0, -25} {1,-12:N0} {2, -12} {3,-20:g}", 
						dirName,  (S"")->PadLeft(12), S"File Folder", creationTime.ToString());
				}
			} catch (Exception*) {} //ignore the error, and try the next item...
		}
	}
	catch (Exception* e) {
		Console::WriteLine("--- PROCESS ENDED ---");
		Console::WriteLine(e->Message);
	}
}


void main (int argc ,char *argv[])
{
	if(argc < 2)
		Console::WriteLine("Usage: Directory.exe <directory>");

	else 
	{ 
		ListDirectory(argv[1]);
	}
}