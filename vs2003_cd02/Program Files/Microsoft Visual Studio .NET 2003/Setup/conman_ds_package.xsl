<?xml version="1.0" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
<PACKAGES xmlns:dt="urn:schemas-microsoft-com:datatypes" xmlns="urn:platform-schema" ReadOnly="False" Protected="False" Version="7.10.3077.0">

<PACKAGE Name=".netcf installable CAB" InvariantName=".netcf installable CAB" ReadOnly="true" Protected="true">
	<PROPERTY Name="IsDeviceDependent" ReadOnly="true" Protected="false">yes</PROPERTY>
</PACKAGE>

<PACKAGE Name=".netcf installable CAB -- Developer Tools" InvariantName=".netcf installable CAB -- Developer Tools" ReadOnly="true" Protected="true">
	<PROPERTY Name="IsDeviceDependent" ReadOnly="true" Protected="false">yes</PROPERTY>
</PACKAGE>

<PACKAGE Name="Installable CAB Assemblies" InvariantName="Installable CAB Assemblies" ReadOnly="true" Protected="true">
    <PROPERTY Name="IsDeviceDependent" ReadOnly="true" Protected="true">no</PROPERTY>
    <PACKAGETYPE Name="Redist Assembly Contents" InvariantName="Redist Assembly Contents" ReadOnly="true" Protected="true">
      <PROPERTY Name="RemotePath" ReadOnly="true" Protected="true">\donotdownload</PROPERTY>
      <PROPERTY Name="RootPath" ReadOnly="true" Protected="true">\donotdownload</PROPERTY>
      <FILES Name="Default" ReadOnly="true" Protected="true">
        <FILE Name="mscorlib.dll" ReadOnly="true" Protected="true">None</FILE>
        <FILE Name="System.dll" ReadOnly="true" Protected="true">None</FILE>
        <FILE Name="System.Drawing.dll" ReadOnly="true" Protected="true">None</FILE>
        <FILE Name="System.Web.Services.dll" ReadOnly="true" Protected="true">None</FILE>
        <FILE Name="System.Windows.Forms.dll" ReadOnly="true" Protected="true">None</FILE>
        <FILE Name="System.Xml.dll" ReadOnly="true" Protected="true">None</FILE>
        <FILE Name="System.Net.IrDA.dll" ReadOnly="true" Protected="true">None</FILE>
        <FILE Name="System.Data.dll" ReadOnly="true" Protected="true">None</FILE>
        <FILE Name="Microsoft.VisualBasic.dll" ReadOnly="true" Protected="true">None</FILE>
        <FILE Name="System.Data.SqlClient.dll" ReadOnly="true" Protected="true">None</FILE>
        <FILE Name="System.Data.Common.dll" ReadOnly="true" Protected="true">None</FILE>
        <FILE Name="System.Data.SqlServerCe.dll" ReadOnly="true" Protected="true">None</FILE>
      </FILES>
    </PACKAGETYPE>
</PACKAGE>

</PACKAGES>
</xsl:template>
</xsl:stylesheet>
