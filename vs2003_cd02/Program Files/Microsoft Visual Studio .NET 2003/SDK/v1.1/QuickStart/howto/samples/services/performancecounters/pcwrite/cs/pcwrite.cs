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

using System;
using System.Diagnostics;
using System.Threading;

public class PCWrite{


    const string objectName   = "Orders";
    const string counterName  = "Milk Orders";
    const string instanceName = "International";

  public static void Main(string[] args){

        // Get the category/counters installed...
   if ( (args.Length > 0) ) {
	    if ((args[0].StartsWith("/inst"))){
                if ( InstallCounters() )
                    return;
                else
                    Console.WriteLine("Continuing with sample...\r\n");
	    }
	    else if ((args[0].StartsWith("/del"))){
		DeleteCounters();
		return;
	    }
	    else {
		ShowUsage();
		return;
	    }
    }
    if (PerformanceCounterCategory.Exists(objectName)) {

        if(!PerformanceCounterCategory.CounterExists(counterName, objectName))
        {
          Console.WriteLine("The counter does not exists!");
          return;
        }
    
        Console.WriteLine("Counter Exists");
    
        PerformanceCounter aCounter = new PerformanceCounter(objectName, counterName ,instanceName, false);
        aCounter.RawValue = 50;

        Console.WriteLine("Press \'q\' to quit the sample");
        Console.WriteLine("Press \'+\' to increment the counter");
        Console.WriteLine("Press \'-\' to decrement the counter");

        Console.WriteLine("Started");
        int command;
        do
        {
          command = Console.Read();
          if(command=='-') aCounter.IncrementBy(-5);
          if(command=='+') aCounter.IncrementBy(5);
        }
        while(command!='q');
    }
    else {
	Console.WriteLine("Category has to be installed first by running: pcwrite /inst");
    }
  }

  private static bool InstallCounters(){ 
    if(!PerformanceCounterCategory.Exists(objectName)){
      PerformanceCounterCategory.Create(objectName,"Simple Counter Object",counterName,"Simple Counter");
      Console.WriteLine("Category has been created.");
      return(true);
    }
    else {
      return(false);
    }
  }

  private static void DeleteCounters(){
    if(PerformanceCounterCategory.Exists(objectName)) {
	PerformanceCounterCategory.Delete(objectName);
	Console.Write("Category has been successfully deleted!  ");
    }
    else{
        Console.Write("Category not installed!  ");
    }
  }

  private static void ShowUsage(){

	Console.WriteLine("Usage");
	Console.WriteLine("-----");
        Console.WriteLine("To install perf counter : pcwrite /inst");
	Console.WriteLine("To apply changes to perf counter: pcwrite");
	Console.WriteLine("To delete perf counter: pcwrite /del");
	
   }
}