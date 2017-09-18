using System;

namespace LexToken 
{
    
    enum TokenType {
	NUMBER = 0,
	ALPHA = 1,
	PLUS = 2,
	MINUS = 3,
	MUL = 4,
	DIVIDE = 5,
	LPAREN = 6,
	RPAREN = 7,
	QUOTE = 8,
	CAR = 9,
	CDR = 10,
	CONS = 11,
	SUBST = 12,
	STRING = 13,
	DEFUN = 14,
	SETQ  = 15,
	NIL   = 16,
	NULL  = 17,
	IF    = 18,
	ATOM  = 19,
	DO = 20,
	LT = 21,
	GT = 22,
	EQ = 23,
	LE = 24,
	GE = 25,
	EOFSYM = 0xFF
    }




    class Token {
	public TokenType Type;

	public Token(TokenType t)
	{
	    Type = t;
	}

	public override String ToString()
	{
	    return (Type.ToString());
	}
    }

    class NumberToken: Token
    {
	public long Value;
    
	public NumberToken(String val) : base(TokenType.NUMBER)
	{
	    Value = Convert.ToInt64(val);
	}
    
	public override String ToString()
	{
	    return (Type.ToString() + ", value =" + Value);
	}
    
    }

    class AlphaToken : Token
    {
	public String Name;
    
	public AlphaToken(String n) : base (TokenType.ALPHA)
	{
	    Name = n;
	}
    

	public override String ToString()
	{
	    return (Type.ToString() + ", Name =" + Name);
	}
    }

    class StringToken : Token
    {
	public String Value;
    
	public StringToken(String v) : base (TokenType.STRING)
	{
	    Value = v;
	}

	public override String ToString()
	{
	    return (Type.ToString() + ", Value =" + Value);
	}
	
    }
 
}

