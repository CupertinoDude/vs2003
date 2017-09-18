<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl">
	<xsl:template match="/">
		<html>
			<head>
				<title>CLI Fundamentals</title>
				<link rel="stylesheet" href="CLI.css" TYPE="text/css"/>
			</head>
			<body class="document_body">
				<xsl:apply-templates select="Document"/>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="Document">
		<div class="document_title">
			<xsl:value-of select="@Title"/>
		</div>
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="Paragraph">
		<div>
			<p>
				<div class="paragraph_caption">
					<xsl:value-of select="@Title"/>
				</div>
				
				<xsl:value-of select="text()"/>
				
				<ul>
					<xsl:apply-templates select="List"/>
				</ul>
				
				<xsl:apply-templates select="Code"/>
			
				<xsl:apply-templates select="Image"/>
			
				<xsl:apply-templates select="Sample"/>
			
				<xsl:apply-templates select="Table"/>
			</p>
		</div>
	</xsl:template>

	<xsl:template match="Navigation">
		<br/><br/>
		<p>
			<xsl:apply-templates select="Previous"/>
			<xsl:apply-templates select="Next"/>
		</p>
	</xsl:template>
	
	<xsl:template match="Code">
		<ul class="code">
			<pre>
				<xsl:value-of select="text()" disable-output-escaping="yes"/>
			</pre>
		</ul>
	</xsl:template>

	<xsl:template match="List">
			<li>
				<b>
					<xsl:value-of select="@Title"/> 
				</b>
				<xsl:value-of select="text()"/>
				<br/>
			</li>
	</xsl:template>
	
	<xsl:template match="Image">
		<div>
			<img>
				<xsl:attribute name="src">
					<xsl:value-of select="@Src"/>
				</xsl:attribute>
			</img>
			<br/>
		</div>
	</xsl:template>

	<xsl:template match="Sample">
		<ul>
			<br/>
			<div class="sample_caption">
				<img>
					<xsl:attribute name="src">
						<xsl:value-of select="@Image"/>
					</xsl:attribute>
				</img>
				<br/>
					<xsl:value-of select="@Caption"/>
			</div>
			<a target="_blank" class="sample_link">
				<xsl:attribute name="href">
					<xsl:value-of select="CSPath"/>
				</xsl:attribute>
				[CS Sample]
			</a>
			<a target="_blank" class="sample_link">
				<xsl:attribute name="href">
					<xsl:value-of select="VBPath"/>
				</xsl:attribute>
				[VB Sample]
			</a>
		</ul>	
	</xsl:template>
	
	<xsl:template match="Table">
		<table border="1" style="border-collapse: collapse" CELLPADDING="5" class="table">
			<xsl:for-each select="Row">
				<xsl:choose>
					<xsl:when test="@Header">
						<tr class="table_header">
							<xsl:apply-templates select="."/>
						</tr>
					</xsl:when>
					<xsl:otherwise>
						<tr valign="top" class="table_row">
							<xsl:apply-templates select="."/>
						</tr>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</table>
	</xsl:template>

	<xsl:template match="Row">
			<xsl:for-each select="Column">
				<xsl:choose>
					<xsl:when test="@Title">
						<td width="300px">
							<xsl:value-of select="."/>
						</td>
					</xsl:when>
					<xsl:otherwise>
						<td class="table_column">
							<xsl:value-of select="."/>
						</td>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
	</xsl:template>

	<xsl:template match="Previous">
		<a class="navigation_link">
		<xsl:attribute name="href">
			<xsl:value-of select="text()"/>
		</xsl:attribute>
			&lt;&lt;&#160;&#160;Previous
		</a>
		&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
	</xsl:template>
	
	<xsl:template match="Next">
		<a class="navigation_link">
		<xsl:attribute name="href">
			<xsl:value-of select="text()"/>
		</xsl:attribute>
			Next&#160;&#160;&gt;&gt;
		</a>
	</xsl:template>
	
</xsl:stylesheet>
