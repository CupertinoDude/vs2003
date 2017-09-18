namespace MyC
{
 
/*
 * My simple C compiler
 *
 * Brad Merrill
 * 17-Apr-1999
 */
using System;

public class MyC
{
public const int MAXBUF = 512;
public const int MAXSTR = 128;

/* main program */
public static void Main()
  {
  try
    {
    String[] args = Environment.GetCommandLineArgs();
    Io prog = new Io(args);
    Tok tok = new Tok(prog);
    Parse p = new Parse(prog, tok);
    p.program();
    prog.Finish();
    }
  catch (Exception e)
    {
    Console.WriteLine("Compiler aborting: "+e.ToString());
    }
  }
}
}
