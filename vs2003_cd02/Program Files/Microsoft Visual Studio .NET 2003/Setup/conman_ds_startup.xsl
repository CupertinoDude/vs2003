<?xml version="1.0" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
<STARTUPS xmlns:dt="urn:schemas-microsoft-com:datatypes" xmlns="urn:platform-schema" ReadOnly="False" Protected="False" Version="7.10.3077.0">

<xsl:element name="STARTUP">
	<xsl:attribute name="Name">
		<xsl:value-of select="LANGUAGE/DEFAULT/STARTUP_STARTUPNAME_EMULATION"/>
	</xsl:attribute>
	<xsl:attribute name="InvariantName">Emulation Startup Provider</xsl:attribute>
	<xsl:attribute name="ReadOnly">false</xsl:attribute>
	<xsl:attribute name="Protected">true</xsl:attribute>
    <PROPERTY Name="default" ReadOnly="true" Protected="true">yes</PROPERTY>
    <PROPERTY Name="type" ReadOnly="true" Protected="true">emulator</PROPERTY>
    <PROPERTY Name="LocalAssemblyFile" ReadOnly="true" Protected="true">$dynamicAssemblies$\emustartup.dll</PROPERTY>
</xsl:element>
<xsl:element name="STARTUP">
	<xsl:attribute name="Name">
		<xsl:value-of select="LANGUAGE/DEFAULT/STARTUP_STARTUPNAME_ACTIVESYNC"/>
	</xsl:attribute>
	<xsl:attribute name="InvariantName">ActiveSync Startup Provider</xsl:attribute>
	<xsl:attribute name="ReadOnly">true</xsl:attribute>
	<xsl:attribute name="Protected">true</xsl:attribute>
    <PROPERTY Name="default" ReadOnly="true" Protected="true">yes</PROPERTY>
    <PROPERTY Name="type" ReadOnly="true" Protected="true">activesync</PROPERTY>
    <PROPERTY Name="LocalAssemblyFile" ReadOnly="true" Protected="true">$dynamicAssemblies$\cestartup.dll</PROPERTY>  
</xsl:element>
</STARTUPS>
</xsl:template>
</xsl:stylesheet>
