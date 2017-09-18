cd math
csc /target:library /debug+ /d:TRACE math.cs

cd..
csc /target:module /debug+ /d:TRACE Parser.cs

csc /target:winexe /debug+ /d:TRACE /addmodule:parser.netmodule /r:System.Windows.Forms.dll /r:System.Drawing.dll /r:System.dll /r:math\math.dll Calc.cs 