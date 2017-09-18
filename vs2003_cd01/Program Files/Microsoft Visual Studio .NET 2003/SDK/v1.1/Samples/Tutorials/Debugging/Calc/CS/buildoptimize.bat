cd math
csc /target:library /debug /d:TRACE /out:math.dll math.cs

cd..
csc /target:module /optimize /debug /d:TRACE Parser.cs

csc /target:winexe /optimize /debug /out:Calc.exe /addmodule:parser.netmodule /r:System.Windows.Forms.dll /r:System.Drawing.dll /r:System.dll /r:math\math.dll /d:TRACE Calc.cs 