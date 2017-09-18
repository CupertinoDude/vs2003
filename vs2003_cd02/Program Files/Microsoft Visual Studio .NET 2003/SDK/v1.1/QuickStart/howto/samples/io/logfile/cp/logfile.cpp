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
using namespace System::Text;

void WriteFile(String* input) {

	FileStream* fs = new FileStream("log.txt", FileMode::OpenOrCreate, FileAccess::ReadWrite);

	StreamWriter* w = new StreamWriter(fs);
	w->BaseStream->Seek(0, SeekOrigin::End);

	w->Write("\r\nLog Entry : ");
	w->Write("{0} {1} \r\n\r\n", DateTime::Now.ToLongTimeString(),
		DateTime::Now.ToLongDateString());

	w->Write(String::Concat(input , "\r\n"));
	w->Write("------------------------------------\r\n");

	w->Flush();

	w->Close();
}

String * ReadFile() {

	FileStream* fs  = new FileStream("log.txt", FileMode::OpenOrCreate, FileAccess::ReadWrite);

	StringBuilder* output = new StringBuilder();

	output->Length = 0;

	StreamReader* r = new StreamReader(fs);
	r->BaseStream->Seek(0, SeekOrigin::Begin);

	while (r->Peek() > -1) {

		output->Append(String::Concat(r->ReadLine() , "\r\n"));
	}

	r->Close();

	return output->ToString();
}

void main(){
	WriteFile("This is a  Message Log.... \r\n");
	Console::WriteLine(ReadFile());
}

