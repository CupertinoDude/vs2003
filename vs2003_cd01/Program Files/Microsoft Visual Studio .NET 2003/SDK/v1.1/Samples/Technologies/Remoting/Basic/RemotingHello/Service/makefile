all: Hello.dll  DirectHostService

Hello.dll: HelloService.cs
  csc /debug+ /t:library /out:Hello.dll HelloService.cs
  copy Hello.dll ..\bin
  
DirectHostService:
  cd $*
  nmake -a all
  cd ..
