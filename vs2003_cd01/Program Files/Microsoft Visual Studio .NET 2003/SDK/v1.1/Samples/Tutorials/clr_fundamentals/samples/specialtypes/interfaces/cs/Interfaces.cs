using System;

class Point : IComparable {
   public Int32 x, y;

   public Point(Int32 x, Int32 y) {
      this.x = x;
      this.y = y;
   }

   // CompareTo is define by the IComparable interface
   public Int32 CompareTo(Object other) {
      Point p = (Point) other;

      Double thisDistanceFromOrigin = Math.Sqrt(x * x + y * y);
      Double otherDistanceFromOrigin = Math.Sqrt(p.x * p.x + p.y * p.y);

      return(Math.Sign(thisDistanceFromOrigin - otherDistanceFromOrigin));
   }

   public override String ToString() {
      return(String.Format("({0}, {1})", x, y));
   }
}


class App {
   static void Main() {
      Point[] points = new Point[5];
      points[0] = new Point(2, 2);
      points[1] = new Point(3, 2);
      points[2] = new Point(2, 3);
      points[3] = new Point(7, 8);
      points[4] = new Point(0, 1);

      Array.Sort(points);

      // Display all the elements in the array
      for (Int32 i = 0; i < points.Length; i++) 
         Console.WriteLine("Point {0}: {1}", i, points[i]);

      Console.Write("Press Enter to close window...");
      Console.Read();
   }
}