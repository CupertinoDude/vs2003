IF NOT EXIST 1_HelloWorld\BUILD.BAT GOTO 1END
  CD 1_HelloWorld
  CALL BUILD.BAT %1
  CD ..
:1END

IF NOT EXIST 2_Simple\BUILD.BAT GOTO 2END
  CD 2_Simple 
  CALL BUILD.BAT %1
  CD ..
:2END

IF NOT EXIST 3_SimplePath\BUILD.BAT GOTO 3END
  CD 3_SimplePath 
  CALL BUILD.BAT %1
  CD ..
:3END

IF NOT EXIST 4_Shared\BUILD.BAT GOTO 4END
  CD 4_Shared 
  CALL BUILD.BAT %1
  CD ..
:4END

IF NOT EXIST 5_Versioned\BUILD.BAT GOTO 5END
  CD 5_Versioned
  CALL BUILD.BAT %1
  CD ..
:5END

