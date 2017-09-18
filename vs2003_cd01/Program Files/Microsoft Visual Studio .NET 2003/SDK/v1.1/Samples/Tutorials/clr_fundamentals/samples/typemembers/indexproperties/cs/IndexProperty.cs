using System;
using System.Collections;

class BitArray {
   Int32 numBits;
   Byte[] array;

   public BitArray(Int32 numBits) {
      this.numBits = numBits;
      array = new Byte[(numBits + 7) / 8];
   }

   public Boolean this[Int32 bit] {
      get {
         if (bit < 0 || bit >= numBits)
            throw new ArgumentOutOfRangeException("bit must be between 0 and " + numBits);
         return((array[bit / 8] & (1 << (bit % 8))) != 0);
      }
      set {
         if (bit < 0 || bit >= numBits)
            throw new ArgumentOutOfRangeException("bit must be between 0 and " + numBits);
         if (value) {
            array[bit / 8] = (Byte) (array[bit / 8] | (1 << (bit % 8)));
         } else {
            array[bit / 8] = (Byte) (array[bit / 8] & ~(1 << (bit % 8)));
         }
      }
   }
}


class App {
   static void Main() {
      BitArray ba = new BitArray(14);
      for (int bit = 0; bit < 14; bit++) {
         // Set the first 7 bits to On, the rest to Off
         ba[bit] = bit < 7;
      }

      for (int bit = 0; bit < 14; bit++) {
         // Show the value of each bit in the array
         Console.WriteLine("Bit {0} is {1}", bit, ba[bit] ? "On" : "Off");
      }

      Console.Write("Press Enter to close window...");
      Console.Read();
   }
}
