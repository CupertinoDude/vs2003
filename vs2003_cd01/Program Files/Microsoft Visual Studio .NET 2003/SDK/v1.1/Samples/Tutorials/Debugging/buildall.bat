IF NOT EXIST ASPX\BUILD.BAT GOTO ASPXEND
  CD ASPX
  CALL BUILD.BAT %1
  CD ..
:ASPXEND

IF NOT EXIST Calc\BUILDALL.BAT GOTO CALCEND
  CD Calc
  CALL BUILDALL.BAT %1
  CD ..
:CALCEND
