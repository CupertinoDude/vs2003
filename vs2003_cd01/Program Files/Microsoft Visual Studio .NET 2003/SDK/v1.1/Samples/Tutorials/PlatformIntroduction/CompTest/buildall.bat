IF NOT EXIST CompCS\BUILD.BAT GOTO COMPCSEND
  CD CompCS 
  CALL BUILD.BAT %1
  CD ..
:COMPCSEND


IF NOT EXIST CompVB\BUILD.BAT GOTO COMPVBEND
  CD CompVB 
  CALL BUILD.BAT %1
  CD ..
:COMPVBEND


IF NOT EXIST CompVC\BUILD.BAT GOTO COMPVCEND
  CD CompVC 
  CALL BUILD.BAT %1
  CD ..
:COMPVCEND


IF NOT EXIST ClientASP\BUILD.BAT GOTO CLIENTASPEND
  CD ClientASP 
  CALL BUILD.BAT %1
  CD ..
:CLIENTASPEND


IF NOT EXIST ClientCS\BUILD.BAT GOTO CLIENTCSEND
  CD ClientCS 
  CALL BUILD.BAT %1
  CD ..
:CLIENTCSEND


IF NOT EXIST ClientVB\BUILD.BAT GOTO CLIENTVBEND
  CD ClientVB 
  CALL BUILD.BAT %1
  CD ..
:CLIENTVBEND


IF NOT EXIST ClientVC\BUILD.BAT GOTO CLIENTVCEND
  CD ClientVC 
  CALL BUILD.BAT %1
  CD ..
:CLIENTVCEND


IF NOT EXIST ClientWinForms\BUILD.BAT GOTO CLIENTWINFORMSEND
  CD ClientWinForms
  CALL BUILD.BAT %1
  CD ..
:CLIENTWINFORMSEND

IF NOT EXIST CreateVRoot.vbs GOTO CREATEVROOTEND
  CreateVRoot.vbs -q
:CREATEVROOTEND