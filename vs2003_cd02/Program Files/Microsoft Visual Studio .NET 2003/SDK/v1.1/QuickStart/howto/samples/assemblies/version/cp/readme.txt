You need to register the calcr.dll's into global assembly cache for this to work.

The command to register them are,

gacutil -i calcr.dll

And if you generate a private key of your own (sn -k mathkey.snk), you should get the key out of it and paste it into the config file (math.exe.config). While the shfusion.dll lets you easily see this number in windows explorer, there is no easy way to cut and paste it into text file.

An easier way to get the number might be to, run gacutil (gacutil -l), which will list out all the installed assemblies and then you can cut and paste from that console window.