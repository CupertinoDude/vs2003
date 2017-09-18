all: ProxyWithReturnMessage.exe ProxyWithCustomCasting.exe ProxyWiredToHttpChannel.exe

ProxyWithReturnMessage.exe: ProxyWithReturnMessage.cs
	csc /debug+ ProxyWithReturnMessage.cs

ProxyWithCustomCasting.exe: ProxyWithCustomCasting.cs
	csc /debug+ ProxyWithCustomCasting.cs

Hello.dll:
  cd ..\..\Basic\RemotingHello\Service
  nmake
  cd ..\..\..\advanced\CustomProxies
  copy ..\..\basic\RemotingHello\bin\Hello.dll

ProxyWiredToHttpChannel.exe: Hello.dll ProxyWiredToHttpChannel.cs
	csc /debug+ /r:Hello.dll /r:System.Runtime.Remoting.dll ProxyWiredToHttpChannel.cs

run:
	ProxyWithReturnMessage.exe 
	ProxyWithCustomCasting.exe 
	ProxyWiredToHttpChannel.exe