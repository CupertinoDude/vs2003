IF NOT EXIST SERVICE\BUILD.BAT GOTO SERVICEEND
  CD SERVICE
  CALL BUILD.BAT %1
  CD ..
:SERVICEEND

IF NOT EXIST CLIENT\BUILDAll.BAT GOTO CLIENTEND
  CD CLIENT
  CALL BUILDAll.BAT %1
  CD ..
:CLIENTEND

