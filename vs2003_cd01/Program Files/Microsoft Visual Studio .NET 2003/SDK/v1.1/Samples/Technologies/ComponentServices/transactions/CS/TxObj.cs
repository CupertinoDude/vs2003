/*=====================================================================
File:      TxObj.cs

Summary:   Server Code for .NET COM+ Transactions Sample

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
using System.Data;
using System.Data.SqlClient;
using System.Reflection;
using System.Windows.Forms;
using System.EnterpriseServices;
using System.Runtime.InteropServices;
using System.Runtime.Serialization;

// the ApplicationName attribute specifies the name of the
// COM+ Application that will hold assembly components
[assembly: ApplicationName("TxDemoSvr")]

// the ApplicationActivation.ActivationOption attribute specifies 
// where assembly components are loaded on activation
// Library : components run in the creator's process
// Server : components run in a system process, dllhost.exe
[assembly: ApplicationActivation(ActivationOption.Library)]

// AssemblyKeyFile specifies the name of the strong key
// that will be used to sign the assembly.
// The .snk file was generated with sn.exe
#if BuildBat  // Used when building from the command line
[assembly: AssemblyKeyFile("TxDemoSvrCS.snk")]
#else         // Used when building from within Visual Studio .NET
[assembly: AssemblyKeyFile("..\\..\\TxDemoSvrCS.snk")]
#endif

namespace TxDemoServerCS
{
	// This TxDemoSvr class is going to be hosted within COM+
	// The transaction attribute enables us to do transactions within this class.
	// Requires means that this class needs a transaction, this will be a new 
	// transaction if there isn't one present already, 
	// otherwise it will take part in the existing transaction.
	[Transaction(TransactionOption.Required)] 
	public class TxDemoSvr : ServicedComponent
	{
		private SqlConnection database;

		// First the SQLConnection needs to be setup.
		private SqlConnection Database		
		{
            get
            {
			    if (database == null) database = new SqlConnection(
				    "server=(local)\\NetSDK;Integrated Security=SSPI;database=TxDemoDB");
			    return database;
		    }
    	}

	    // This method returns the "current value" 
	    public int GetCurrentValue()
		{
		    int currentValue = 0;
            try
            {			
                Database.Open();
                SqlCommand sqlCommand = new SqlCommand("select * from currentValue", 
                    Database);
                SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
                sqlDataReader.Read();
                currentValue = (int)sqlDataReader["currentValue"];
            }
            catch(Exception e)
            {
                throw new CurrentValueNotReadException(e);
            }
            finally
            {
                Database.Close();
            }
			return currentValue ;
		}

		// This method tries to update the "current value", first it updates the 
		// database, then it checks if the value is allowed, if not it throws an 
		// COMException so the [AutoComplete()] Attribute automatically does a 
		// rollback of the transaction.
		[AutoComplete]
		public void AutoCompletePost(int newValue)
		{
            try
            {
                Database.Open();
                SqlCommand sqlCommand = new SqlCommand(@"
																									UPDATE currentValue 
																									SET currentValue=@currentValue
																								",Database);
                sqlCommand.Parameters.Add("@currentValue",SqlDbType.Int,4);
                sqlCommand.Parameters["@currentValue"].Value = newValue;
                try 
                {
                    sqlCommand.ExecuteNonQuery();
                }
                catch(Exception e)
                {
                    throw new DatabaseExecutionException(e);
                }
    		
                if (newValue < 0 || newValue > 10)
                {
                    MessageBox.Show("About to abort the transaction because the new value (" 
                        + newValue + ") is either <0 or >10");
                    throw new ValueOutOfRangeException(newValue);
                }
                else
                {
                    MessageBox.Show("About to commit the transaction");
                }
            }
            finally 
            {
                Database.Close();
            }
		}

		// This method tries to update the "current value", first it updates the 
		// database, then it checks if the value is allowed, if not it calls 
		// ContextUtil.SetAbort to rollback the transaction.
		public void Post(int newValue)
    {
            try
            {
                Database.Open();
                SqlCommand sqlCommand = new SqlCommand(@"
																									UPDATE currentValue 
																									SET currentValue=@currentValue
																								",Database);
                sqlCommand.Parameters.Add("@currentValue",SqlDbType.Int,4);
                sqlCommand.Parameters["@currentValue"].Value = newValue;
                try 
                {
                    sqlCommand.ExecuteNonQuery();
                }
                catch(Exception e)
                {
                    throw new DatabaseExecutionException(e);
                }

                if (newValue<0 || newValue>10)
                {
                    MessageBox.Show("About to abort the transaction because the new value (" 
                        + newValue + ") is either <0 or >10");
                    ContextUtil.SetAbort();
                }
                else
                {
                    MessageBox.Show("About to commit the transaction");
                    ContextUtil.SetComplete();
                }
            } 
            finally 
            {
                Database.Close();
            }
		}
	}
    

		// These are the specialized exceptions this server can throw. 
		// The constructor with the SerializationInfo and the StreamingContext are to 
		// support serialization of the exception as it goes from COM+ to the client.
	    // More information on how to create custom exceptions can be found in the 
		// Exception Handling Whitepaper.
    	
		// CurrentValueNotReadException occurs when there is an error while reading the 
		// current value from the database.
		[Serializable]
    public class CurrentValueNotReadException : Exception
    {
    	public CurrentValueNotReadException(Exception ex) : 
    		base("Unable to get the current value from the database", ex)
    	{
    	}

    	public CurrentValueNotReadException(SerializationInfo info, 
    		StreamingContext context) : base(info, context) 
    	{
    	}
    }

		// DatabaseExecutionException occurs when there is an error while updating 
		// the database
		[Serializable]
    public class DatabaseExecutionException : Exception
    {
        
    	public DatabaseExecutionException(Exception ex) : 
				base("Error while executing database commands", ex)
    	{
    	}
        
    	public DatabaseExecutionException(SerializationInfo info, 
    		StreamingContext context) : base(info, context) 
    	{
    	}
    }

		// AbortTransactionException occurs when an AutoComplete attribute is used 
		// and the transaction needs to be aborted
		[Serializable]
    public class ValueOutOfRangeException : Exception
    {
    	public ValueOutOfRangeException(int newValue) : 
    		base("the new value (" + newValue + ") is either <0 or >10")
    	{
    	}

    	public ValueOutOfRangeException(SerializationInfo info, 
    		StreamingContext context) : base(info, context) 
    	{
    	}
    }

}