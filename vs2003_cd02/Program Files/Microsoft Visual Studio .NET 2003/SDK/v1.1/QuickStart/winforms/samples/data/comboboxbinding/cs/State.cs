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


namespace Microsoft.Samples.WinForms.Cs.ComboBoxBinding {
    
    public struct State {
        
        private string shortName, longName;

        public State(string longName , string shortName) { 
            this.shortName = shortName ; this.longName = longName ;
        }

        public string ShortName { get { return shortName; } }
        public string LongName { get { return longName; } }
    }

}
