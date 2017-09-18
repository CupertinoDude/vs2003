<%@ WebService Language="JScript" Class="DataTypes" %>

import System;
import System.Web.Services;

public class Order
{
   public var OrderID:Int32;
   public var Price:Double;
}

public class DataTypes extends WebService {
   private static var ModeOn:Int32 = 1;
   private static var ModeOff:Int32 = 2;

   WebMethodAttribute
   public function SayHello() : String
   {
       return "Hello World!";
   }

   WebMethodAttribute
   public function SayHelloName(name:String) : String
   {
       return "Hello" + name;
   }

   WebMethodAttribute
   public function GetIntArray() : int[]
   {
       var a:int[] = new int[5];
       for (var i:int=0; i<5; i++)
           a[i] = i*10;
       return a;
   }

   WebMethodAttribute
   public function GetMode() : Int32
   {
       return 2;
   }

   WebMethodAttribute
   public function GetOrder() : Order
   {
      var myOrder:Order = new Order();

      myOrder.Price=34.5;
      myOrder.OrderID = 323232;

      return myOrder;
   }

   WebMethodAttribute
   public function GetOrders() : Order[]
   {
      var myOrder:Order[] = new Order[2];

      myOrder[0] = new Order();
      myOrder[0].Price=34.5;
      myOrder[0].OrderID = 323232;
      myOrder[1] = new Order();
      myOrder[1].Price=99.4;
      myOrder[1].OrderID = 645645;

      return myOrder;
   }
}
