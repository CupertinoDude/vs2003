<?xml version="1.0" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
<ADDONS>
<PACKAGES>

<PACKAGE Name=".netcf installable CAB" InvariantName=".netcf installable CAB" ReadOnly="true" Protected="true">
	<PROPERTY Name="IsDeviceDependent" ReadOnly="true" Protected="false">yes</PROPERTY>
	<PROPERTY Name="InstallSemantics" ReadOnly="true" Protected="true">merge</PROPERTY>
	<PACKAGETYPE Name="ARM_PPC" InvariantName="ARM_PPC" ReadOnly="true" Protected="true">
		<PROPERTY Name="RemotePath" ReadOnly="true" Protected="true">\</PROPERTY>
		<PROPERTY Name="RootPath" UseRelativePath="true" ReadOnly="true" Protected="true">CompactFrameworkSDK\v1.0.5000\Windows CE\wce300\ARM</PROPERTY>
		<PROPERTY Name="CPU" ReadOnly="true" Protected="true">ARM</PROPERTY>
		<PROPERTY Name="Platform" ReadOnly="true" Protected="true">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PLATNAME_POCKET_PC"/>
		</PROPERTY>
		<FILES Name="Default" ReadOnly="true" Protected="true">
			<FILE Name="netcf.core.ppc3.arm.cab" Installer="\windows\wceload.exe" ReadOnly="true" Protected="true">None</FILE>
		</FILES>
	    <CAB Name="Default">
			<FILES Name="Default">
				<FILE Name="Mscoree.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Mscoree1_0.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Cgacutil.exe" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Netcfagl1_0.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Calendar_1_0.nlp"></FILE>
				<FILE Name="Charinfo_1_0.nlp"></FILE>
				<FILE Name="Culture1_1_0.nlp"></FILE>
				<FILE Name="Culture2_1_0.nlp"></FILE>
				<FILE Name="Region_1_0.nlp"></FILE>
				<FILE Name="Mscorlib.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.drawing.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.web.services.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.windows.forms.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.windows.forms.datagrid.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.xml.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.net.irda.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.data.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="Microsoft.visualbasic.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="7.0.5000.0" Flags="1"></FILE>
				<FILE Name="Microsoft.windowsce.forms.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
			</FILES>
		</CAB>
	</PACKAGETYPE>
	<PACKAGETYPE Name="ARMV4_PPC" InvariantName="ARMV4_PPC" ReadOnly="true" Protected="true">
		<PROPERTY Name="RemotePath" ReadOnly="true" Protected="true">\</PROPERTY>
		<PROPERTY Name="RootPath" UseRelativePath="true" ReadOnly="true" Protected="true">CompactFrameworkSDK\v1.0.5000\Windows CE\wce300\ARMV4</PROPERTY>
		<PROPERTY Name="CPU" ReadOnly="true" Protected="true">ARMV4</PROPERTY>
		<PROPERTY Name="Platform" ReadOnly="true" Protected="true">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PLATNAME_POCKET_PC"/>
		</PROPERTY>
		<FILES Name="Default" ReadOnly="true" Protected="true">
			<FILE Name="netcf.all.wce4.armv4.cab" Installer="\windows\wceload.exe" ReadOnly="true" Protected="true">None</FILE>
		</FILES>
	    <CAB Name="Default">
			<FILES Name="Default">
				<FILE Name="Mscoree.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Mscoree1_0.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Cgacutil.exe" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Netcfagl1_0.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Calendar_1_0.nlp"></FILE>
				<FILE Name="Charinfo_1_0.nlp"></FILE>
				<FILE Name="Culture1_1_0.nlp"></FILE>
				<FILE Name="Culture2_1_0.nlp"></FILE>
				<FILE Name="Region_1_0.nlp"></FILE>
				<FILE Name="Mscorlib.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.drawing.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.web.services.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.windows.forms.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.windows.forms.datagrid.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.xml.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.net.irda.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.data.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="Microsoft.visualbasic.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="7.0.5000.0" Flags="1"></FILE>
				<FILE Name="Microsoft.windowsce.forms.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
			</FILES>
		</CAB>
	</PACKAGETYPE>

    <PACKAGETYPE Name="MIPS_PPC" InvariantName="MIPS_PPC" ReadOnly="true" Protected="true">
		<PROPERTY Name="RemotePath" ReadOnly="true" Protected="true">\</PROPERTY>
		<PROPERTY Name="RootPath" UseRelativePath="true" ReadOnly="true" Protected="true">CompactFrameworkSDK\v1.0.5000\Windows CE\wce300\MIPS</PROPERTY>
		<PROPERTY Name="CPU" ReadOnly="true" Protected="true">MIPS</PROPERTY>
		<PROPERTY Name="Platform" ReadOnly="true" Protected="true">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PLATNAME_POCKET_PC"/>
		</PROPERTY>
		<FILES Name="Default" ReadOnly="true" Protected="true">
			<FILE Name="netcf.core.ppc3.mips.cab" Installer="\windows\wceload.exe" ReadOnly="true" Protected="true">None</FILE>
		</FILES>
	    <CAB Name="Default">
			<FILES Name="Default">
				<FILE Name="Mscoree.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Mscoree1_0.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Cgacutil.exe" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Netcfagl1_0.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Calendar_1_0.nlp"></FILE>
				<FILE Name="Charinfo_1_0.nlp"></FILE>
				<FILE Name="Culture1_1_0.nlp"></FILE>
				<FILE Name="Culture2_1_0.nlp"></FILE>
				<FILE Name="Region_1_0.nlp"></FILE>
				<FILE Name="Mscorlib.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.drawing.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.web.services.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.windows.forms.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.windows.forms.datagrid.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.xml.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.net.irda.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.data.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="Microsoft.visualbasic.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="7.0.5000.0" Flags="1"></FILE>
				<FILE Name="Microsoft.windowsce.forms.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
			</FILES>
		</CAB>
    </PACKAGETYPE>
    <PACKAGETYPE Name="SH3_PPC" InvariantName="SH3_PPC" ReadOnly="true" Protected="true">
		<PROPERTY Name="RemotePath" ReadOnly="true" Protected="true">\</PROPERTY>
		<PROPERTY Name="RootPath" UseRelativePath="true" ReadOnly="true" Protected="true">CompactFrameworkSDK\v1.0.5000\Windows CE\wce300\SH3</PROPERTY>
		<PROPERTY Name="CPU" ReadOnly="true" Protected="true">SH3</PROPERTY>
		<PROPERTY Name="Platform" ReadOnly="true" Protected="true">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PLATNAME_POCKET_PC"/>
		</PROPERTY>
		<FILES Name="Default" ReadOnly="true" Protected="true">
			<FILE Name="netcf.core.ppc3.sh3.cab" Installer="\windows\wceload.exe" ReadOnly="true" Protected="true">None</FILE>
		</FILES>
	    <CAB Name="Default">
			<FILES Name="Default">
				<FILE Name="Mscoree.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Mscoree1_0.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Cgacutil.exe" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Netcfagl1_0.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Calendar_1_0.nlp"></FILE>
				<FILE Name="Charinfo_1_0.nlp"></FILE>
				<FILE Name="Culture1_1_0.nlp"></FILE>
				<FILE Name="Culture2_1_0.nlp"></FILE>
				<FILE Name="Region_1_0.nlp"></FILE>
				<FILE Name="Mscorlib.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.drawing.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.web.services.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.windows.forms.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.windows.forms.datagrid.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.xml.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.net.irda.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.data.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="Microsoft.visualbasic.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="7.0.5000.0" Flags="1"></FILE>
				<FILE Name="Microsoft.windowsce.forms.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
			</FILES>
		</CAB>
    </PACKAGETYPE>
    <PACKAGETYPE Name="X86_PPC" InvariantName="X86_PPC" ReadOnly="true" Protected="true">
		<PROPERTY Name="RemotePath" ReadOnly="true" Protected="true">\</PROPERTY>
		<PROPERTY Name="RootPath" UseRelativePath="true" ReadOnly="true" Protected="true">CompactFrameworkSDK\v1.0.5000\Windows CE\wce300\X86</PROPERTY>
		<PROPERTY Name="CPU" ReadOnly="true" Protected="true">X86</PROPERTY>
		<PROPERTY Name="Platform" ReadOnly="true" Protected="true">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PLATNAME_POCKET_PC"/>
		</PROPERTY>
		<FILES Name="Default" ReadOnly="true" Protected="true">
			<FILE Name="netcf.core.ppc3.x86.cab" Installer="\windows\wceload.exe" ReadOnly="true" Protected="true">None</FILE>
		</FILES>
	    <CAB Name="Default">
			<FILES Name="Default">
				<FILE Name="Mscoree.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Mscoree1_0.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Cgacutil.exe" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Netcfagl1_0.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Calendar_1_0.nlp"></FILE>
				<FILE Name="Charinfo_1_0.nlp"></FILE>
				<FILE Name="Culture1_1_0.nlp"></FILE>
				<FILE Name="Culture2_1_0.nlp"></FILE>
				<FILE Name="Region_1_0.nlp"></FILE>
				<FILE Name="Mscorlib.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.drawing.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.web.services.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.windows.forms.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.windows.forms.datagrid.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.xml.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.net.irda.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.data.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="Microsoft.visualbasic.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="7.0.5000.0" Flags="1"></FILE>
				<FILE Name="Microsoft.windowsce.forms.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
			</FILES>
		</CAB>
    </PACKAGETYPE>
    <PACKAGETYPE Name="ARMV4_WCE4" InvariantName="ARMV4_WCE4" ReadOnly="true" Protected="true">
		<PROPERTY Name="RemotePath" ReadOnly="true" Protected="true">\</PROPERTY>
		<PROPERTY Name="RootPath" UseRelativePath="true" ReadOnly="true" Protected="true">CompactFrameworkSDK\v1.0.5000\Windows CE\wce400\ARMV4</PROPERTY>
		<PROPERTY Name="CPU" ReadOnly="true" Protected="true">ARMV4</PROPERTY>
		<PROPERTY Name="Platform" ReadOnly="true" Protected="true">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PLATNAME_WINDOWS_CE"/>
		</PROPERTY>
		<FILES Name="Default" ReadOnly="true" Protected="true">
			<FILE Name="netcf.all.wce4.armv4.cab" Installer="\windows\wceload.exe" InstallerOptions="/noaskdest" ReadOnly="true" Protected="true">None</FILE>
		</FILES>
	    <CAB Name="Default">
			<FILES Name="Default">
				<FILE Name="Mscoree.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Mscoree1_0.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Cgacutil.exe" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Netcfagl1_0.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Calendar_1_0.nlp"></FILE>
				<FILE Name="Charinfo_1_0.nlp"></FILE>
				<FILE Name="Culture1_1_0.nlp"></FILE>
				<FILE Name="Culture2_1_0.nlp"></FILE>
				<FILE Name="Region_1_0.nlp"></FILE>
				<FILE Name="Mscorlib.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.drawing.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.web.services.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.windows.forms.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.windows.forms.datagrid.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.xml.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.net.irda.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.data.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="Microsoft.visualbasic.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="7.0.5000.0" Flags="1"></FILE>
				<FILE Name="Microsoft.windowsce.forms.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
			</FILES>
		</CAB>
	</PACKAGETYPE>
    <PACKAGETYPE Name="ARMV4T_WCE4" InvariantName="ARTMV4T_WCE4" ReadOnly="true" Protected="true">
		<PROPERTY Name="RemotePath" ReadOnly="true" Protected="true">\</PROPERTY>
		<PROPERTY Name="RootPath" UseRelativePath="true" ReadOnly="true" Protected="true">CompactFrameworkSDK\v1.0.5000\Windows CE\wce400\ARMV4T</PROPERTY>
		<PROPERTY Name="CPU" ReadOnly="true" Protected="true">ARMV4T</PROPERTY>
		<PROPERTY Name="Platform" ReadOnly="true" Protected="true">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PLATNAME_WINDOWS_CE"/>
		</PROPERTY>
		<FILES Name="Default" ReadOnly="true" Protected="true">
			<FILE Name="netcf.all.wce4.armv4t.cab" Installer="\windows\wceload.exe" InstallerOptions="/noaskdest" ReadOnly="true" Protected="true">None</FILE>
		</FILES>
	    <CAB Name="Default">
			<FILES Name="Default">
				<FILE Name="Mscoree.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Mscoree1_0.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Cgacutil.exe" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Netcfagl1_0.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Calendar_1_0.nlp"></FILE>
				<FILE Name="Charinfo_1_0.nlp"></FILE>
				<FILE Name="Culture1_1_0.nlp"></FILE>
				<FILE Name="Culture2_1_0.nlp"></FILE>
				<FILE Name="Region_1_0.nlp"></FILE>
				<FILE Name="Mscorlib.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.drawing.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.web.services.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.windows.forms.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.windows.forms.datagrid.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.xml.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.net.irda.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.data.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="Microsoft.visualbasic.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="7.0.5000.0" Flags="1"></FILE>
				<FILE Name="Microsoft.windowsce.forms.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
			</FILES>
		</CAB>
    </PACKAGETYPE>
    <PACKAGETYPE Name="SH3_WCE4" InvariantName="SH3_WCE4" ReadOnly="true" Protected="true">
		<PROPERTY Name="RemotePath" ReadOnly="true" Protected="true">\</PROPERTY>
		<PROPERTY Name="RootPath" UseRelativePath="true" ReadOnly="true" Protected="true">CompactFrameworkSDK\v1.0.5000\Windows CE\wce400\SH3</PROPERTY>
		<PROPERTY Name="CPU" ReadOnly="true" Protected="true">SH3</PROPERTY>
		<PROPERTY Name="Platform" ReadOnly="true" Protected="true">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PLATNAME_WINDOWS_CE"/>
		</PROPERTY>
		<FILES Name="Default" ReadOnly="true" Protected="true">
			<FILE Name="netcf.all.wce4.sh3.cab" Installer="\windows\wceload.exe" InstallerOptions="/noaskdest" ReadOnly="true" Protected="true">None</FILE>
		</FILES>
	    <CAB Name="Default">
			<FILES Name="Default">
				<FILE Name="Mscoree.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Mscoree1_0.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Cgacutil.exe" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Netcfagl1_0.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Calendar_1_0.nlp"></FILE>
				<FILE Name="Charinfo_1_0.nlp"></FILE>
				<FILE Name="Culture1_1_0.nlp"></FILE>
				<FILE Name="Culture2_1_0.nlp"></FILE>
				<FILE Name="Region_1_0.nlp"></FILE>
				<FILE Name="Mscorlib.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.drawing.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.web.services.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.windows.forms.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.windows.forms.datagrid.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.xml.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.net.irda.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.data.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="Microsoft.visualbasic.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="7.0.5000.0" Flags="1"></FILE>
				<FILE Name="Microsoft.windowsce.forms.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
			</FILES>
		</CAB>
 	</PACKAGETYPE>
    <PACKAGETYPE Name="SH4_WCE4" InvariantName="SH4_WCE4" ReadOnly="true" Protected="true">
		<PROPERTY Name="RemotePath" ReadOnly="true" Protected="true">\</PROPERTY>
		<PROPERTY Name="RootPath" UseRelativePath="true" ReadOnly="true" Protected="true">CompactFrameworkSDK\v1.0.5000\Windows CE\wce400\SH4</PROPERTY>
		<PROPERTY Name="CPU" ReadOnly="true" Protected="true">SH4</PROPERTY>
		<PROPERTY Name="Platform" ReadOnly="true" Protected="true">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PLATNAME_WINDOWS_CE"/>
		</PROPERTY>
		<FILES Name="Default" ReadOnly="true" Protected="true">
			<FILE Name="netcf.all.wce4.sh4.cab" Installer="\windows\wceload.exe" InstallerOptions="/noaskdest" ReadOnly="true" Protected="true">None</FILE>
		</FILES>
	    <CAB Name="Default">
			<FILES Name="Default">
				<FILE Name="Mscoree.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Mscoree1_0.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Cgacutil.exe" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Netcfagl1_0.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Calendar_1_0.nlp"></FILE>
				<FILE Name="Charinfo_1_0.nlp"></FILE>
				<FILE Name="Culture1_1_0.nlp"></FILE>
				<FILE Name="Culture2_1_0.nlp"></FILE>
				<FILE Name="Region_1_0.nlp"></FILE>
				<FILE Name="Mscorlib.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.drawing.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.web.services.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.windows.forms.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.windows.forms.datagrid.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.xml.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.net.irda.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.data.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="Microsoft.visualbasic.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="7.0.5000.0" Flags="1"></FILE>
				<FILE Name="Microsoft.windowsce.forms.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
			</FILES>
		</CAB>
	</PACKAGETYPE>
    <PACKAGETYPE Name="MIPS16_WCE4" InvariantName="MIPS16_WCE4" ReadOnly="true" Protected="true">
		<PROPERTY Name="RemotePath" ReadOnly="true" Protected="true">\</PROPERTY>
		<PROPERTY Name="RootPath" UseRelativePath="true" ReadOnly="true" Protected="true">CompactFrameworkSDK\v1.0.5000\Windows CE\wce400\MIPS16</PROPERTY>
		<PROPERTY Name="CPU" ReadOnly="true" Protected="true">MIPS16</PROPERTY>
		<PROPERTY Name="Platform" ReadOnly="true" Protected="true">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PLATNAME_WINDOWS_CE"/>
		</PROPERTY>
		<FILES Name="Default" ReadOnly="true" Protected="true">
			<FILE Name="netcf.all.wce4.mips16.cab" Installer="\windows\wceload.exe" InstallerOptions="/noaskdest" ReadOnly="true" Protected="true">None</FILE>
		</FILES>
	    <CAB Name="Default">
			<FILES Name="Default">
				<FILE Name="Mscoree.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Mscoree1_0.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Cgacutil.exe" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Netcfagl1_0.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Calendar_1_0.nlp"></FILE>
				<FILE Name="Charinfo_1_0.nlp"></FILE>
				<FILE Name="Culture1_1_0.nlp"></FILE>
				<FILE Name="Culture2_1_0.nlp"></FILE>
				<FILE Name="Region_1_0.nlp"></FILE>
				<FILE Name="Mscorlib.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.drawing.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.web.services.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.windows.forms.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.windows.forms.datagrid.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.xml.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.net.irda.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.data.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="Microsoft.visualbasic.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="7.0.5000.0" Flags="1"></FILE>
				<FILE Name="Microsoft.windowsce.forms.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
			</FILES>
		</CAB>
	</PACKAGETYPE>
    <PACKAGETYPE Name="MIPSII_WCE4" InvariantName="MIPSII_WCE4" ReadOnly="true" Protected="true">
		<PROPERTY Name="RemotePath" ReadOnly="true" Protected="true">\</PROPERTY>
		<PROPERTY Name="RootPath" UseRelativePath="true" ReadOnly="true" Protected="true">CompactFrameworkSDK\v1.0.5000\Windows CE\wce400\MIPSII</PROPERTY>
		<PROPERTY Name="CPU" ReadOnly="true" Protected="true">MIPSII</PROPERTY>
		<PROPERTY Name="Platform" ReadOnly="true" Protected="true">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PLATNAME_WINDOWS_CE"/>
		</PROPERTY>
		<FILES Name="Default" ReadOnly="true" Protected="true">
			<FILE Name="netcf.all.wce4.mipsii.cab" Installer="\windows\wceload.exe" InstallerOptions="/noaskdest" ReadOnly="true" Protected="true">None</FILE>
		</FILES>
	    <CAB Name="Default">
			<FILES Name="Default">
				<FILE Name="Mscoree.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Mscoree1_0.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Cgacutil.exe" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Netcfagl1_0.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Calendar_1_0.nlp"></FILE>
				<FILE Name="Charinfo_1_0.nlp"></FILE>
				<FILE Name="Culture1_1_0.nlp"></FILE>
				<FILE Name="Culture2_1_0.nlp"></FILE>
				<FILE Name="Region_1_0.nlp"></FILE>
				<FILE Name="Mscorlib.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.drawing.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.web.services.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.windows.forms.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.windows.forms.datagrid.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.xml.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.net.irda.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.data.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="Microsoft.visualbasic.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="7.0.5000.0" Flags="1"></FILE>
				<FILE Name="Microsoft.windowsce.forms.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
			</FILES>
		</CAB>
	</PACKAGETYPE>
    <PACKAGETYPE Name="MIPSII_FP_WCE4" InvariantName="MIPSII_FP_WCE4" ReadOnly="true" Protected="true">
		<PROPERTY Name="RemotePath" ReadOnly="true" Protected="true">\</PROPERTY>
		<PROPERTY Name="RootPath" UseRelativePath="true" ReadOnly="true" Protected="true">CompactFrameworkSDK\v1.0.5000\Windows CE\wce400\MIPSII_FP</PROPERTY>
		<PROPERTY Name="CPU" ReadOnly="true" Protected="true">MIPSII_FP</PROPERTY>
		<PROPERTY Name="Platform" ReadOnly="true" Protected="true">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PLATNAME_WINDOWS_CE"/>
		</PROPERTY>
		<FILES Name="Default" ReadOnly="true" Protected="true">
			<FILE Name="netcf.all.wce4.mipsii_fp.cab" Installer="\windows\wceload.exe" InstallerOptions="/noaskdest" ReadOnly="true" Protected="true">None</FILE>
		</FILES>
	    <CAB Name="Default">
			<FILES Name="Default">
				<FILE Name="Mscoree.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Mscoree1_0.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Cgacutil.exe" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Netcfagl1_0.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Calendar_1_0.nlp"></FILE>
				<FILE Name="Charinfo_1_0.nlp"></FILE>
				<FILE Name="Culture1_1_0.nlp"></FILE>
				<FILE Name="Culture2_1_0.nlp"></FILE>
				<FILE Name="Region_1_0.nlp"></FILE>
				<FILE Name="Mscorlib.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.drawing.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.web.services.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.windows.forms.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.windows.forms.datagrid.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.xml.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.net.irda.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.data.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="Microsoft.visualbasic.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="7.0.5000.0" Flags="1"></FILE>
				<FILE Name="Microsoft.windowsce.forms.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
			</FILES>
		</CAB>
	</PACKAGETYPE>
    <PACKAGETYPE Name="MIPSIV_WCE4" InvariantName="MIPSIV_WCE4" ReadOnly="true" Protected="true">
		<PROPERTY Name="RemotePath" ReadOnly="true" Protected="true">\</PROPERTY>
		<PROPERTY Name="RootPath" UseRelativePath="true" ReadOnly="true" Protected="true">CompactFrameworkSDK\v1.0.5000\Windows CE\wce400\MIPSIV</PROPERTY>
		<PROPERTY Name="CPU" ReadOnly="true" Protected="true">MIPSIV</PROPERTY>
		<PROPERTY Name="Platform" ReadOnly="true" Protected="true">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PLATNAME_WINDOWS_CE"/>
		</PROPERTY>
		<FILES Name="Default" ReadOnly="true" Protected="true">
			<FILE Name="netcf.all.wce4.mipsiv.cab" Installer="\windows\wceload.exe" InstallerOptions="/noaskdest" ReadOnly="true" Protected="true">None</FILE>
		</FILES>
	    <CAB Name="Default">
			<FILES Name="Default">
				<FILE Name="Mscoree.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Mscoree1_0.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Cgacutil.exe" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Netcfagl1_0.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Calendar_1_0.nlp"></FILE>
				<FILE Name="Charinfo_1_0.nlp"></FILE>
				<FILE Name="Culture1_1_0.nlp"></FILE>
				<FILE Name="Culture2_1_0.nlp"></FILE>
				<FILE Name="Region_1_0.nlp"></FILE>
				<FILE Name="Mscorlib.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.drawing.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.web.services.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.windows.forms.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.windows.forms.datagrid.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.xml.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.net.irda.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.data.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="Microsoft.visualbasic.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="7.0.5000.0" Flags="1"></FILE>
				<FILE Name="Microsoft.windowsce.forms.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
			</FILES>
		</CAB>
	</PACKAGETYPE>
    <PACKAGETYPE Name="MIPSIV_FP_WCE4" InvariantName="MIPSIV_FP_WCE4" ReadOnly="true" Protected="true">
		<PROPERTY Name="RemotePath" ReadOnly="true" Protected="true">\</PROPERTY>
		<PROPERTY Name="RootPath" UseRelativePath="true" ReadOnly="true" Protected="true">CompactFrameworkSDK\v1.0.5000\Windows CE\wce400\MIPSIV_FP</PROPERTY>
		<PROPERTY Name="CPU" ReadOnly="true" Protected="true">MIPSIV_FP</PROPERTY>
		<PROPERTY Name="Platform" ReadOnly="true" Protected="true">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PLATNAME_WINDOWS_CE"/>
		</PROPERTY>
		<FILES Name="Default" ReadOnly="true" Protected="true">
			<FILE Name="netcf.all.wce4.mipsiv_fp.cab" Installer="\windows\wceload.exe" InstallerOptions="/noaskdest" ReadOnly="true" Protected="true">None</FILE>
		</FILES>
	    <CAB Name="Default">
			<FILES Name="Default">
				<FILE Name="Mscoree.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Mscoree1_0.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Cgacutil.exe" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Netcfagl1_0.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Calendar_1_0.nlp"></FILE>
				<FILE Name="Charinfo_1_0.nlp"></FILE>
				<FILE Name="Culture1_1_0.nlp"></FILE>
				<FILE Name="Culture2_1_0.nlp"></FILE>
				<FILE Name="Region_1_0.nlp"></FILE>
				<FILE Name="Mscorlib.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.drawing.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.web.services.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.windows.forms.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.windows.forms.datagrid.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.xml.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.net.irda.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.data.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="Microsoft.visualbasic.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="7.0.5000.0" Flags="1"></FILE>
				<FILE Name="Microsoft.windowsce.forms.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
			</FILES>
		</CAB>
	</PACKAGETYPE>
    <PACKAGETYPE Name="X86_WCE4" InvariantName="X86_WCE4" ReadOnly="true" Protected="true">
		<PROPERTY Name="RemotePath" ReadOnly="true" Protected="true">\</PROPERTY>
		<PROPERTY Name="RootPath" UseRelativePath="true" ReadOnly="true" Protected="true">CompactFrameworkSDK\v1.0.5000\Windows CE\wce400\X86</PROPERTY>
		<PROPERTY Name="CPU" ReadOnly="true" Protected="true">X86</PROPERTY>
		<PROPERTY Name="Platform" ReadOnly="true" Protected="true">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PLATNAME_WINDOWS_CE"/>
		</PROPERTY>
		<FILES Name="Default" ReadOnly="true" Protected="true">
			<FILE Name="netcf.all.wce4.x86.cab" Installer="\windows\wceload.exe" InstallerOptions="/noaskdest" ReadOnly="true" Protected="true">None</FILE>
		</FILES>
	    <CAB Name="Default">
			<FILES Name="Default">
				<FILE Name="Mscoree.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Mscoree1_0.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Cgacutil.exe" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Netcfagl1_0.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Calendar_1_0.nlp"></FILE>
				<FILE Name="Charinfo_1_0.nlp"></FILE>
				<FILE Name="Culture1_1_0.nlp"></FILE>
				<FILE Name="Culture2_1_0.nlp"></FILE>
				<FILE Name="Region_1_0.nlp"></FILE>
				<FILE Name="Mscorlib.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.drawing.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.web.services.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.windows.forms.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.windows.forms.datagrid.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.xml.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.net.irda.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.data.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="Microsoft.visualbasic.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="7.0.5000.0" Flags="1"></FILE>
				<FILE Name="Microsoft.windowsce.forms.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
			</FILES>
		</CAB>
	</PACKAGETYPE>
    <PACKAGETYPE Name="WCE420X86_PPC" InvariantName="WCE420X86_PPC" ReadOnly="true" Protected="true">
		<PROPERTY Name="RemotePath" ReadOnly="true" Protected="true">\</PROPERTY>
		<PROPERTY Name="RootPath" UseRelativePath="true" ReadOnly="true" Protected="true">CompactFrameworkSDK\v1.0.5000\Windows CE\wce300\WCE420X86</PROPERTY>
		<PROPERTY Name="CPU" ReadOnly="true" Protected="true">WCE420X86</PROPERTY>
		<PROPERTY Name="Platform" ReadOnly="true" Protected="true">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PLATNAME_POCKET_PC"/>
		</PROPERTY>
		<FILES Name="Default" ReadOnly="true" Protected="true">
			<FILE Name="netcf.all.wce4.x86.cab" Installer="\windows\wceload.exe" ReadOnly="true" Protected="true">None</FILE>
		</FILES>
	    <CAB Name="Default">
			<FILES Name="Default">
				<FILE Name="Mscoree.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Mscoree1_0.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Cgacutil.exe" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Netcfagl1_0.dll" Version="1.0.2268.00" Flags="6"></FILE>
				<FILE Name="Calendar_1_0.nlp"></FILE>
				<FILE Name="Charinfo_1_0.nlp"></FILE>
				<FILE Name="Culture1_1_0.nlp"></FILE>
				<FILE Name="Culture2_1_0.nlp"></FILE>
				<FILE Name="Region_1_0.nlp"></FILE>
				<FILE Name="Mscorlib.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.drawing.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.web.services.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.windows.forms.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.windows.forms.datagrid.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.xml.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.net.irda.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="System.data.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
				<FILE Name="Microsoft.visualbasic.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="7.0.5000.0" Flags="1"></FILE>
				<FILE Name="Microsoft.windowsce.forms.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
			</FILES>
		</CAB>
    </PACKAGETYPE>
</PACKAGE>

<PACKAGE Name=".netcf installable CAB -- Developer Tools" InvariantName=".netcf installable CAB -- Developer Tools" ReadOnly="true" Protected="true">
	<PROPERTY Name="IsDeviceDependent" ReadOnly="true" Protected="false">yes</PROPERTY>
	<PROPERTY Name="InstallSemantics" ReadOnly="true" Protected="true">merge</PROPERTY>
    <PACKAGETYPE Name="ARMV4_PPC_DT" InvariantName="ARMV4_PPC_DT" ReadOnly="true" Protected="true">
		<PROPERTY Name="RemotePath" ReadOnly="true" Protected="true">\</PROPERTY>
		<PROPERTY Name="RootPath" UseRelativePath="true" ReadOnly="true" Protected="true">CompactFrameworkSDK\v1.0.5000\Windows CE\Diagnostics</PROPERTY>
		<PROPERTY Name="CPU" ReadOnly="true" Protected="true">ARMV4</PROPERTY>
		<PROPERTY Name="Platform" ReadOnly="true" Protected="true">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PLATNAME_POCKET_PC"/>
		</PROPERTY>
		<FILES Name="Default" ReadOnly="true" Protected="true">
			<xsl:element name="FILE">
				<xsl:attribute name="Name">
					<xsl:value-of select="LANGUAGE/DEFAULT/CABFILE_SYSTEM_SR"/>
				</xsl:attribute>
				<xsl:attribute name="Installer">\windows\wceload.exe</xsl:attribute>
				<xsl:attribute name="ReadOnly">true</xsl:attribute>
				<xsl:attribute name="Protected">true</xsl:attribute>
				None
			</xsl:element>
		</FILES>
	    <CAB Name="Default">
			<FILES Name="Default">
				<FILE Name="System.SR.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
			</FILES>
		</CAB>
    </PACKAGETYPE>
    <PACKAGETYPE Name="WCE420X86_PPC_DT" InvariantName="WCE420X86_PPC_DT" ReadOnly="true" Protected="true">
		<PROPERTY Name="RemotePath" ReadOnly="true" Protected="true">\</PROPERTY>
		<PROPERTY Name="RootPath" UseRelativePath="true" ReadOnly="true" Protected="true">CompactFrameworkSDK\v1.0.5000\Windows CE\Diagnostics</PROPERTY>
		<PROPERTY Name="CPU" ReadOnly="true" Protected="true">WCE420X86</PROPERTY>
		<PROPERTY Name="Platform" ReadOnly="true" Protected="true">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PLATNAME_POCKET_PC"/>
		</PROPERTY>
		<FILES Name="Default" ReadOnly="true" Protected="true">
			<xsl:element name="FILE">
				<xsl:attribute name="Name">
					<xsl:value-of select="LANGUAGE/DEFAULT/CABFILE_SYSTEM_SR"/>
				</xsl:attribute>
				<xsl:attribute name="Installer">\windows\wceload.exe</xsl:attribute>
				<xsl:attribute name="ReadOnly">true</xsl:attribute>
				<xsl:attribute name="Protected">true</xsl:attribute>
				None
			</xsl:element>
		</FILES>
	    <CAB Name="Default">
			<FILES Name="Default">
				<FILE Name="System.SR.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
			</FILES>
		</CAB>
    </PACKAGETYPE>
	<PACKAGETYPE Name="ARM_PPC_DT" InvariantName="ARM_PPC_DT" ReadOnly="true" Protected="true">
		<PROPERTY Name="RemotePath" ReadOnly="true" Protected="true">\</PROPERTY>
		<PROPERTY Name="RootPath" UseRelativePath="true" ReadOnly="true" Protected="true">CompactFrameworkSDK\v1.0.5000\Windows CE\Diagnostics</PROPERTY>
		<PROPERTY Name="CPU" ReadOnly="true" Protected="true">ARM</PROPERTY>
		<PROPERTY Name="Platform" ReadOnly="true" Protected="true">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PLATNAME_POCKET_PC"/>
		</PROPERTY>
		<FILES Name="Default" ReadOnly="true" Protected="true">
			<xsl:element name="FILE">
				<xsl:attribute name="Name">
					<xsl:value-of select="LANGUAGE/DEFAULT/CABFILE_SYSTEM_SR"/>
				</xsl:attribute>
				<xsl:attribute name="Installer">\windows\wceload.exe</xsl:attribute>
				<xsl:attribute name="ReadOnly">true</xsl:attribute>
				<xsl:attribute name="Protected">true</xsl:attribute>
				None
			</xsl:element>
		</FILES>
	    <CAB Name="Default">
			<FILES Name="Default">
				<FILE Name="System.SR.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
			</FILES>
		</CAB>
	</PACKAGETYPE>
    <PACKAGETYPE Name="MIPS_PPC_DT" InvariantName="MIPS_PPC_DT" ReadOnly="true" Protected="true">
		<PROPERTY Name="RemotePath" ReadOnly="true" Protected="true">\</PROPERTY>
		<PROPERTY Name="RootPath" UseRelativePath="true" ReadOnly="true" Protected="true">CompactFrameworkSDK\v1.0.5000\Windows CE\Diagnostics</PROPERTY>
		<PROPERTY Name="CPU" ReadOnly="true" Protected="true">MIPS</PROPERTY>
		<PROPERTY Name="Platform" ReadOnly="true" Protected="true">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PLATNAME_POCKET_PC"/>
		</PROPERTY>
		<FILES Name="Default" ReadOnly="true" Protected="true">
			<xsl:element name="FILE">
				<xsl:attribute name="Name">
					<xsl:value-of select="LANGUAGE/DEFAULT/CABFILE_SYSTEM_SR"/>
				</xsl:attribute>
				<xsl:attribute name="Installer">\windows\wceload.exe</xsl:attribute>
				<xsl:attribute name="ReadOnly">true</xsl:attribute>
				<xsl:attribute name="Protected">true</xsl:attribute>
				None
			</xsl:element>
		</FILES>
	    <CAB Name="Default">
			<FILES Name="Default">
				<FILE Name="System.SR.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
			</FILES>
		</CAB>
    </PACKAGETYPE>
    <PACKAGETYPE Name="SH3_PPC_DT" InvariantName="SH3_PPC_DT" ReadOnly="true" Protected="true">
		<PROPERTY Name="RemotePath" ReadOnly="true" Protected="true">\</PROPERTY>
		<PROPERTY Name="RootPath" UseRelativePath="true" ReadOnly="true" Protected="true">CompactFrameworkSDK\v1.0.5000\Windows CE\Diagnostics</PROPERTY>
		<PROPERTY Name="CPU" ReadOnly="true" Protected="true">SH3</PROPERTY>
		<PROPERTY Name="Platform" ReadOnly="true" Protected="true">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PLATNAME_POCKET_PC"/>
		</PROPERTY>
		<FILES Name="Default" ReadOnly="true" Protected="true">
			<xsl:element name="FILE">
				<xsl:attribute name="Name">
					<xsl:value-of select="LANGUAGE/DEFAULT/CABFILE_SYSTEM_SR"/>
				</xsl:attribute>
				<xsl:attribute name="Installer">\windows\wceload.exe</xsl:attribute>
				<xsl:attribute name="ReadOnly">true</xsl:attribute>
				<xsl:attribute name="Protected">true</xsl:attribute>
				None
			</xsl:element>
		</FILES>
	    <CAB Name="Default">
			<FILES Name="Default">
				<FILE Name="System.SR.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
			</FILES>
		</CAB>
    </PACKAGETYPE>
    <PACKAGETYPE Name="X86_PPC_DT" InvariantName="X86_PPC_DT" ReadOnly="true" Protected="true">
		<PROPERTY Name="RemotePath" ReadOnly="true" Protected="true">\</PROPERTY>
		<PROPERTY Name="RootPath" UseRelativePath="true" ReadOnly="true" Protected="true">CompactFrameworkSDK\v1.0.5000\Windows CE\Diagnostics</PROPERTY>
		<PROPERTY Name="CPU" ReadOnly="true" Protected="true">X86</PROPERTY>
		<PROPERTY Name="Platform" ReadOnly="true" Protected="true">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PLATNAME_POCKET_PC"/>
		</PROPERTY>
		<FILES Name="Default" ReadOnly="true" Protected="true">
			<xsl:element name="FILE">
				<xsl:attribute name="Name">
					<xsl:value-of select="LANGUAGE/DEFAULT/CABFILE_SYSTEM_SR"/>
				</xsl:attribute>
				<xsl:attribute name="Installer">\windows\wceload.exe</xsl:attribute>
				<xsl:attribute name="ReadOnly">true</xsl:attribute>
				<xsl:attribute name="Protected">true</xsl:attribute>
				None
			</xsl:element>
		</FILES>
	    <CAB Name="Default">
			<FILES Name="Default">
				<FILE Name="System.SR.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
			</FILES>
		</CAB>
    </PACKAGETYPE>
    <PACKAGETYPE Name="ARMV4_WCE4_DT" InvariantName="ARMV4_WCE4_DT" ReadOnly="true" Protected="true">
		<PROPERTY Name="RemotePath" ReadOnly="true" Protected="true">\</PROPERTY>
		<PROPERTY Name="RootPath" UseRelativePath="true" ReadOnly="true" Protected="true">CompactFrameworkSDK\v1.0.5000\Windows CE\Diagnostics</PROPERTY>
		<PROPERTY Name="CPU" ReadOnly="true" Protected="true">ARMV4</PROPERTY>
		<PROPERTY Name="Platform" ReadOnly="true" Protected="true">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PLATNAME_WINDOWS_CE"/>
		</PROPERTY>
		<FILES Name="Default" ReadOnly="true" Protected="true">
			<xsl:element name="FILE">
				<xsl:attribute name="Name">
					<xsl:value-of select="LANGUAGE/DEFAULT/CABFILE_SYSTEM_SR"/>
				</xsl:attribute>
				<xsl:attribute name="Installer">\windows\wceload.exe</xsl:attribute>
                <xsl:attribute name="InstallerOptions">/noaskdest</xsl:attribute>
				<xsl:attribute name="ReadOnly">true</xsl:attribute>
				<xsl:attribute name="Protected">true</xsl:attribute>
				None
			</xsl:element>
		</FILES>
	    <CAB Name="Default">
			<FILES Name="Default">
				<FILE Name="System.SR.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
			</FILES>
		</CAB>
	</PACKAGETYPE>
    <PACKAGETYPE Name="ARMV4T_WCE4_DT" InvariantName="ARTMV4T_WCE4_DT" ReadOnly="true" Protected="true">
		<PROPERTY Name="RemotePath" ReadOnly="true" Protected="true">\</PROPERTY>
		<PROPERTY Name="RootPath" UseRelativePath="true" ReadOnly="true" Protected="true">CompactFrameworkSDK\v1.0.5000\Windows CE\Diagnostics</PROPERTY>
		<PROPERTY Name="CPU" ReadOnly="true" Protected="true">ARMV4T</PROPERTY>
		<PROPERTY Name="Platform" ReadOnly="true" Protected="true">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PLATNAME_WINDOWS_CE"/>
		</PROPERTY>
		<FILES Name="Default" ReadOnly="true" Protected="true">
			<xsl:element name="FILE">
				<xsl:attribute name="Name">
					<xsl:value-of select="LANGUAGE/DEFAULT/CABFILE_SYSTEM_SR"/>
				</xsl:attribute>
				<xsl:attribute name="Installer">\windows\wceload.exe</xsl:attribute>
                <xsl:attribute name="InstallerOptions">/noaskdest</xsl:attribute>
				<xsl:attribute name="ReadOnly">true</xsl:attribute>
				<xsl:attribute name="Protected">true</xsl:attribute>
				None
			</xsl:element>
		</FILES>
	    <CAB Name="Default">
			<FILES Name="Default">
				<FILE Name="System.SR.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
			</FILES>
		</CAB>
    </PACKAGETYPE>
    <PACKAGETYPE Name="SH3_WCE4_DT" InvariantName="SH3_WCE4_DT" ReadOnly="true" Protected="true">
		<PROPERTY Name="RemotePath" ReadOnly="true" Protected="true">\</PROPERTY>
		<PROPERTY Name="RootPath" UseRelativePath="true" ReadOnly="true" Protected="true">CompactFrameworkSDK\v1.0.5000\Windows CE\Diagnostics</PROPERTY>
		<PROPERTY Name="CPU" ReadOnly="true" Protected="true">SH3</PROPERTY>
		<PROPERTY Name="Platform" ReadOnly="true" Protected="true">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PLATNAME_WINDOWS_CE"/>
		</PROPERTY>
		<FILES Name="Default" ReadOnly="true" Protected="true">
			<xsl:element name="FILE">
				<xsl:attribute name="Name">
					<xsl:value-of select="LANGUAGE/DEFAULT/CABFILE_SYSTEM_SR"/>
				</xsl:attribute>
				<xsl:attribute name="Installer">\windows\wceload.exe</xsl:attribute>
                <xsl:attribute name="InstallerOptions">/noaskdest</xsl:attribute>
				<xsl:attribute name="ReadOnly">true</xsl:attribute>
				<xsl:attribute name="Protected">true</xsl:attribute>
				None
			</xsl:element>
		</FILES>
	    <CAB Name="Default">
			<FILES Name="Default">
				<FILE Name="System.SR.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
			</FILES>
		</CAB>
 	</PACKAGETYPE>
    <PACKAGETYPE Name="SH4_WCE4_DT" InvariantName="SH4_WCE4_DT" ReadOnly="true" Protected="true">
		<PROPERTY Name="RemotePath" ReadOnly="true" Protected="true">\</PROPERTY>
		<PROPERTY Name="RootPath" UseRelativePath="true" ReadOnly="true" Protected="true">CompactFrameworkSDK\v1.0.5000\Windows CE\Diagnostics</PROPERTY>
		<PROPERTY Name="CPU" ReadOnly="true" Protected="true">SH4</PROPERTY>
		<PROPERTY Name="Platform" ReadOnly="true" Protected="true">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PLATNAME_WINDOWS_CE"/>
		</PROPERTY>
		<FILES Name="Default" ReadOnly="true" Protected="true">
			<xsl:element name="FILE">
				<xsl:attribute name="Name">
					<xsl:value-of select="LANGUAGE/DEFAULT/CABFILE_SYSTEM_SR"/>
				</xsl:attribute>
				<xsl:attribute name="Installer">\windows\wceload.exe</xsl:attribute>
                <xsl:attribute name="InstallerOptions">/noaskdest</xsl:attribute>
				<xsl:attribute name="ReadOnly">true</xsl:attribute>
				<xsl:attribute name="Protected">true</xsl:attribute>
				None
			</xsl:element>
		</FILES>
	    <CAB Name="Default">
			<FILES Name="Default">
				<FILE Name="System.SR.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
			</FILES>
		</CAB>
	</PACKAGETYPE>
    <PACKAGETYPE Name="MIPS16_WCE4_DT" InvariantName="MIPS16_WCE4_DT" ReadOnly="true" Protected="true">
		<PROPERTY Name="RemotePath" ReadOnly="true" Protected="true">\</PROPERTY>
		<PROPERTY Name="RootPath" UseRelativePath="true" ReadOnly="true" Protected="true">CompactFrameworkSDK\v1.0.5000\Windows CE\Diagnostics</PROPERTY>
		<PROPERTY Name="CPU" ReadOnly="true" Protected="true">MIPS16</PROPERTY>
		<PROPERTY Name="Platform" ReadOnly="true" Protected="true">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PLATNAME_WINDOWS_CE"/>
		</PROPERTY>
		<FILES Name="Default" ReadOnly="true" Protected="true">
			<xsl:element name="FILE">
				<xsl:attribute name="Name">
					<xsl:value-of select="LANGUAGE/DEFAULT/CABFILE_SYSTEM_SR"/>
				</xsl:attribute>
				<xsl:attribute name="Installer">\windows\wceload.exe</xsl:attribute>
                <xsl:attribute name="InstallerOptions">/noaskdest</xsl:attribute>
				<xsl:attribute name="ReadOnly">true</xsl:attribute>
				<xsl:attribute name="Protected">true</xsl:attribute>
				None
			</xsl:element>
		</FILES>
	    <CAB Name="Default">
			<FILES Name="Default">
				<FILE Name="System.SR.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
			</FILES>
		</CAB>
	</PACKAGETYPE>
    <PACKAGETYPE Name="MIPSII_WCE4_DT" InvariantName="MIPSII_WCE4_DT" ReadOnly="true" Protected="true">
		<PROPERTY Name="RemotePath" ReadOnly="true" Protected="true">\</PROPERTY>
		<PROPERTY Name="RootPath" UseRelativePath="true" ReadOnly="true" Protected="true">CompactFrameworkSDK\v1.0.5000\Windows CE\Diagnostics</PROPERTY>
		<PROPERTY Name="CPU" ReadOnly="true" Protected="true">MIPSII</PROPERTY>
		<PROPERTY Name="Platform" ReadOnly="true" Protected="true">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PLATNAME_WINDOWS_CE"/>
		</PROPERTY>
		<FILES Name="Default" ReadOnly="true" Protected="true">
			<xsl:element name="FILE">
				<xsl:attribute name="Name">
					<xsl:value-of select="LANGUAGE/DEFAULT/CABFILE_SYSTEM_SR"/>
				</xsl:attribute>
				<xsl:attribute name="Installer">\windows\wceload.exe</xsl:attribute>
                <xsl:attribute name="InstallerOptions">/noaskdest</xsl:attribute>
				<xsl:attribute name="ReadOnly">true</xsl:attribute>
				<xsl:attribute name="Protected">true</xsl:attribute>
				None
			</xsl:element>
		</FILES>
	    <CAB Name="Default">
			<FILES Name="Default">
				<FILE Name="System.SR.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
			</FILES>
		</CAB>
	</PACKAGETYPE>
    <PACKAGETYPE Name="MIPSII_FP_WCE4_DT" InvariantName="MIPSII_FP_WCE4_DT" ReadOnly="true" Protected="true">
		<PROPERTY Name="RemotePath" ReadOnly="true" Protected="true">\</PROPERTY>
		<PROPERTY Name="RootPath" UseRelativePath="true" ReadOnly="true" Protected="true">CompactFrameworkSDK\v1.0.5000\Windows CE\Diagnostics</PROPERTY>
		<PROPERTY Name="CPU" ReadOnly="true" Protected="true">MIPSII_FP</PROPERTY>
		<PROPERTY Name="Platform" ReadOnly="true" Protected="true">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PLATNAME_WINDOWS_CE"/>
		</PROPERTY>
		<FILES Name="Default" ReadOnly="true" Protected="true">
			<xsl:element name="FILE">
				<xsl:attribute name="Name">
					<xsl:value-of select="LANGUAGE/DEFAULT/CABFILE_SYSTEM_SR"/>
				</xsl:attribute>
				<xsl:attribute name="Installer">\windows\wceload.exe</xsl:attribute>
                <xsl:attribute name="InstallerOptions">/noaskdest</xsl:attribute>
				<xsl:attribute name="ReadOnly">true</xsl:attribute>
				<xsl:attribute name="Protected">true</xsl:attribute>
				None
			</xsl:element>
		</FILES>
	    <CAB Name="Default">
			<FILES Name="Default">
				<FILE Name="System.SR.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
			</FILES>
		</CAB>
	</PACKAGETYPE>
    <PACKAGETYPE Name="MIPSIV_WCE4_DT" InvariantName="MIPSIV_WCE4_DT" ReadOnly="true" Protected="true">
		<PROPERTY Name="RemotePath" ReadOnly="true" Protected="true">\</PROPERTY>
		<PROPERTY Name="RootPath" UseRelativePath="true" ReadOnly="true" Protected="true">CompactFrameworkSDK\v1.0.5000\Windows CE\Diagnostics</PROPERTY>
		<PROPERTY Name="CPU" ReadOnly="true" Protected="true">MIPSIV</PROPERTY>
		<PROPERTY Name="Platform" ReadOnly="true" Protected="true">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PLATNAME_WINDOWS_CE"/>
		</PROPERTY>
		<FILES Name="Default" ReadOnly="true" Protected="true">
			<xsl:element name="FILE">
				<xsl:attribute name="Name">
					<xsl:value-of select="LANGUAGE/DEFAULT/CABFILE_SYSTEM_SR"/>
				</xsl:attribute>
				<xsl:attribute name="Installer">\windows\wceload.exe</xsl:attribute>
                <xsl:attribute name="InstallerOptions">/noaskdest</xsl:attribute>
				<xsl:attribute name="ReadOnly">true</xsl:attribute>
				<xsl:attribute name="Protected">true</xsl:attribute>
				None
			</xsl:element>
		</FILES>
	    <CAB Name="Default">
			<FILES Name="Default">
				<FILE Name="System.SR.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
			</FILES>
		</CAB>
	</PACKAGETYPE>
    <PACKAGETYPE Name="MIPSIV_FP_WCE4_DT" InvariantName="MIPSIV_FP_WCE4_DT" ReadOnly="true" Protected="true">
		<PROPERTY Name="RemotePath" ReadOnly="true" Protected="true">\</PROPERTY>
		<PROPERTY Name="RootPath" UseRelativePath="true" ReadOnly="true" Protected="true">CompactFrameworkSDK\v1.0.5000\Windows CE\Diagnostics</PROPERTY>
		<PROPERTY Name="CPU" ReadOnly="true" Protected="true">MIPSIV_FP</PROPERTY>
		<PROPERTY Name="Platform" ReadOnly="true" Protected="true">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PLATNAME_WINDOWS_CE"/>
		</PROPERTY>
		<FILES Name="Default" ReadOnly="true" Protected="true">
			<xsl:element name="FILE">
				<xsl:attribute name="Name">
					<xsl:value-of select="LANGUAGE/DEFAULT/CABFILE_SYSTEM_SR"/>
				</xsl:attribute>
				<xsl:attribute name="Installer">\windows\wceload.exe</xsl:attribute>
                <xsl:attribute name="InstallerOptions">/noaskdest</xsl:attribute>
				<xsl:attribute name="ReadOnly">true</xsl:attribute>
				<xsl:attribute name="Protected">true</xsl:attribute>
				None
			</xsl:element>
		</FILES>
	    <CAB Name="Default">
			<FILES Name="Default">
				<FILE Name="System.SR.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
			</FILES>
		</CAB>
	</PACKAGETYPE>
    <PACKAGETYPE Name="X86_WCE4_DT" InvariantName="X86_WCE4_DT" ReadOnly="true" Protected="true">
		<PROPERTY Name="RemotePath" ReadOnly="true" Protected="true">\</PROPERTY>
		<PROPERTY Name="RootPath" UseRelativePath="true" ReadOnly="true" Protected="true">CompactFrameworkSDK\v1.0.5000\Windows CE\Diagnostics</PROPERTY>
		<PROPERTY Name="CPU" ReadOnly="true" Protected="true">X86</PROPERTY>
		<PROPERTY Name="Platform" ReadOnly="true" Protected="true">
			<xsl:value-of select="LANGUAGE/DEFAULT/PLATFORM_PLATNAME_WINDOWS_CE"/>
		</PROPERTY>
		<FILES Name="Default" ReadOnly="true" Protected="true">
			<xsl:element name="FILE">
				<xsl:attribute name="Name">
					<xsl:value-of select="LANGUAGE/DEFAULT/CABFILE_SYSTEM_SR"/>
				</xsl:attribute>
				<xsl:attribute name="Installer">\windows\wceload.exe</xsl:attribute>
                <xsl:attribute name="InstallerOptions">/noaskdest</xsl:attribute>
				<xsl:attribute name="ReadOnly">true</xsl:attribute>
				<xsl:attribute name="Protected">true</xsl:attribute>
				None
			</xsl:element>
		</FILES>
	    <CAB Name="Default">
			<FILES Name="Default">
				<FILE Name="System.SR.dll" PublicKey="969db8053d3322ac" Version="1.0.2268.00" AssemblyVersion="1.0.5000.0" Flags="1"></FILE>
			</FILES>
		</CAB>
	</PACKAGETYPE>
</PACKAGE>

</PACKAGES>
</ADDONS>
</xsl:template>
</xsl:stylesheet>
