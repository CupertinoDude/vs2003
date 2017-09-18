all : SoapMessageClient.exe PlanetEarth.exe

SoapMessageClient.exe : SoapMessageClient.cs
 csc /debug+ SoapMessageClient.cs /r:System.dll /r:System.Runtime.Serialization.Formatters.Soap.dll 
 
PlanetEarth.exe : PlanetEarth.cs
 csc /debug+ PlanetEarth.cs /r:System.dll /r:System.Runtime.Serialization.Formatters.Soap.dll 

run:
  SoapMessageClient.exe
  PlanetEarth.exe
  