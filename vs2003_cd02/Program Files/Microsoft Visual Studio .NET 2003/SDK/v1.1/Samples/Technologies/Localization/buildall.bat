IF NOT EXIST CustomCulture\BUILDALL.BAT GOTO CUSTOMCULTUREEND
  CD CustomCulture
  CALL BUILDALL.BAT %1
  CD ..
:CUSTOMCULTUREEND

IF NOT EXIST StringWalker\BUILDALL.BAT GOTO STRINGWALKEREND
  CD STRINGWALKER
  CALL BUILDALL.BAT %1
  CD ..
:STRINGWALKEREND

