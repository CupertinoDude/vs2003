// --------------------------------------------------------------------------
//  StringWalker class: this string encapsulates string operations in order
//  to provide easy methods that handle surrogates and combining characters
// --------------------------------------------------------------------------

using System;
using System.Globalization;
using System.Text;

namespace StringWalker
{
  public class StringWalkerException : Exception
  {
    public StringWalkerException()           : base()     {}
    public StringWalkerException(String str) : base(str)  {}
  }

	public class StringWalker
	{
    // private members
    private string myString = String.Empty;
    private int[]  myIndex;
    private int    myPos;

    // public property
    public int Length
    {
      get 
      {
        return (null != myIndex) ? myIndex.Length : 0;
      }
    }

    // constructor
		public StringWalker(string str)
		{
      Initialize(str);
		}

    // ToString overriden method
    public override string ToString()
    {
      return myString;
    }

    // "easy" walking methods: GetFirst, GetNext, GetPrev, GetLast, Get
    // these are basically wrapper around the GetSubString method
    public bool GetFirst(out string str)
    {
      myPos = 0;
      return Get(myPos, out str);
    }

    public bool GetLast(out string str)
    {
      myPos = Length - 1;
      return Get(myPos, out str);
    }

    public bool GetNext(out string str)
    {
      return Get(++myPos, out str);
    }

    public bool GetPrev(out string str)
    {
      return Get(--myPos, out str);
    }

    public bool Get(int index, out string str)
    {
      return (0 != GetSubString(index, 1, out str));
    }

    // GetSubString method
    public int GetSubString(int index, int count, out string str)
    {
      // check for index within bounds and non zero count
      if((1 <= count) && (0 <= index ) && (index < Length))
      {
        try
        {
          int lastindex = index + count;

          // if we are past the last char, then we get the string
          // up to the last char and return the actual count
          if(lastindex > (Length - 1))
          {
            str = myString.Substring(myIndex[index]);
            return Length - index;
          }
          else
          {
            str = myString.Substring(myIndex[index], myIndex[lastindex] - myIndex[index]);
            return count;
          }      
        }
        catch // catch all and throw our exception
        {
          throw(new StringWalkerException());
        }
      }

      else
      {
        str = String.Empty;
        return 0;
      }
    }

    // Insert, Remove: both methods return true if the operation was succesful and false otherwise

    // Insert: inserts a string at the specified position
    public bool Insert(int index, string str)
    {
      if((0 <= index) && (index <= Length))
      {
        try
        {
          if(index == Length)
            Initialize(myString.Insert(myString.Length, str));
          else
            Initialize(myString.Insert(myIndex[index], str));
          return true;
        }
        catch // catch all and throw our exception
        {
          throw(new StringWalkerException());
        }
      }
      return false;
    }

    // Remove: removes the specified number of text elements starting at the specified position
    public bool Remove(int index, int count)
    {
      if((count > 0) && (0 <= index) && (index < Length))
      {
        try
        {
          int idxLast = index + count;
          int charcount = (idxLast < Length) ? myIndex[idxLast] - myIndex[index] : myString.Length - myIndex[index];
          Initialize(myString.Remove(myIndex[index], charcount));
          return true;
        }
        catch // catch all and throw our exception
        {
          throw(new StringWalkerException());
        }
      }
      return false;
    }

    // IndexOf: 
    public int IndexOf(string str, int index)
    {
      if((0 <= index) && (index < Length))
      {
        try
        {
          // try and find the input string in the current string
          int position = myIndex[index];
          int foundAt  = myString.IndexOf(str, position);

          // if the string is found, then we need to see if it
          // can be matched to a text element index.
          if(-1 != foundAt)
          {
            for(int i = 0; i < myIndex.Length; i++)
              if(myIndex[i] == foundAt)
                return i;
          }
        }
        catch // catch all and throw our exception
        {
          throw(new StringWalkerException());
        }
      } 
      return -1;
    }

    // private initialization method
    private void Initialize(string str)
    {
      try
      {
        myPos    = 0;
        myString = str;
        myIndex  = StringInfo.ParseCombiningCharacters(myString);
      }
      catch(ArgumentNullException)
      {
        throw(new StringWalkerException());
      }
    }
  }
}
