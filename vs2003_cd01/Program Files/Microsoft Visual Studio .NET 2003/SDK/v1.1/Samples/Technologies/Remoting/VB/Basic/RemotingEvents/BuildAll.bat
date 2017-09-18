IF NOT EXIST EventSink\BUILD.BAT GOTO EventSinkEND
  CD EventSink
  CALL BUILD.BAT %1
  CD ..
:EventSinkEND

IF NOT EXIST EventFire\BUILD.BAT GOTO EventFireEND
  CD EventFire
  CALL BUILD.BAT %1
  CD ..
:EventFireEND

IF NOT EXIST EventRegistration\BUILD.BAT GOTO EventRegistrationEND
  CD EventRegistration
  CALL BUILD.BAT %1
  CD ..
:EventRegistrationEND

IF NOT EXIST CLIENT\BUILD.BAT GOTO CLIENTEND
  CD CLIENT
  CALL BUILD.BAT %1
  CD ..
:CLENTEND

