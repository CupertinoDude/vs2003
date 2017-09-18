
echo "Registering Analyzer dlls..."
regsvr32 -s vadec.dll
regsvr32 -s vaesa.dll
regsvr32 -s vaesi.dll
regsvr32 -s vaiea.dll
regsvr32 -s vaiec.dll
regsvr32 -s valmp.dll
regsvr32 -s vamec.dll
regsvr32 -s vapds.dll
regsvr32 -s vasei.dll
regsvr32 -s vavsa.dll

regsvr32  -s Bridges\COMPLUS\vamts.dll

echo "Registering Analyzer executables..."
valec.exe /RegServer
varpc.exe /RegServer

echo "Analyzer special settings..."
vsareg.exe
