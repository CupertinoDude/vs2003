
echo "Registering Analyzer dlls..."
regsvr32 -s vadec.dll
regsvr32 -s vaesa.dll
regsvr32 -s vaesi.dll
regsvr32 -s vaevtobj.dll
regsvr32 -s vaiea.dll
regsvr32 -s vaiec.dll
regsvr32 -s valmp.dll
regsvr32 -s vamec.dll
regsvr32 -s vapds.dll
regsvr32 -s vasei.dll

regsvr32 -s Bridges\COMPLUS\vamts.dll

regsvr32 -s VAPkg\vavsa.dll


echo "Registering Analyzer executables..."
valec.exe /RegServer
vapec.exe /RegServer

Bridges\WMI\vawmiec.exe /RegServer


echo "Analyzer special settings..."
vsareg.exe

echo "Analyzer registration complete."