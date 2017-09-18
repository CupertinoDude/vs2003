<%@ WebService Language="JScript" Class="MathService" %>

import System;
import System.Web.Services;

public class MathService extends WebService {

   WebMethodAttribute public function Add(a:float, b:float) : float
   {
       return a + b;
   }

   WebMethodAttribute public function Subtract(a:float, b:float) : float
   {
       return a - b;
   }

   WebMethodAttribute public function Multiply(a:float, b:float) : float
   {
       return a * b;
   }

   WebMethodAttribute public function Divide(a:float, b:float) : float
   {
       if (b==0) return -1;
       return a / b;
   }

}