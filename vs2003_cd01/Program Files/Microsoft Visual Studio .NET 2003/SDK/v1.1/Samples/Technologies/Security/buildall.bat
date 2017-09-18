IF NOT EXIST PublicKeyCryptography\BUILDALL.BAT GOTO PublicKeyCryptographyEND
  CD PublicKeyCryptography
  CALL BUILDALL.BAT %1
  CD ..
:PublicKeyCryptographyEND
