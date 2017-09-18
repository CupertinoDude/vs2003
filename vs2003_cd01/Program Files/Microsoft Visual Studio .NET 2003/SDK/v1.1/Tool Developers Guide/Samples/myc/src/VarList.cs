namespace MyC
{
using System;
using System.Collections;

public class VarList
  {
  Hashtable vhash;
  int vindex;

  public VarList()
    {
    vhash = new Hashtable(8);	// arbitrary initial size
    vindex = 0;			// init the index count
    }

  public void add(Var e)
    {
    int index = vindex++;
    e.setIndex(index);
    vhash.Add(e.getName(), e);
    vhash.Add(index, e);
    }

  public Var FindByName(String s)
    {
    Object o = vhash[s];
    if (o == null)
      return null;
    return ((Var)o);
    }

  public Var FindByIndex(int i)
    {
    Object x = i;
    Object o = vhash[x];
    if (o == null)
      return null;
    return (Var)o;
    }

  public int Length()
    {
    return vindex;		// number of items in hash
    }
  }
  }
