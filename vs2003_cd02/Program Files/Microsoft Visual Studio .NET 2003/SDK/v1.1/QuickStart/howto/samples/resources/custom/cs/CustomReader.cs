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

/** CustomReader: Implement the interface IResourceReader.
CustomManager: Sub-class ResourceManager and create
ResourceSets using the CustomReader class.
*/

using System;
using System.Collections;
using System.Globalization;
using System.Resources;


class CustomReader : IResourceReader
{

    public void Close()
    {
    // Close any open files, DB connections, etc here.
    }



    IEnumerator IEnumerable.GetEnumerator()
    {
    return GetEnumerator();
    }

    void IDisposable.Dispose()
    {
    }

    public IDictionaryEnumerator GetEnumerator()
    {
    Hashtable dict = new Hashtable();

    dict["key1"] = "value 1";
    dict["key2"] = "value 2";
    dict["key3"] = "value 3";

    return dict.GetEnumerator();
    }

}


public class CustomManager : ResourceManager
{
    override protected ResourceSet InternalGetResourceSet( CultureInfo culture,
    bool createIfNotExists,
    bool tryParents )
    {
    return new ResourceSet( new CustomReader() );
    }


    public static void Main(string[] args)
    {
    ResourceManager resourceManager = new CustomManager();
    Console.WriteLine( "Lookup for key1 yields: "
      + resourceManager.GetString("key1") );

    Console.WriteLine ("\r\nPress Return to exit.");
    Console.Read();
    }

}

