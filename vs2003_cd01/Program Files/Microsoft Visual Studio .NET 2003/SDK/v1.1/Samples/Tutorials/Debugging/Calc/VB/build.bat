cd math
vbc /target:library /debug+ /d:TRACE=True math.vb

cd..
vbc /target:module /debug+ /d:TRACE=True Parser.vb

vbc /target:winexe /debug+ /d:TRACE=1 /addmodule:parser.netmodule /r:System.Windows.Forms.dll /r:System.Drawing.dll /r:System.dll /r:math\math.dll Calc.vb 