<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
<ADDONS>
	<PLATFORMS xmlns:dt="urn:schemas-microsoft-com:datatypes" xmlns="urn:platform-schema" ReadOnly="false" Protected="false" Version="1.0.2098.00">
		<PLATFORM Name="$sdk_platformInvariantName$" InvariantName="$sdk_platformInvariantName$" ReadOnly="true" Protected="true" xmlns="">
			<PROPERTY Name="InstallSemantics" ReadOnly="true" Protected="true">merge</PROPERTY>
			<DEVICE Name="$sdk_name$ - SDK Emulator" InvariantName="$sdk_name$ - SDK Emulator" ReadOnly="true" Protected="true">
				<PROPERTY Name="OS_Version" ReadOnly="false" Protected="false">$sdk_osVersion$</PROPERTY>
				<PROPERTY Name="OS" ReadOnly="false" Protected="false">default</PROPERTY>
				<PROPERTY Name="CurrentTransport" ReadOnly="false" Protected="false">emulator</PROPERTY>
				<PROPERTY Name="CurrentStartup" ReadOnly="false" Protected="true">emulator</PROPERTY>
				<PROPERTY Name="LocalClientFile" ReadOnly="true" Protected="true">$deviceBins$\$sdk_platformVersionPath$\%cpu%\ConManClient.exe</PROPERTY>
				<TRANSPORTSETTINGS Name="Default" ReadOnly="false" Protected="false">
					<TRANSPORT Name="Emulation" InvariantName="Emulation" ReadOnly="true" Protected="true">
						<PROPERTY Name="default" ReadOnly="true" Protected="true">no</PROPERTY>
						<PROPERTY Name="type" ReadOnly="true" Protected="true">emulator</PROPERTY>
						<PROPERTY Name="LocalTransportFile" Protected="true">$deviceBins$\$sdk_platformVersionPath$\%cpu%\cmtnpt_emulator.dll</PROPERTY>
						<PROPERTY Name="RemoteTransportFile" Protected="true">\windows\cmtnpt_emulator.dll</PROPERTY>
						<PROPERTY Name="VMID" ReadOnly="true" Protected="true">$sdk_vmid$</PROPERTY>          
						<PROPERTY Name="DMA_CHANNEL" ReadOnly="true" Protected="true">6</PROPERTY>
						<PROPERTY Name="disableauthentication" ReadOnly="true" Protected="true">yes</PROPERTY>
					</TRANSPORT>
				</TRANSPORTSETTINGS>
				<STARTUPSETTINGS Name="Default" ReadOnly="false" Protected="true">
					<STARTUP Name="Emulation Startup Provider" InvariantName="Emulation Startup Provider" ReadOnly="false" Protected="true">
						<PROPERTY Name="default" ReadOnly="true" Protected="true">no</PROPERTY>
						<PROPERTY Name="type" ReadOnly="true" Protected="true">emulator</PROPERTY>
						<PROPERTY Name="OSBootTime" ReadOnly="true" Protected="true">6000</PROPERTY>
						<PROPERTY Name="OSRestoreTime" ReadOnly="true" Protected="true">2000</PROPERTY>
						<PROPERTY Name="VMID" ReadOnly="true" Protected="true">$sdk_vmid$</PROPERTY>          
						<PROPERTY Name="OSBinImage" ReadOnly="false" Protected="true">$sdk_osBinImage$</PROPERTY>
						<PROPERTY Name="ScreenWidth" ReadOnly="false" Protected="true">$sdk_screenWidth$</PROPERTY>
						<PROPERTY Name="ScreenHeight" ReadOnly="false" Protected="true">$sdk_screenHeight$</PROPERTY>
						<PROPERTY Name="ColorDepth" ReadOnly="false" Protected="true">$sdk_colorDepth$</PROPERTY>
						<PROPERTY Name="EthernetEnabled" ReadOnly="false" Protected="true">$sdk_ethernetEnabled$</PROPERTY>
						<PROPERTY Name="MemSize" ReadOnly="false" Protected="true">$sdk_memory$</PROPERTY>
						<PROPERTY Name="HostKey" ReadOnly="false" Protected="true">165</PROPERTY>
						<PROPERTY Name="SerialPort1" ReadOnly="false" Protected="true">none</PROPERTY>
						<PROPERTY Name="SerialPort2" ReadOnly="false" Protected="true">none</PROPERTY>
						<PROPERTY Name="ParallelPort" ReadOnly="false" Protected="true">none</PROPERTY>
						<PROPERTY Name="Skin" ReadOnly="false" Protected="true">$sdk_skin$</PROPERTY>
						<PROPERTY Name="SkinEngine" ReadOnly="true" Protected="true">$dynamicAssemblies$\skin.dll</PROPERTY>
						
					</STARTUP>
				</STARTUPSETTINGS>
			</DEVICE>
		</PLATFORM>
	</PLATFORMS>
</ADDONS>
</xsl:template>
</xsl:stylesheet>
