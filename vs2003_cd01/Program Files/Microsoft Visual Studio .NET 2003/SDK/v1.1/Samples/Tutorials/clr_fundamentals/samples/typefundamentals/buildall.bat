IF NOT EXIST OBJECTBASETYPE\BUILDALL.BAT GOTO OBJECTBASETYPEEND
  CD OBJECTBASETYPE
  CALL BUILDALL.BAT %1
  CD ..
:OBJECTBASETYPEEND

IF NOT EXIST REFANDVALUETYPES\BUILDALL.BAT GOTO REFANDVALUETYPES
  CD REFANDVALUETYPES
  CALL BUILDALL.BAT %1
  CD ..
:REFANDVALUETYPES

