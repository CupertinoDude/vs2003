IF NOT EXIST ConsoleClient\BUILD.BAT GOTO CONSOLECLIENTEND
  CD CONSOLECLIENT
  CALL BUILD.BAT %1
  CD ..
:CONSOLECLIENTEND

IF NOT EXIST ConsoleClientAll\BUILD.BAT GOTO ConsoleClientAllEND
  CD ConsoleClientAll
  CALL BUILD.BAT %1
  CD ..
:ConsoleClientAllEND

IF NOT EXIST ConsoleClientDirect\BUILD.BAT GOTO ConsoleClientDirectEND
  CD ConsoleClientDirect
  CALL BUILD.BAT %1
  CD ..
:ConsoleClientDirectEND

IF NOT EXIST RemotingHelloWebClient\BUILD.BAT GOTO RemotingHelloWebClient
  CD RemotingHelloWebClient
  CALL BUILD.BAT %1
  CD ..
:RemotingHelloWebClientEND


