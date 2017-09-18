/*=====================================================================

  File:      client.cs

---------------------------------------------------------------------
This file is part of the Microsoft .NET Framework SDK Code Samples.

  Copyright (C) Microsoft Corporation.  All rights reserved.

This source code is intended only as a supplement to Microsoft
Development Tools and/or on-line documentation.  See these other
materials for detailed information regarding Microsoft code samples.
 
THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
PARTICULAR PURPOSE.
=====================================================================*/

using System;
using System.Collections;
using System.IO;
using System.Runtime.Remoting;
                
using CollectionLibrary;

public class Client
{
    public static int Main(string[] args)
    {
        Console.WriteLine(".NET Remoting Collection Client");
        Console.WriteLine();
        // Load the Http Channel from the config file
		RemotingConfiguration.Configure("Client.exe.config");

        CollectionService collectionService = new CollectionService();

        Console.WriteLine("Retrieving a Collection Stack by Value");
        Stack wordStack = collectionService.RetrieveStack();

        Console.WriteLine("Stack count: {0}", wordStack.Count);

        foreach(String word in wordStack)
        {
            Console.Write("{0} ", word);
        }

        Console.WriteLine();
        Console.WriteLine();

        Console.WriteLine("Retrieving an ArrayList by Value");
        ArrayList countryArrayList = collectionService.RetrieveArrayList();

        Console.WriteLine("ArrayList count: {0}", countryArrayList.Count);

        Console.WriteLine("Country\t Capital");
        Console.WriteLine("-------\t -------");
        foreach(Country country in countryArrayList)
        {
            Console.WriteLine("{0}\t{1}",country.Name, country.Capital);
        }
        Console.WriteLine();

        Console.WriteLine("Retrieving Hashtable by Value");
        Hashtable cityHashtable = collectionService.RetrieveHashtable();

        Console.WriteLine("Hashtable count: {0}", cityHashtable.Count);

        IDictionaryEnumerator cityEnumerator = cityHashtable.GetEnumerator();
        Console.WriteLine("KEY\tVALUE");
        Console.WriteLine("---\t-----");

        while ( cityEnumerator.MoveNext() )
        {
            Console.WriteLine( "{0}:\t{1}", cityEnumerator.Key, cityEnumerator.Value );
            if (cityEnumerator.Value is City)
            {
                City city = (City)cityEnumerator.Value;

                Console.WriteLine("\t\tName    : {0}", city.Name);
                Console.WriteLine("\t\tAreaCode: {0}", city.AreaCode);
            }

            Console.WriteLine();

        }
        Console.WriteLine();

        return 0;
    }
}

