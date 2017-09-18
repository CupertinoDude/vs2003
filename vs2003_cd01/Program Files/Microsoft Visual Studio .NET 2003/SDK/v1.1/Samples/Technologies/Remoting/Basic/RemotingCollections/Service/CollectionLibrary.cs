/*=====================================================================

  File:      CollectionLibrary.cs

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

namespace CollectionLibrary
{
    [Serializable]
    public class Country
    {
        public String Name;
        public String Capital;
    }

    [Serializable]
    public class City
    {
        public String Name;
        public String AreaCode;
    }

    // CollectionService is WellKnown (Server Activated Object) that returns:
    // * System.Collections.Stack
    // * System.Collections.ArrayList
    // * System.Collections.Hashtable
    public class CollectionService : MarshalByRefObject
    {
        public Stack RetrieveStack()
        {
            Console.WriteLine("Building Stack");
            Stack wordStack = new Stack();

            wordStack.Push("!");
            wordStack.Push("World");
            wordStack.Push("Hello");

            return wordStack;
        }

        public ArrayList RetrieveArrayList()
        {
            Console.WriteLine("Building CountryArrayList");
            ArrayList countryArrayList = new ArrayList();

            Country country1 = new Country();
            country1.Name = "USA";
            country1.Capital = "Washington DC";
            countryArrayList.Add(country1);

            Country country2 = new Country();
            country2.Name = "Japan";
            country2.Capital = "Tokyo";
            countryArrayList.Add(country2);

            Country country3 = new Country();
            country3.Name = "France";
            country3.Capital = "Paris";
            countryArrayList.Add(country3);

            Country country4 = new Country();
            country4.Name = "Eqypt";
            country4.Capital = "Cairo";
            countryArrayList.Add(country4);

            return countryArrayList;
        }

        public Hashtable RetrieveHashtable()
        {
            Console.WriteLine("Building CityHashtable");

            Hashtable cityHashtable = new Hashtable();

            City city1 = new City();
            city1.Name = "New York";
            city1.AreaCode = "212";
            cityHashtable[city1.AreaCode] = city1;

            City city2 = new City();
            city2.Name = "Atlanta";
            city2.AreaCode = "404";
            cityHashtable[city2.AreaCode] = city2;

            City city3 = new City();
            city3.Name = "Seattle";
            city3.AreaCode = "216";
            cityHashtable[city3.AreaCode] = city3;

            return cityHashtable;
        }
    }
}
