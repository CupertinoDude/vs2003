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


namespace Microsoft.Samples.WinForms.Cs.CustomerControl {
    using System;
    using System.ComponentModel;
    using System.IO;

    public class Customer : System.ComponentModel.Component {

        private string id ;
        private string title ;
        private string firstName ;
        private string lastName ;
        private string address ;

        public static Customer ReadCustomer() {
            Customer cust = new Customer("536-45-1245");
            cust.Title = "Mr.";
            cust.FirstName = "Otis";
            cust.LastName = "Redding";
            cust.Address = "1 Dock Street,\r\nThe Bay,\r\nSomeWhere,\r\nUSA";
            return cust;
        }

        internal Customer(string ID): base() {
            this.id = ID ;    
        }

        public string ID { 
            get  { 
                return id ;
            }
        }

        public string FirstName { 
            get  { 
                return firstName ;
            }
            set {
                firstName = value ;
            }
        }

        public string Title { 
            get  { 
                return title ;
            }
            set {
                title = value ;
            }
        }

        public string LastName { 
            get  { 
                return lastName ;
            }
            set {
                lastName = value ;
            }
        }

        public string Address { 
            get  { 
                return address ;
            }
            set {
                address = value ;
            }
        }

        public override string ToString() {
            StringWriter sb = new StringWriter() ;
            sb.WriteLine("Customer: \n");
            sb.WriteLine(this.ID);
            sb.Write(this.Title + " ");
            sb.Write(this.FirstName + " ");
            sb.WriteLine(this.LastName);
            sb.WriteLine(this.Address);
            return sb.ToString();
        }


    }
}
