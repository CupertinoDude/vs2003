//==========================================================================
//  File:		math.cs
//
//==========================================================================
using System;

namespace Demo.Localize.Math
{

   public class InvalidFormulaException : ApplicationException { }

   public class IntegerMath
   {
		public String GetResult(Int32 arg1, Char op, Int32 arg2)
		{
			switch(op)
			{
				case '+':
					return String.Format("{0:###0}", arg1 + arg2);
				case '-':
					return String.Format("{0:###0}", arg1 - arg2);
				case '/':
					return String.Format("{0:###0}", arg1 / arg2);
				case '*':
					return String.Format("{0:###0}", arg1 * arg2);
				default:
					throw new InvalidFormulaException();
			}
		}

   }

}