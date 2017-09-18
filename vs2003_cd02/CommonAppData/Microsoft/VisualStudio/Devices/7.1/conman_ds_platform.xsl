<?xml version="1.0" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
<PLATFORMS xmlns:dt="urn:schemas-microsoft-com:datatypes" xmlns="urn:platform-schema" ReadOnly="false" Protected="false" Version="7.10.3077.0">

<xsl:element name="PLATFORM">
	<xsl:attribute name="Name">
		<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PLATNAME_WINDOWS_CE"/>
	</xsl:attribute>
	<xsl:attribute name="InvariantName">Windows CE</xsl:attribute>
	<xsl:attribute name="ReadOnly">true</xsl:attribute>
	<xsl:attribute name="Protected">true</xsl:attribute>
	<xsl:attribute name="xmlns"></xsl:attribute>

	<xsl:element name="DEVICE">
		<xsl:attribute name="Name">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_DEVICENAME_WINDOWS_CE_EMULATOR"/>
		</xsl:attribute>
		<xsl:attribute name="InvariantName">Windows CE Emulator</xsl:attribute>
		<xsl:attribute name="ReadOnly">false</xsl:attribute>
		<xsl:attribute name="Protected">true</xsl:attribute>
		<PROPERTY Name="OS_Version" ReadOnly="false" Protected="false">4000</PROPERTY>
		<PROPERTY Name="OS" ReadOnly="false" Protected="false">default</PROPERTY>
		<PROPERTY Name="CurrentTransport" ReadOnly="false" Protected="false">emulator</PROPERTY>
		<PROPERTY Name="CurrentStartup" ReadOnly="false" Protected="true">emulator</PROPERTY>
		<PROPERTY Name="LocalClientFile" ReadOnly="true" Protected="true">$deviceBins$\wce400\%cpu%\ConManClient.exe</PROPERTY>
		<TRANSPORTSETTINGS Name="Default" ReadOnly="false" Protected="false">
		<xsl:element name="TRANSPORT">
			<xsl:attribute name="Name">
				<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_TRANSPORTNAME_EMULATION"/>
			</xsl:attribute>
			<xsl:attribute name="InvariantName">Emulation</xsl:attribute>
			<xsl:attribute name="ReadOnly">true</xsl:attribute>
			<xsl:attribute name="Protected">true</xsl:attribute>
			<PROPERTY Name="default" ReadOnly="true" Protected="true">no</PROPERTY>
			<PROPERTY Name="type" ReadOnly="true" Protected="true">emulator</PROPERTY>
			<PROPERTY Name="LocalTransportFile" Protected="true">$deviceBins$\wce400\%cpu%\cmtnpt_emulator.dll</PROPERTY>
			<PROPERTY Name="RemoteTransportFile" Protected="true">\windows\cmtnpt_emulator.dll</PROPERTY>
			<PROPERTY Name="VMID" ReadOnly="true" Protected="true">{72485E59-CA63-491c-95CB-C45AE6D3BBA9}</PROPERTY>
			<PROPERTY Name="DMA_CHANNEL" ReadOnly="true" Protected="true">6</PROPERTY>
			<PROPERTY Name="disableauthentication" ReadOnly="true" Protected="true">yes</PROPERTY>
		</xsl:element>
		</TRANSPORTSETTINGS>
		<STARTUPSETTINGS Name="Default" ReadOnly="false" Protected="true">
		<xsl:element name="STARTUP">
			<xsl:attribute name="Name">
				<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_STARTUPNAME_EMULATIONSTARTUPPROVIDER"/>
			</xsl:attribute>
			<xsl:attribute name="InvariantName">Emulation Startup Provider</xsl:attribute>
			<xsl:attribute name="ReadOnly">false</xsl:attribute>
			<xsl:attribute name="Protected">true</xsl:attribute>
			<PROPERTY Name="default" ReadOnly="true" Protected="true">no</PROPERTY>
			<PROPERTY Name="type" ReadOnly="true" Protected="true">emulator</PROPERTY>
			<PROPERTY Name="OSBootTime" ReadOnly="true" Protected="true">6000</PROPERTY>
			<PROPERTY Name="OSRestoreTime" ReadOnly="true" Protected="true">2000</PROPERTY>
			<PROPERTY Name="VMID" ReadOnly="true" Protected="true">{72485E59-CA63-491c-95CB-C45AE6D3BBA9}</PROPERTY>
			<PROPERTY Name="OSBinImage" ReadOnly="false" Protected="true">$emuImages$\Images\WindowsCE\WebPad\<xsl:value-of select="LANGUAGE/DEFAULT/DEFAULT_EMULATOR_LCID"/>\WCE4WebPad.bin</PROPERTY>
			<PROPERTY Name="ScreenWidth" ReadOnly="false" Protected="true">640</PROPERTY>
			<PROPERTY Name="ScreenHeight" ReadOnly="false" Protected="true">480</PROPERTY>
			<PROPERTY Name="ColorDepth" ReadOnly="false" Protected="true">16</PROPERTY>
			<PROPERTY Name="EthernetEnabled" ReadOnly="false" Protected="true">yes</PROPERTY>
			<PROPERTY Name="MemSize" ReadOnly="false" Protected="true">32</PROPERTY>
			<PROPERTY Name="HostKey" ReadOnly="false" Protected="true">165</PROPERTY>
			<PROPERTY Name="SerialPort1" ReadOnly="false" Protected="true">none</PROPERTY>
			<PROPERTY Name="SerialPort2" ReadOnly="false" Protected="true">none</PROPERTY>
			<PROPERTY Name="ParallelPort" ReadOnly="false" Protected="true">none</PROPERTY>
			<PROPERTY Name="Skin" ReadOnly="false" Protected="true"></PROPERTY>
			<PROPERTY Name="SkinEngine" ReadOnly="true" Protected="true">$dynamicAssemblies$\skin.dll</PROPERTY>
		</xsl:element>
		</STARTUPSETTINGS>
	</xsl:element>

	<xsl:element name="DEVICE">
		<xsl:attribute name="Name">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_DEVICENAME_WINDOWS_CE"/>
		</xsl:attribute>
		<xsl:attribute name="InvariantName">Windows CE Device</xsl:attribute>
		<xsl:attribute name="ReadOnly">false</xsl:attribute>
		<xsl:attribute name="Protected">true</xsl:attribute>
		<PROPERTY Name="OS_Version" ReadOnly="false" Protected="false">4000</PROPERTY>
		<PROPERTY Name="OS" ReadOnly="false" Protected="false">default</PROPERTY>
		<PROPERTY Name="CurrentTransport" ReadOnly="false" Protected="false">tcp_connect</PROPERTY>
		<PROPERTY Name="CurrentStartup" ReadOnly="false" Protected="true">activesync</PROPERTY>
		<PROPERTY Name="LocalClientFile" ReadOnly="true" Protected="true">$deviceBins$\wce400\%cpu%\ConManClient.exe</PROPERTY>
		<TRANSPORTSETTINGS Name="Default" ReadOnly="false" Protected="false">
		<xsl:element name="TRANSPORT">
			<xsl:attribute name="Name">
				<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_TRANSPORTNAME_TCPCONNECT"/>
			</xsl:attribute>
			<xsl:attribute name="InvariantName">TCP Connect Transport</xsl:attribute>
			<xsl:attribute name="ReadOnly">false</xsl:attribute>
			<xsl:attribute name="Protected">true</xsl:attribute>
			<PROPERTY Name="default" ReadOnly="true" Protected="true">no</PROPERTY>
			<PROPERTY Name="type" ReadOnly="true" Protected="true">tcp_connect</PROPERTY>
			<PROPERTY Name="ip" ReadOnly="false" Protected="true">127.0.0.1</PROPERTY>
			<PROPERTY Name="port" ReadOnly="false" Protected="true">5656</PROPERTY>
			<PROPERTY Name="useAutoAddress" ReadOnly="false" Protected="true">yes</PROPERTY>
			<PROPERTY Name="useCustomPort" ReadOnly="false" Protected="true">no</PROPERTY>
			<PROPERTY Name="LocalTransportFile" Protected="true">$deviceBins$\wce400\%cpu%\cmtnpt_tcpaccept.dll</PROPERTY>
			<PROPERTY Name="RemoteTransportFile" Protected="true">\windows\cmtnpt_tcpaccept.dll</PROPERTY>
		</xsl:element>
		<xsl:element name="TRANSPORT">
			<xsl:attribute name="Name">
				<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_TRANSPORTNAME_IRDA"/>
			</xsl:attribute>
			<xsl:attribute name="InvariantName">IrDA Transport</xsl:attribute>
			<xsl:attribute name="ReadOnly">true</xsl:attribute>
			<xsl:attribute name="Protected">true</xsl:attribute>
			<PROPERTY Name="default" ReadOnly="true" Protected="true">no</PROPERTY>
			<PROPERTY Name="type" ReadOnly="true" Protected="true">irda</PROPERTY>
			<PROPERTY Name="LocalTransportFile" Protected="true">$deviceBins$\wce400\%cpu%\cmtnpt_irdaconnect.dll</PROPERTY>
			<PROPERTY Name="RemoteTransportFile" Protected="true">\windows\cmtnpt_irdaconnect.dll</PROPERTY>
		</xsl:element>
		</TRANSPORTSETTINGS>
		<STARTUPSETTINGS Name="Default" ReadOnly="false" Protected="true">
		<xsl:element name="STARTUP">
			<xsl:attribute name="Name">
				<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_STARTUPNAME_ACTIVESYNC"/>
			</xsl:attribute>
			<xsl:attribute name="InvariantName">ActiveSync Startup Provider</xsl:attribute>
			<xsl:attribute name="ReadOnly">true</xsl:attribute>
			<xsl:attribute name="Protected">true</xsl:attribute>
			<PROPERTY Name="default" ReadOnly="true" Protected="true">no</PROPERTY>
			<PROPERTY Name="type" ReadOnly="true" Protected="true">activesync</PROPERTY>
		</xsl:element>
		</STARTUPSETTINGS>
	</xsl:element>

    <TYPE_TO_ARCHITECTURE_MAP  Name="Default" ReadOnly="true" Protected="true">
		<PROPERTY Name="83951616"  ReadOnly="true" Protected="true">ARMV4</PROPERTY>
		<PROPERTY Name="84082688"  ReadOnly="true" Protected="true">ARMV4T</PROPERTY>
		<PROPERTY Name="84017152"  ReadOnly="true" Protected="true">ARMV4T</PROPERTY>
		<PROPERTY Name="67174400"  ReadOnly="true" Protected="true">SH3</PROPERTY>
		<PROPERTY Name="67174401"  ReadOnly="true" Protected="true">SH3</PROPERTY>
		<PROPERTY Name="67239937"  ReadOnly="true" Protected="true">SH4</PROPERTY>
		<PROPERTY Name="16842752"  ReadOnly="true" Protected="true">MIPS16</PROPERTY>
		<PROPERTY Name="16908288"  ReadOnly="true" Protected="true">MIPSII</PROPERTY>
		<PROPERTY Name="16908289"  ReadOnly="true" Protected="true">MIPSII_FP</PROPERTY>
		<PROPERTY Name="16973824"  ReadOnly="true" Protected="true">MIPSIV</PROPERTY>
		<PROPERTY Name="16973825"  ReadOnly="true" Protected="true">MIPSIV_FP</PROPERTY>
		<PROPERTY Name="65537"  ReadOnly="true" Protected="true">X86</PROPERTY>
    </TYPE_TO_ARCHITECTURE_MAP>

    <PROJECTS Name="Default" ReadOnly="false" Protected="false">
	<xsl:element name="PROJECT">
		<xsl:attribute name="Name">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PROJECTNAME_WINDOWSAPP"/>
		</xsl:attribute>
		<xsl:attribute name="Directory">Windows Application</xsl:attribute>
		<xsl:attribute name="ReadOnly">false</xsl:attribute>
		<xsl:attribute name="Protected">false</xsl:attribute>
		<xsl:attribute name="SortIndex">10</xsl:attribute>
		<xsl:attribute name="Default">false</xsl:attribute>
	</xsl:element>
	<xsl:element name="PROJECT">
		<xsl:attribute name="Name">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PROJECTNAME_CLASSLIBRARY"/>
		</xsl:attribute>
		<xsl:attribute name="Directory">Class Library</xsl:attribute>
		<xsl:attribute name="ReadOnly">false</xsl:attribute>
		<xsl:attribute name="Protected">false</xsl:attribute>
		<xsl:attribute name="SortIndex">20</xsl:attribute>
		<xsl:attribute name="Default">false</xsl:attribute>
	</xsl:element>
	<xsl:element name="PROJECT">
		<xsl:attribute name="Name">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PROJECTNAME_CONSOLEAPP"/>
		</xsl:attribute>
		<xsl:attribute name="Directory">Console Application</xsl:attribute>
		<xsl:attribute name="ReadOnly">false</xsl:attribute>
		<xsl:attribute name="Protected">false</xsl:attribute>
		<xsl:attribute name="SortIndex">40</xsl:attribute>
		<xsl:attribute name="Default">false</xsl:attribute>
	</xsl:element>
	<xsl:element name="PROJECT">
		<xsl:attribute name="Name">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PROJECTNAME_EMPTY"/>
		</xsl:attribute>
		<xsl:attribute name="Directory">Empty Project</xsl:attribute>
		<xsl:attribute name="ReadOnly">false</xsl:attribute>
		<xsl:attribute name="Protected">false</xsl:attribute>
		<xsl:attribute name="SortIndex">50</xsl:attribute>
		<xsl:attribute name="Default">false</xsl:attribute>
	</xsl:element>
	</PROJECTS>

    <PROPERTY Name="OSVersionMin" ReadOnly="false" Protected="false">3.00</PROPERTY>
    <PROPERTY Name="OSVersionMax" ReadOnly="false" Protected="false">4.99</PROPERTY>
    <PROPERTY Name="Profile" ReadOnly="true" Protected="true">yes</PROPERTY>
    <PROPERTY Name="SupportedProfile" ReadOnly="true" Protected="true">Generic Compact Profile</PROPERTY>
    <PROPERTY Name="COM+ReferenceDir" ReadOnly="true" Protected="true">$com+$\Windows CE</PROPERTY>
    <PROPERTY Name=".NET_Version" ReadOnly="true" Protected="true">v1.0.5000</PROPERTY>
    <PROPERTY Name="DefaultPlatform"  ReadOnly="false" Protected="true">Windows CE</PROPERTY>
    <PROPERTY Name="DefaultDevice"    ReadOnly="false" Protected="true">Windows CE Emulator</PROPERTY>
    <PROPERTY Name="RemoteClientFile" ReadOnly="true" Protected="true">\Windows\ConManClient.exe</PROPERTY>
    <PROPERTY Name="WizardSortOrder" ReadOnly="false" Protected="false">20</PROPERTY>
    <PROPERTY Name="UserListed" ReadOnly="true" Protected="true">yes</PROPERTY>
    <PROPERTY Name="ShortName" ReadOnly="true" Protected="true">WCE4</PROPERTY>
</xsl:element>

<xsl:element name="PLATFORM">
	<xsl:attribute name="Name">
		<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PLATNAME_POCKET_PC"/>
	</xsl:attribute>
	<xsl:attribute name="InvariantName">Pocket PC</xsl:attribute>
	<xsl:attribute name="ReadOnly">true</xsl:attribute>
	<xsl:attribute name="Protected">true</xsl:attribute>
	<xsl:attribute name="xmlns"></xsl:attribute>

	<xsl:element name="DEVICE">
		<xsl:attribute name="Name">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_DEVICENAME_POCKET_PC_EMULATOR"/>
		</xsl:attribute>
		<xsl:attribute name="InvariantName">Pocket PC Emulator</xsl:attribute>
		<xsl:attribute name="ReadOnly">false</xsl:attribute>
		<xsl:attribute name="Protected">true</xsl:attribute>
		<PROPERTY Name="OS_Version" ReadOnly="false" Protected="false">3000</PROPERTY>
		<PROPERTY Name="OS" ReadOnly="false" Protected="false">default</PROPERTY>
		<PROPERTY Name="Platform" ReadOnly="false" Protected="false">default</PROPERTY>
		<PROPERTY Name="CurrentTransport" ReadOnly="false" Protected="false">emulator</PROPERTY>
		<PROPERTY Name="CurrentStartup" ReadOnly="false" Protected="true">emulator</PROPERTY>
		<PROPERTY Name="LocalClientFile" ReadOnly="true" Protected="true">$deviceBins$\wce300\%cpu%\ConManClient.exe</PROPERTY>
		<TRANSPORTSETTINGS Name="Default" ReadOnly="false" Protected="false">
		<xsl:element name="TRANSPORT">
			<xsl:attribute name="Name">
				<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_TRANSPORTNAME_EMULATION"/>
			</xsl:attribute>
			<xsl:attribute name="InvariantName">Emulation</xsl:attribute>
			<xsl:attribute name="ReadOnly">true</xsl:attribute>
			<xsl:attribute name="Protected">true</xsl:attribute>
			<PROPERTY Name="default" ReadOnly="true" Protected="true">no</PROPERTY>
			<PROPERTY Name="type" ReadOnly="true" Protected="true">emulator</PROPERTY>
			<PROPERTY Name="LocalTransportFile" Protected="true">$deviceBins$\wce300\%cpu%\cmtnpt_emulator.dll</PROPERTY>
			<PROPERTY Name="RemoteTransportFile" Protected="true">\windows\cmtnpt_emulator.dll</PROPERTY>
			<PROPERTY Name="VMID" ReadOnly="true" Protected="true">{DE425A95-FBB8-46CB-8DFD-89867130F732}</PROPERTY>
			<PROPERTY Name="DMA_CHANNEL" ReadOnly="true" Protected="true">6</PROPERTY>
			<PROPERTY Name="disableauthentication" ReadOnly="true" Protected="true">yes</PROPERTY>
		</xsl:element>
		</TRANSPORTSETTINGS>
		<STARTUPSETTINGS Name="Default" ReadOnly="false" Protected="true">
		<xsl:element name="STARTUP">
			<xsl:attribute name="Name">
				<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_STARTUPNAME_EMULATIONSTARTUPPROVIDER"/>
			</xsl:attribute>
			<xsl:attribute name="InvariantName">Emulation Startup Provider</xsl:attribute>
			<xsl:attribute name="ReadOnly">false</xsl:attribute>
			<xsl:attribute name="Protected">true</xsl:attribute>
			<PROPERTY Name="default" ReadOnly="true" Protected="true">no</PROPERTY>
			<PROPERTY Name="type" ReadOnly="true" Protected="true">emulator</PROPERTY>
			<PROPERTY Name="OSBootTime" ReadOnly="true" Protected="true">15000</PROPERTY>
			<PROPERTY Name="OSRestoreTime" ReadOnly="true" Protected="true">4000</PROPERTY>
			<PROPERTY Name="VMID" ReadOnly="true" Protected="true">{DE425A95-FBB8-46CB-8DFD-89867130F732}</PROPERTY>
			<PROPERTY Name="OSBinImage" ReadOnly="false" Protected="true">$emuImages$\Images\PocketPC\2002\<xsl:value-of select="LANGUAGE/DEFAULT/DEFAULT_EMULATOR_LCID"/>\PPC2002.bin</PROPERTY>
			<PROPERTY Name="ScreenWidth" ReadOnly="false" Protected="true">240</PROPERTY>
			<PROPERTY Name="ScreenHeight" ReadOnly="false" Protected="true">320</PROPERTY>
			<PROPERTY Name="ColorDepth" ReadOnly="false" Protected="true">16</PROPERTY>
			<PROPERTY Name="EthernetEnabled" ReadOnly="false" Protected="true">yes</PROPERTY>
			<PROPERTY Name="MemSize" ReadOnly="false" Protected="true">32</PROPERTY>
			<PROPERTY Name="HostKey" ReadOnly="false" Protected="true">165</PROPERTY>
			<PROPERTY Name="SerialPort1" ReadOnly="false" Protected="true">none</PROPERTY>
			<PROPERTY Name="SerialPort2" ReadOnly="false" Protected="true">none</PROPERTY>
			<PROPERTY Name="ParallelPort" ReadOnly="false" Protected="true">none</PROPERTY>
			<PROPERTY Name="Skin" ReadOnly="false" Protected="true">$dynamicAssemblies$\Images\PocketPC\2002\<xsl:value-of select="LANGUAGE/DEFAULT/DEFAULT_EMULATOR_LCID"/>\ppc2002.xml</PROPERTY>
			<PROPERTY Name="SkinEngine" ReadOnly="false" Protected="true">$dynamicAssemblies$\skin.dll</PROPERTY>
		</xsl:element>
		</STARTUPSETTINGS>
	</xsl:element>

	<xsl:element name="DEVICE">
		<xsl:attribute name="Name">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_DEVICENAME_POCKET_PC"/>
		</xsl:attribute>
		<xsl:attribute name="InvariantName">Pocket PC Device</xsl:attribute>
		<xsl:attribute name="ReadOnly">false</xsl:attribute>
		<xsl:attribute name="Protected">true</xsl:attribute>
		<PROPERTY Name="OS_Version" ReadOnly="false" Protected="false">3000</PROPERTY>
		<PROPERTY Name="OS" ReadOnly="false" Protected="false">default</PROPERTY>
		<PROPERTY Name="CurrentTransport" ReadOnly="false" Protected="false">tcp_connect</PROPERTY>
		<PROPERTY Name="CurrentStartup" ReadOnly="false" Protected="true">activesync</PROPERTY>
		<PROPERTY Name="LocalClientFile" ReadOnly="true" Protected="true">$deviceBins$\wce300\%cpu%\ConManClient.exe</PROPERTY>
		<TRANSPORTSETTINGS Name="Default" ReadOnly="false" Protected="false">
		<xsl:element name="TRANSPORT">
			<xsl:attribute name="Name">
				<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_TRANSPORTNAME_TCPCONNECT"/>
			</xsl:attribute>
			<xsl:attribute name="InvariantName">TCP Connect Transport</xsl:attribute>
			<xsl:attribute name="ReadOnly">false</xsl:attribute>
			<xsl:attribute name="Protected">true</xsl:attribute>
			<PROPERTY Name="default" ReadOnly="true" Protected="true">no</PROPERTY>
			<PROPERTY Name="type" ReadOnly="true" Protected="true">tcp_connect</PROPERTY>
			<PROPERTY Name="ip" ReadOnly="false" Protected="true">127.0.0.1</PROPERTY>
			<PROPERTY Name="port" ReadOnly="false" Protected="true">5656</PROPERTY>
			<PROPERTY Name="useAutoAddress" ReadOnly="false" Protected="true">yes</PROPERTY>
			<PROPERTY Name="useCustomPort" ReadOnly="false" Protected="true">no</PROPERTY>
			<PROPERTY Name="LocalTransportFile" Protected="true">$deviceBins$\wce300\%cpu%\cmtnpt_tcpaccept.dll</PROPERTY>
			<PROPERTY Name="RemoteTransportFile" Protected="true">\windows\cmtnpt_tcpaccept.dll</PROPERTY>
		</xsl:element>
		<xsl:element name="TRANSPORT">
			<xsl:attribute name="Name">
				<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_TRANSPORTNAME_IRDA"/>
			</xsl:attribute>
			<xsl:attribute name="InvariantName">IrDA Transport</xsl:attribute>
			<xsl:attribute name="ReadOnly">true</xsl:attribute>
			<xsl:attribute name="Protected">true</xsl:attribute>
			<PROPERTY Name="default" ReadOnly="true" Protected="true">no</PROPERTY>
			<PROPERTY Name="type" ReadOnly="true" Protected="true">irda</PROPERTY>
			<PROPERTY Name="LocalTransportFile" Protected="true">$deviceBins$\wce300\%cpu%\cmtnpt_irdaconnect.dll</PROPERTY>
			<PROPERTY Name="RemoteTransportFile" Protected="true">\windows\cmtnpt_irdaconnect.dll</PROPERTY>
		</xsl:element>
		</TRANSPORTSETTINGS>
		<STARTUPSETTINGS Name="Default" ReadOnly="false" Protected="true">
		<xsl:element name="STARTUP">
			<xsl:attribute name="Name">
				<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_STARTUPNAME_ACTIVESYNC"/>
			</xsl:attribute>
			<xsl:attribute name="InvariantName">ActiveSync Startup Provider</xsl:attribute>
			<xsl:attribute name="ReadOnly">true</xsl:attribute>
			<xsl:attribute name="Protected">true</xsl:attribute>
			<PROPERTY Name="default" ReadOnly="true" Protected="true">no</PROPERTY>
			<PROPERTY Name="type" ReadOnly="true" Protected="true">activesync</PROPERTY>
		</xsl:element>
		</STARTUPSETTINGS>
	</xsl:element>

    <TYPE_TO_ARCHITECTURE_MAP  Name="Default" ReadOnly="true" Protected="true">
      <PROPERTY Name="83951616"  ReadOnly="true" Protected="true">ARMV4</PROPERTY>
      <PROPERTY Name="84082688"  ReadOnly="true" Protected="true">ARMV4T</PROPERTY>
      <PROPERTY Name="84017152"  ReadOnly="true" Protected="true">ARMV4T</PROPERTY>
      <PROPERTY Name="2577"  ReadOnly="true" Protected="true">ARM</PROPERTY>
      <PROPERTY Name="1824"  ReadOnly="true" Protected="true">ARM</PROPERTY>
      <PROPERTY Name="2080"  ReadOnly="true" Protected="true">ARM</PROPERTY>
      <PROPERTY Name="2336"  ReadOnly="true" Protected="true">ARM</PROPERTY>
      <PROPERTY Name="70001"  ReadOnly="true" Protected="true">ARM</PROPERTY>
      <PROPERTY Name="10003"  ReadOnly="true" Protected="true">SH3</PROPERTY>
      <PROPERTY Name="10004"  ReadOnly="true" Protected="true">SH3</PROPERTY>
      <PROPERTY Name="103"  ReadOnly="true" Protected="true">SH3</PROPERTY>
      <PROPERTY Name="104"  ReadOnly="true" Protected="true">SH4</PROPERTY>
      <PROPERTY Name="10005"  ReadOnly="true" Protected="true">SH4</PROPERTY>
      <PROPERTY Name="4000"  ReadOnly="true" Protected="true">MIPS</PROPERTY>
      <PROPERTY Name="5000"  ReadOnly="true" Protected="true">MIPS</PROPERTY>
      <PROPERTY Name="386"  ReadOnly="true" Protected="true">X86</PROPERTY>
      <PROPERTY Name="486"  ReadOnly="true" Protected="true">X86</PROPERTY>
      <PROPERTY Name="586"  ReadOnly="true" Protected="true">X86</PROPERTY>
      <PROPERTY Name="686"  ReadOnly="true" Protected="true">X86</PROPERTY>
      <PROPERTY Name="65537"  ReadOnly="true" Protected="true">WCE420X86</PROPERTY>
    </TYPE_TO_ARCHITECTURE_MAP>

    <PROJECTS Name="Default" ReadOnly="false" Protected="false">
	<xsl:element name="PROJECT">
		<xsl:attribute name="Name">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PROJECTNAME_WINDOWSAPP"/>
		</xsl:attribute>
		<xsl:attribute name="Directory">Windows Application</xsl:attribute>
		<xsl:attribute name="ReadOnly">false</xsl:attribute>
		<xsl:attribute name="Protected">false</xsl:attribute>
		<xsl:attribute name="SortIndex">10</xsl:attribute>
		<xsl:attribute name="Default">false</xsl:attribute>
	</xsl:element>
	<xsl:element name="PROJECT">
		<xsl:attribute name="Name">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PROJECTNAME_CLASSLIBRARY"/>
		</xsl:attribute>
		<xsl:attribute name="Directory">Class Library</xsl:attribute>
		<xsl:attribute name="ReadOnly">false</xsl:attribute>
		<xsl:attribute name="Protected">false</xsl:attribute>
		<xsl:attribute name="SortIndex">20</xsl:attribute>
		<xsl:attribute name="Default">false</xsl:attribute>
	</xsl:element>
	<xsl:element name="PROJECT">
		<xsl:attribute name="Name">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PROJECTNAME_NONGRAPHICALAPP"/>
		</xsl:attribute>
		<xsl:attribute name="Directory">Non-graphical Application</xsl:attribute>
		<xsl:attribute name="ReadOnly">false</xsl:attribute>
		<xsl:attribute name="Protected">false</xsl:attribute>
		<xsl:attribute name="SortIndex">40</xsl:attribute>
		<xsl:attribute name="Default">false</xsl:attribute>
	</xsl:element>
	<xsl:element name="PROJECT">
		<xsl:attribute name="Name">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PROJECTNAME_EMPTY"/>
		</xsl:attribute>
		<xsl:attribute name="Directory">Empty Project</xsl:attribute>
		<xsl:attribute name="ReadOnly">false</xsl:attribute>
		<xsl:attribute name="Protected">false</xsl:attribute>
		<xsl:attribute name="SortIndex">50</xsl:attribute>
		<xsl:attribute name="Default">false</xsl:attribute>
	</xsl:element>
    </PROJECTS>

    <PROPERTY Name="OSVersionMin" ReadOnly="false" Protected="false">3.00</PROPERTY>
    <PROPERTY Name="OSVersionMax" ReadOnly="false" Protected="false">4.99</PROPERTY>
    <PROPERTY Name="SupportedProfile" ReadOnly="true" Protected="true">Windows CE</PROPERTY>
    <PROPERTY Name="COM+ReferenceDir" ReadOnly="true" Protected="true">$com+$\Windows CE</PROPERTY>
    <PROPERTY Name="DefaultPlatform"  ReadOnly="false" Protected="true">Pocket PC</PROPERTY>
    <PROPERTY Name="DefaultDevice"    ReadOnly="false" Protected="true">Pocket PC Emulator</PROPERTY>
    <PROPERTY Name="RemoteClientFile" ReadOnly="true" Protected="true">\Windows\ConManClient.exe</PROPERTY>
    <PROPERTY Name="WizardSortOrder" ReadOnly="false" Protected="false">10</PROPERTY>
    <PROPERTY Name="UserListed" ReadOnly="true" Protected="true">yes</PROPERTY>
    <PROPERTY Name="ShortName" ReadOnly="true" Protected="true">PPC</PROPERTY>
</xsl:element>

<xsl:element name="PLATFORM">
	<xsl:attribute name="Name"><xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PLATNAME_POCKET_PC"/>-Designer</xsl:attribute>
	<xsl:attribute name="InvariantName">Pocket PC-Designer</xsl:attribute>
	<xsl:attribute name="ReadOnly">false</xsl:attribute>
	<xsl:attribute name="Protected">true</xsl:attribute>
	<xsl:attribute name="xmlns"></xsl:attribute>
    <PROPERTY Name="COM+ReferenceDir" ReadOnly="true" Protected="true">$com+$\Windows CE\Designer;$sysRef$</PROPERTY>
    <PROPERTY Name="UserListed" ReadOnly="true" Protected="true">no</PROPERTY>
	<PROPERTY Name="UnSupportedControls" ReadOnly="true" Protected="true"></PROPERTY>
	<PROPERTY Name="LooknFeel" ReadOnly="true" Protected="true"></PROPERTY>
    <TYPE_TO_ARCHITECTURE_MAP  Name="Default" ReadOnly="true" Protected="true">
    </TYPE_TO_ARCHITECTURE_MAP>
</xsl:element>

<xsl:element name="PLATFORM">
	<xsl:attribute name="Name"><xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PLATNAME_WINDOWS_CE"/>-Designer</xsl:attribute>
	<xsl:attribute name="InvariantName">Windows CE-Designer</xsl:attribute>
	<xsl:attribute name="ReadOnly">false</xsl:attribute>
	<xsl:attribute name="Protected">true</xsl:attribute>
	<xsl:attribute name="xmlns"></xsl:attribute>
    <PROPERTY Name="COM+ReferenceDir" ReadOnly="true" Protected="true">$com+$\Windows CE\Designer;$sysRef$</PROPERTY>
    <PROPERTY Name="UserListed" ReadOnly="true" Protected="true">no</PROPERTY>
	<PROPERTY Name="UnSupportedControls" ReadOnly="true" Protected="true"></PROPERTY>
	<PROPERTY Name="LooknFeel" ReadOnly="true" Protected="true"></PROPERTY>
    <TYPE_TO_ARCHITECTURE_MAP  Name="Default" ReadOnly="true" Protected="true">
    </TYPE_TO_ARCHITECTURE_MAP>
</xsl:element>

</PLATFORMS>
</xsl:template>
</xsl:stylesheet>
