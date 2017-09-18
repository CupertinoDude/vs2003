<?xml version="1.0"?>
<!--
xmlns:xsl="http://www.w3.org/TR/WD-xsl"             IE       
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"    XSLT
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl" xmlns:dt="urn:schemas-microsoft-com:datatypes" xmlns:d2="uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" version="1.0">
	<xsl:template match="/">
		<root>
			<xsl:apply-templates/>
		</root>
	</xsl:template>
	<xsl:template match="node()|@*">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="sample">
		<HTML>
			<HEAD>
				<TITLE>
					<xsl:value-of select="title"/>
				</TITLE>
				<STYLE>
    .Title{FONT-FAMILY: Verdana;FONT-SIZE: large;COLOR: #808080}
    </STYLE>
				<STYLE>
    .Heading{FONT-FAMILY: Verdana;FONT-SIZE: large}
    </STYLE>
				<STYLE>
    .SectionBreak{FONT-SIZE: small;MARGIN-BOTTOM: 2em}
    </STYLE>
				<STYLE>
    .SmallBreak{FONT-SIZE: small;MARGIN-BOTTOM: 1.5em}
    </STYLE>
				<STYLE>
    .Text{FONT-FAMILY: Verdana;FONT-SIZE: x-small}
    </STYLE>
				<STYLE>
    .FixedHeading{FONT-FAMILY: Verdana;FONT-SIZE: x-small}
    </STYLE>
				<STYLE>
    .FixedText{MARGIN-LEFT: 3ex;FONT-FAMILY: Lucida Console;FONT-SIZE: x-small;FONT-WEIGHT: Bold}
    </STYLE>
				<STYLE>
    .ListSansBullets {list-style-type: none;FONT-FAMILY: Verdana;FONT-SIZE: x-small}
    </STYLE>
			</HEAD>
			<BODY>
				<table>
					<tr>
						<td>
							<h2 class="Title">
								<xsl:value-of select="title"/>
							</h2>
						</td>
						<xsl:choose>
							<xsl:when test="@tutorial"/>
							<xsl:otherwise>
								<td valign="baseline" class="Text">
            &#160;&#160;&#160;
              <xsl:choose>
										<xsl:when test="@aspnet">
                  (ASP.Net Application)
                </xsl:when>
										<xsl:when test="@windowsforms">
                  (Windows Forms Application)
                </xsl:when>
										<xsl:when test="@console">
                  (Console Application)
                </xsl:when>
										<xsl:otherwise>
                  (Console Application)
                </xsl:otherwise>
									</xsl:choose>
								</td>
							</xsl:otherwise>
						</xsl:choose>
					</tr>
				</table>
				<p class="Text">
    This document contains the release information for the .NET Framework <xsl:value-of select="title-short"/> sample. You will find the following sections below: 
    </p>
				<ul class="Text">
					<li>
						<a href="#_Sample_Overview">Overview</a>
					</li>
					<xsl:if test="technologies">
						<li>
							<a href="#_Sample_Topics">Topics</a>
						</li>
					</xsl:if>
					<xsl:for-each select="customsection">
						<li>
							<a>
								<xsl:attribute name="HREF">#<xsl:value-of select="@name"/></xsl:attribute>
								<xsl:value-of select="@name"/>
							</a>
						</li>
					</xsl:for-each>
					<li>
						<a href="#_Location_of_Sample">Location</a>
					</li>
					<xsl:choose>
						<xsl:when test="@tutorial"/>
						<xsl:otherwise>
							<li>
								<a href="#_Building_the_Sample">Building the sample</a>
							</li>
							<li>
								<a href="#_Running_the_Sample">Running the sample</a>
							</li>
							<xsl:if test="uninstallsteps">
								<li>
									<a href="#_Uninstalling_the_Sample">Uninstalling the sample</a>
								</li>
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
					<li>
						<a href="#_sdkvars">Notes</a>
					</li>
				</ul>
				<p class="SectionBreak"/>
				<h4 class="Heading">
					<a name="_Sample_Overview"/>
    Overview
    </h4>
				<p class="Text">
					<xsl:for-each select="overview">
						<xsl:apply-templates/>
					</xsl:for-each>
				</p>
				<p class="SectionBreak"/>
				<xsl:apply-templates select="technologies"/>
				<p class="SectionBreak"/>
				<xsl:for-each select="customsection">
					<h4 class="Heading">
						<a>
							<xsl:attribute name="name">#<xsl:value-of select="@name"/></xsl:attribute>
						</a>
						<xsl:value-of select="@name"/>
					</h4>
					<span class="Text">
						<p class="Text">
							<xsl:apply-templates/>
						</p>
					</span>
					<p class="SectionBreak"/>
				</xsl:for-each>
				<h4 class="Heading">
					<a name="_Location_of_Sample"/>
    Location
    </h4>
				<p class="Text">
    This sample is located in the <a href="." title="Jump to Folder" target="_blank">
						<xsl:value-of select="subdirectory/text()"/>
					</a> subdirectory of the .NET Framework SDK samples directory.
    </p>
				<p class="FixedHeading">
    For Example:
      <p class="FixedText">
      C:\Program Files\Microsoft.NET\SDK\v1.1\Samples\<xsl:value-of select="subdirectory/text()"/>
					</p>
				</p>
				<xsl:if test="subdirectory/directory">
					<p class="SmallBreak"/>
					<p class="Text">
      This sample contains the following directory structure:
      
      <xsl:apply-templates select="subdirectory/directory"/>
					</p>
				</xsl:if>
				<p class="SectionBreak"/>
				<xsl:choose>
					<xsl:when test="@tutorial"/>
					<xsl:otherwise>
						<h4 class="Heading">
							<a name="_Building_the_Sample"/>
    Building the Sample
    </h4>
						<p class="Text">
    In order to properly build and run this sample, the following steps need to be performed.
    </p>
						<xsl:apply-templates select="buildsteps"/>
						<p class="SectionBreak"/>
						<h4 class="Heading">
							<a name="_Running_the_Sample"/>
    Running the Sample
    </h4>
						<p class="Text">
    In order to run this sample, follow the instructions listed below.
    </p>
						<xsl:apply-templates select="runsteps"/>
						<xsl:apply-templates select="uninstallsteps"/>
					</xsl:otherwise>
				</xsl:choose>
				<p class="SectionBreak"/>
				<h4 class="Heading">
					<a name="_sdkvars"/>
    Notes
    </h4>
				<p class="Text">
    For the .Net Framework samples to function properly, your Path, Include, and Lib environment variables must be set correctly. 
    In many cases, the SDK install program updates these environment variables for you. However, if you installed the .Net Framework SDK 
    using Visual Studio .NET, or unselected "register environment variables" during setup, these environment variables will not be updated. 
    You can set the Path, Include and Lib environment variables by running SDKVars.bat, located in the <i>&lt;SDKRoot&gt;\Bin</i> directory. 
    SDKVars.bat must be executed in every command shell.
    </p>
			</BODY>
		</HTML>
	</xsl:template>
	<xsl:template match="buildsteps">
		<xsl:if test="step/@vroot">
			<span class="Text">
          This sample requires an IIS virtual directory. 
          Clicking on the following link will create a virtual directory at <br/>
			</span>
		</xsl:if>
		<xsl:for-each select="step">
			<xsl:if test="@vroot">
				<span class="Text">
          &#160;&#160;&#160;&#160;&#160;http://localhost/NetSDK/<xsl:value-of select="@vroot"/>
					<br/>
				</span>
			</xsl:if>
		</xsl:for-each>
		<xsl:if test="step/@vroot">
			<span class="Text">
				<a href="CreateVRoot.vbs" title="Create Virtual Directory">Create Virtual Directory</a>
				<br/>
			</span>
		</xsl:if>
		<xsl:for-each select="step">
			<xsl:choose>
				<xsl:when test="@vroot"/>
				<xsl:otherwise>
					<p class="Text">
						<xsl:apply-templates/>
					</p>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="runsteps">
		<span class="Text">
			<xsl:apply-templates select="step"/>
		</span>
	</xsl:template>
	<xsl:template match="uninstallsteps">
		<p class="SectionBreak"/>
		<h4 class="Heading">
			<a name="_Uninstalling_the_Sample"/>			
			Uninstalling the Sample
		</h4>
		<p class="Text">
			In order to uninstall this sample, follow the instructions listed below.
		</p>
		<span class="Text">
			<xsl:apply-templates select="step"/>
		</span>
	</xsl:template>
	<xsl:template match="step">
		<ul class="Text">
			<li>
				<xsl:apply-templates/>
			</li>
		</ul>
	</xsl:template>
	<xsl:template match="directory">
		<ul>
			<li class="ListSansBullets">
				<b>\<xsl:value-of select="@name"/>
				</b> -- 
     <xsl:apply-templates/>
			</li>
		</ul>
	</xsl:template>
	<xsl:template match="example">
		<p class="FixedHeading">
  For Example:
  </p>
		<p class="FixedText">
			<xsl:apply-templates/>
		</p>
	</xsl:template>
	<xsl:template match="technologies">
		<h4 class="Heading">
			<a name="_Sample_Topics"/>
  Topics
  </h4>
		<p class="Text">
  The following bullets briefly describe the <xsl:if test="technology/class">classes and </xsl:if>technologies used by this sample.
  </p>
		<ul class="Text">
			<xsl:apply-templates select="technology"/>
		</ul>
	</xsl:template>
	<xsl:template match="technology">
		<li>
			<b>
				<xsl:value-of select="@name"/> - </b>
			<xsl:apply-templates/>
		</li>
	</xsl:template>
	<xsl:template match="class">
		<ul class="Text">
			<li>
				<b>
					<xsl:value-of select="@name"/> - </b>
				<xsl:apply-templates/>
			</li>
		</ul>
	</xsl:template>
	<xsl:template match="richcontent">
		<xsl:choose>
			<xsl:when test="@bold">
				<b>
					<xsl:value-of select="text()"/>
				</b>
			</xsl:when>
			<xsl:when test="@plain">
				<xsl:value-of select="text()"/>
			</xsl:when>
			<xsl:when test="@paragraph">
				<p>
					<xsl:value-of select="text()"/>
				</p>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="text()"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
