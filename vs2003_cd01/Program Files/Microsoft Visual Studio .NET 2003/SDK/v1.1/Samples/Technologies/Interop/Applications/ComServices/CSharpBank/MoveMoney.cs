// ==============================================================================
// Filename: MoveMoney.cs
//
// Summary:  C# implememtation of the MoveMoney class for the bank sample
// Classes:  MoveMoney.cs
//
// This file is part of the Microsoft COM+ Samples
//
// Copyright (C) Microsoft Corporation. All rights reserved
//
// This source code is intended only as a supplement to Microsoft
// Development Tools and/or on-line documentation.  See these other
// materials for detailed information reagrding Microsoft code samples.
//
// THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
// KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
// PARTICULAR PURPOSE.
//


namespace CSharpBank
{
    using System;
    using System.Runtime.InteropServices;
    using AccountComLib;
    using System.EnterpriseServices;
    using ADODB;

    [
		TransactionAttribute(TransactionOption.Required)
    ]
    public class MoveMoney : ServicedComponent, IMoveMoney
    {
        // F+F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++
        //
        // Function: Perform
        //
        // Perform() performs error handling for TruePerform().  If TruePerform() throws an
        // exception, then Perform() will call SetAbort() and pass the exception up
        // to the caller.  Otherwise, Perform() will simply call SetComplete() and return.
        //
        // Args:     lngPrimeAccount -   "From" Account
        //           lngSecondAccount -  "To" Account
        //           lngAmount -         Amount of transaction
        //           lngTranType -       Transaction Type
        //                               (1 = Withdrawal,
        //                                2 = Deposit,
        //                                3 = Transfer)
        //
        // Returns:  String -        Account Balance
        //
        // F-F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---

        public String Perform (int lngPrimeAccount, int lngSecondAccount, int lngAmount, int tranType)
        {

            String result = "";
            bool bSuccess = false;

            try
            {
                // Check for security
                if ((lngAmount > 500 || lngAmount < -500) && !ContextUtil.IsCallerInRole ("Managers"))
                    throw new COMException ("Need 'Managers' role for amounts over $500");

                // Call the true function
                result = truePerform (lngPrimeAccount, lngSecondAccount, lngAmount, tranType);

                bSuccess = true;
                return result;
            }
			catch(Exception)
			{
				throw;
			}


            // Upon exit, always call SetComplete if happy, or SetAbort if unhappy.
            // We do this because we never save state across method calls.
            finally
            {
                    if (bSuccess)
                        ContextUtil.SetComplete();
                    else
                        ContextUtil.SetAbort();
            }
        }

        // F+F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++
        //
        // Function: Perform
        //
        // TruePerform() is the function that performs the actual work for the Account class.
        // If an error occurs during execution, it will throw a COMException for Perform()
        // to handle.
        //
        // Args:     lngPrimeAccount -   "From" Account
        //           lngSecondAccount -  "To" Account
        //           lngAmount -         Amount of transaction
        //           lngTranType -       Transaction Type
        //                               (1 = Withdrawal,
        //                                2 = Deposit,
        //                                3 = Transfer)
        //
        // Returns:  String -        Account Balance
        //
        // F-F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---

        private String truePerform (int lngPrimeAccount, int lngSecondAccount, int lngAmount, int tranType)
        {

            String result = "";
            IAccount objAccount = null;
            IGetReceipt objReceipt = null;

            try
            {
                // Create the account object
				objAccount = (IAccount) new Account();
                switch (tranType)
                {
                case 1:     // debit
                    result = objAccount.Post (lngPrimeAccount, (- lngAmount));
                    break;

                case 2:     // credit
                    result = objAccount.Post (lngPrimeAccount, lngAmount);
                    break;

                case 3:     // transfer
                    result = objAccount.Post (lngPrimeAccount, (- lngAmount));
                    result += ".  ";
                    result += objAccount.Post (lngSecondAccount, lngAmount);
                    break;

                default:
                    throw new COMException ("Invalid transaction type");
                }


                // Get the receipt for the transaction
                objReceipt = (IGetReceipt) new GetReceipt();
                int iReceiptNo = objReceipt.GetNextReceipt ();
                result += "; Receipt No:  " + iReceiptNo.ToString();
			}

            finally
            {
            }
			return result;
        }
    }
}