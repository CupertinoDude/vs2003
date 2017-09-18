<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl">
	<xsl:template match="/">
		<html>
			<head>
				<title>CLI Fundamentals</title>
				<link rel="stylesheet" href="CLI.css" TYPE="text/css"/>
			</head>
			<body class="toc_body">
				<xsl:apply-templates select="Document"/>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="Document">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="Topic">
		<div>
			<p>

				<a class="toc_topic" target="main">
				
					<xsl:choose>
					<xsl:when test="@Src">
						<xsl:attribute name="href">
							<xsl:value-of select="@Src"/>
						</xsl:attribute>
					</xsl:when>
					<xsl:otherwise>
					</xsl:otherwise>
					</xsl:choose>

				<xsl:value-of select="@Caption"/>
				</a>
				<br/>
				
				<xsl:apply-templates select="Item"/>
			</p>
		</div>
	</xsl:template>
	
	<xsl:template match="Item">
			&#160;
			<a class="toc_item" target="main">
				<xsl:attribute name="href">
					<xsl:value-of select="@Src"/>
				</xsl:attribute>
				<xsl:value-of select="@Caption"/>
			</a>
			<br/>
	</xsl:template>

</xsl:stylesheet>
