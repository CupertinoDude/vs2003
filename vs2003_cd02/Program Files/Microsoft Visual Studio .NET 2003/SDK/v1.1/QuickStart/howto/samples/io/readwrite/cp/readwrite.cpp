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

String* ReadFileInt32() {

	StringBuilder * output = new StringBuilder();


	FileStream* fs = new FileStream("data.bin", FileMode::OpenOrCreate);
	BinaryReader* r = new BinaryReader(fs);

	r->BaseStream->Seek(0,SeekOrigin::Begin);    //set the file pointer to the beginning

	//because many of the translations between different datatypes are uninterpretable
	//when converting to and from binary data, we have to catch any potential
	//exceptions that may be raised...
	//Reading the data correctly is contingent upon HOW the information was written...
	//This is not the same as when writing log files.
	while (r->BaseStream->Position < r->BaseStream->Length)                // while not at the end of the file
	{

		output->Append( r->ReadInt32().ToString() );

	}

	fs->Close();

	return output->ToString();
}


String* WriteFileInt32(String* output[])
{
	FileStream* fs = new FileStream("data.bin", FileMode::Create);
	BinaryWriter* w = new BinaryWriter(fs);
	String* strOutput = "";

	w->BaseStream->Seek(0, SeekOrigin::End);        // set the file pointer to the end

	//because the information we are writing may not be appropriate for the particular
	//style chosen to write (Eg: the word "Hello" as an integer?), we have to catch
	//write errors, and informa the user that we could not perform the task
	try {

		for (int k = 0; k < output->Length; k++)
		{
			Int32 i = Convert::ToInt32(output[k]);
			w->Write( i );
		}

	}
	catch (Exception*) {
		//let the user know that the information could not be written
		strOutput = String::Concat( "WRITE EXCEPTION: \n" ,
			"The information you want to write cannot be written in the format requested. " ,
			"\nPlease enter a valid value for the datatype you are trying to write");
	}

	fs->Close();

	return strOutput;

}
	void main (int argc,char *argv[]) {

		String* s = "";
		String * data[]={"10","20","30","40"};

		//write out the file
		s = WriteFileInt32(data);

		if (s->Equals("")) {

			//read back in, the display information...
			s = ReadFileInt32();
		}
		Console::WriteLine(s);
	}
