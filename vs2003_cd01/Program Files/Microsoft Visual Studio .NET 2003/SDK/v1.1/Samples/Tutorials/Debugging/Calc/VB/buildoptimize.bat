cd math
vbc /target:library /debug /d:TRACE=True /out:math.dll math.vb

cd..
vbc /target:module /debug /optimize /d:TRACE=True Parser.vb

vbc /target:winexe /debug /optimize /out:Calc.exe /addmodule:parser.netmodule /r:System.Windows.Forms.dll /r:System.Drawing.dll /r:System.dll /r:math\math.dll /d:TRACE=1 Calc.vb 