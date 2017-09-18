<?xml version="1.0" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
<TRANSPORTS xmlns:dt="urn:schemas-microsoft-com:datatypes" xmlns="urn:platform-schema" ReadOnly="False" Protected="False" Version="7.10.3077.0">

<xsl:element name="TRANSPORT">
	<xsl:attribute name="Name">
		<xsl:value-of select="LANGUAGE/DEFAULT/TRANSPORT_TRANSPORTNAME_EMULATION"/>
	</xsl:attribute>
	<xsl:attribute name="InvariantName">Emulation</xsl:attribute>
	<xsl:attribute name="ReadOnly">false</xsl:attribute>
	<xsl:attribute name="Protected">true</xsl:attribute>
    <PROPERTY Name="default" ReadOnly="true" Protected="true">yes</PROPERTY>
    <PROPERTY Name="type" ReadOnly="true" Protected="true">emulator</PROPERTY>
    <PROPERTY Name="port" ReadOnly="true" Protected="true">5659</PROPERTY>
    <PROPERTY Name="device:ip" ReadOnly="false" Protected="true">0.0.0.1</PROPERTY>
    <PROPERTY Name="device:port" ReadOnly="true" Protected="true">5659</PROPERTY>
    <PROPERTY Name="LocalAssemblyFile" ReadOnly="true" Protected="true">$dynamicAssemblies$\emutransport.dll</PROPERTY>
    <PROPERTY Name="DebuggerTransport" ReadOnly="true" Protected="true">$dynamicAssemblies$\..\transports\desktop\cmtnpt_tcpaccept.dll</PROPERTY>
    <PROPERTY Name="TypeName" ReadOnly="true" Protected="true">EmulatorTransport</PROPERTY>
</xsl:element>
<xsl:element name="TRANSPORT">
	<xsl:attribute name="Name">
		<xsl:value-of select="LANGUAGE/DEFAULT/TRANSPORT_TRANSPORTNAME_TCPCONNECT"/>
	</xsl:attribute>
	<xsl:attribute name="InvariantName">TCP Connect Transport</xsl:attribute>
	<xsl:attribute name="ReadOnly">false</xsl:attribute>
	<xsl:attribute name="Protected">true</xsl:attribute>
    <PROPERTY Name="default" ReadOnly="true" Protected="true">yes</PROPERTY>
    <PROPERTY Name="type" ReadOnly="true" Protected="true">tcp_connect</PROPERTY>
    <PROPERTY Name="ip" ReadOnly="true" Protected="true">0.0.0.1</PROPERTY>
    <PROPERTY Name="port" ReadOnly="true" Protected="true">5656</PROPERTY>
    <PROPERTY Name="device:ip" ReadOnly="false" Protected="true">0.0.0.1</PROPERTY>
    <PROPERTY Name="device:port" ReadOnly="false" Protected="true">5656</PROPERTY>    
    <PROPERTY Name="LocalAssemblyFile" ReadOnly="true" Protected="true">$dynamicAssemblies$\tcptransport_connect.dll</PROPERTY>
    <PROPERTY Name="DebuggerTransport" ReadOnly="true" Protected="true">$dynamicAssemblies$\..\transports\desktop\cmtnpt_tcpconnect.dll</PROPERTY>
</xsl:element>
<xsl:element name="TRANSPORT">
	<xsl:attribute name="Name">
		<xsl:value-of select="LANGUAGE/DEFAULT/TRANSPORT_TRANSPORTNAME_IRDA"/>
	</xsl:attribute>
	<xsl:attribute name="InvariantName">IrDA Transport</xsl:attribute>
	<xsl:attribute name="ReadOnly">true</xsl:attribute>
	<xsl:attribute name="Protected">true</xsl:attribute>
    <PROPERTY Name="default" ReadOnly="true" Protected="true">yes</PROPERTY>
    <PROPERTY Name="type" ReadOnly="true" Protected="true">irda</PROPERTY>
    <PROPERTY Name="LocalAssemblyFile" ReadOnly="true" Protected="true">$dynamicAssemblies$\irdatransport_accept.dll</PROPERTY>
    <PROPERTY Name="DebuggerTransport" ReadOnly="true" Protected="true">$dynamicAssemblies$\..\transports\desktop\cmtnpt_tcpconnect.dll</PROPERTY>
</xsl:element>
</TRANSPORTS>
</xsl:template>
</xsl:stylesheet>
