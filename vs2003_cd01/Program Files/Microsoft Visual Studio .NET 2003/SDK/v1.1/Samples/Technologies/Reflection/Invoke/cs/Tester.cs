/*=====================================================================
  File:      Tester.cs

  Summary:   A simple DLL that exposes a function or two to be tested
             by the invoke sample

---------------------------------------------------------------------
  This file is part of the Microsoft .NET SDK Code Samples.

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
using System.Windows.Forms;

// Some test methods to try from the Invoke sample
public class SomeType {
   public static double AddTwoDoubles(double num1, double num2){
      return num1 + num2;
   }

   public DialogResult ShowMessage(String message){
      return MessageBox.Show(message);
   }

   public DialogResult ShowMessage(String message, String caption){
      return MessageBox.Show(message, caption);
   }
   
   public DialogResult ShowMessage(String message, String caption, int style){
      return MessageBox.Show(message, caption, (MessageBoxButtons)style);
   }

}

