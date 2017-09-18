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
Imports System.Data
Imports System.Data.SqlClient
Imports System.XML
Imports Microsoft.VisualBasic

namespace HowTo.Samples.ADONET

public class employees
  public shared sub Main()
    Dim myemployees as employees
    myemployees = new employees()
    myemployees.Run()
  end sub

  public sub Run()

    Dim mySqlConnection as SqlConnection = new SqlConnection("server=(local)\NetSDK;Integrated Security=SSPI;database=northwind")
    mySqlConnection.Open()
    
    Dim mySqlCommand as SqlCommand = new SqlCommand("select * from employees order by EmployeeID", mySqlConnection)

    try
			Dim myReader as SqlDataReader = mySqlCommand.ExecuteReader()

			Dim record as Integer = 0
      Dim photoColumn as Integer = myReader.GetOrdinal("Photo")
      Dim column as Integer
      
      While myReader.Read()
				record = record + 1
				Console.Write(Chr(10) + "************************ Employee number " + record.ToString() + " ************************" + Chr(10))
				
        ' Display each column and value, skipping the "Photo" column
				For column = 0 to myReader.FieldCount-1
					If column <> photoColumn Then
						Console.Write(myReader.GetName(column) + ":" + Chr(9) + myReader.GetValue(column).ToString() + Chr(10))
					End If
				Next

      End While
    catch e as Exception
      Console.WriteLine(e.ToString())
    Finally
       mySqlConnection.Close()
    end try
  end sub
end class

end namespace




