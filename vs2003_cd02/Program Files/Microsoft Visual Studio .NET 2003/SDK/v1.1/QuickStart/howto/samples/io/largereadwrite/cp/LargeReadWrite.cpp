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

void LargeReadWrite ( double fileSize )
{
	//declare the StreamReader, for accessing the file

	Double origTestSize = fileSize;

	double testSize = origTestSize * 1024 ; 

	FileStream* fs = new FileStream("data.bin", FileMode::OpenOrCreate);    
	fs->SetLength(0);

	BinaryWriter* w = new BinaryWriter(fs);  // create a BinaryWriter

	w->BaseStream->Seek(0,SeekOrigin::Begin);  // seek the beginning of the file

	Console::Write  ("Writing file..");

	int beginWrite = Environment::TickCount; // get the start time

	for (int i = 0; i < testSize; i++)      // loop through the file, writing the bytes
	{
		w->Write( (Byte) 1);                 // do the write
	}

	Console::WriteLine ();

	fs->Flush();

	int endWrite = Environment::TickCount;   // get the end time

	Console::WriteLine ("For the Write...");      
	Console::WriteLine ("Start Time: {0}", beginWrite.ToString());
	Console::WriteLine ("End Time: {0}", endWrite.ToString());
	Console::WriteLine ("Elapsed Time: {0} ms", (endWrite-beginWrite).ToString()); // the time span in ms
	double thruputWrite = ((double)origTestSize / (((double)endWrite-(double)beginWrite)) * 1000);
	Console::WriteLine ("Data Thruput: {0} mb/sec", thruputWrite.ToString());

	BinaryReader* r = new BinaryReader(fs); // create a BinaryReader

	w->BaseStream->Seek(0,SeekOrigin::Begin);    //set the file pointer to the beginning
	int dummyInt;

	int beginRead = Environment::TickCount; // get the start time

	for (int i = 0; i < testSize; i++)     // loop through, reading the bytes
	{
		dummyInt = r->ReadByte();           // do the read
	}

	fs->Flush();

	int endRead = Environment::TickCount;   // determine the end time

	Console::WriteLine ();
	Console::WriteLine ("For the Read...");
	Console::WriteLine ("Start Time: {0}", beginRead.ToString());
	Console::WriteLine ("End Time: {0}", endRead.ToString());
	Console::WriteLine ("Elapsed Time: {0}ms", (endRead-beginRead).ToString()); // the time span in ms
	double thruputRead = ((double)origTestSize / (((double)endRead-(double)beginRead)) * 1000);
	Console::WriteLine ("Data Thruput: {0} mb/sec", thruputRead.ToString());

	fs->Close();                            // close the file

	File::Delete("data.bin");     // delete the file


}

void main (int argc ,char *argv[])
{
	if(argc < 2)
	{
		Console::WriteLine("Usage: LargeReadwrite.exe <Size in KB>");
		return;
	}
	double fileSize=Convert::ToDouble(argv[1]);
	if (fileSize<=10000 && fileSize>0)
	{
		LargeReadWrite(fileSize);
	}
	else	
	{
		Console::WriteLine ("Please specify a size between 1 and 10000");
	}

	

}

