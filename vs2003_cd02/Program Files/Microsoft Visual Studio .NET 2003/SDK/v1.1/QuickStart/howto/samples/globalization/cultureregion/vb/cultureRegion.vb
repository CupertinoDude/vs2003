'-----------------------------------------------------------------------
'  This file is part of the Microsoft .NET SDK Code Samples.
' 
'  Copyright (C) Microsoft Corporation.  All rights reserved.
' 
'This source code is intended only as a supplement to Microsoft
'Development Tools and/or on-line documentation.  See these other
'materials for detailed information regarding Microsoft code samples.
' 
'THIS CODE AND INFORMATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY
'KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
'IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
'PARTICULAR PURPOSE.
'-----------------------------------------------------------------------

Imports System
Imports System.Globalization

Class CultureAndRegion

     Public shared Sub Main()

         Dim c as CultureInfo
         c = new CultureInfo("en-us")
         Console.WriteLine ("The CultureInfo is set to: {0}", c.DisplayName)
         Console.WriteLine ("The parent culture is: {0}", c.Parent.DisplayName)
         Console.WriteLine ("The three leter ISO language name is: {0}", c.ThreeLetterISOLanguageName)
         Console.WriteLine ("The default calendar for this culture is: {0}", c.Calendar.ToString())
         Console.WriteLine

         Dim r as RegionInfo
         r = new RegionInfo("us")
         Console.WriteLine ("The name of this region is: {0}", r.Name)
         Console.WriteLine ("The currency symbol for the region is: {0}", r.CurrencySymbol)
         Console.WriteLine ("Is this region metric : {0}", r.IsMetric)

         Console.WriteLine
         Console.WriteLine

         Dim c2 as CultureInfo
         c2 = new CultureInfo("de-ch")
         Console.WriteLine ("The CultureInfo is set to: {0}", c2.DisplayName)
         Console.WriteLine ("The parent culture is: {0}", c2.Parent.DisplayName)
         Console.WriteLine ("The three leter ISO language name is: {0}", c2.ThreeLetterISOLanguageName)
         Console.WriteLine ("The default calendar for this culture is: {0}", c2.Calendar.ToString())
    	 Console.WriteLine

         Dim r2 as RegionInfo
         r2 = new RegionInfo("de")
         Console.WriteLine ("The name of this region is: {0}", r2.Name)
         Console.WriteLine ("The currency symbol for the region is: {0}", r2.CurrencySymbol)
         Console.WriteLine ("Is this region metric : {0}", r2.IsMetric)

        Console.WriteLine ()
        Console.WriteLine ("Press Enter to continue...")
        Console.ReadLine()

    End Sub

End Class

