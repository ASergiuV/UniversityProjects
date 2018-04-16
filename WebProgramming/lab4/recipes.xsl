<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:ex="http://exslt.org/dates-and-times"
    extension-element-prefixes="ex">

	

<xsl:template match="/">

	<html>
		
		<head style = "height: 100%;">
		  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
		</head>
		
		<body>
			<h1>This week's recipes</h1>
				<table border="1" style = "width: 100%; height: 100%;">
				<tr bgcolor="#6A9D3D">
					  <th>Image</th>
					  <th>Title</th>
					  <th>Ingredients</th>
					  <th>Preparation Time</th>
					  <th>Servings</th>
					  <th>Type</th>
				</tr>
				
				
				
				<xsl:for-each select="catalog/recipe">
					
						<tr>
							<td>
								<xsl:call-template name="floater">
								<xsl:with-param name="position">left</xsl:with-param>
								<xsl:with-param name="width">0.5in</xsl:with-param>
								<xsl:with-param name="start.indent">0.5in</xsl:with-param>
								<xsl:with-param name="content">
								  <fo:block margin-top="1em"
											padding="3pt"
											text-align="center"
											border="1pt solid grey">
									<fo:external-graphic width="100" height="100">
									  <xsl:attribute name="src">
										<xsl:value-of select = "img"/>
									  </xsl:attribute>
									</fo:external-graphic>
								  </fo:block>
								</xsl:with-param>
							  </xsl:call-template>
							  
								<!--<xsl:element name = "img">
									<xsl:attribute name="width">
										100
								    </xsl:attribute>
									<xsl:attribute name="height">
										100
								    </xsl:attribute>
									<xsl:attribute name = "src">
										<xsl:value-of select = "img"/>
									</xsl:attribute>
								</xsl:element>-->
							</td>
							<td><xsl:value-of select="title"/></td>
							<td><xsl:value-of select="ingredients"/></td>
							<td><xsl:value-of select="preparationTime"/></td>
							<td><xsl:value-of select="servings"/></td>
							<td><xsl:value-of select="type"/></td>
							
						</tr>
				</xsl:for-each>
				
			</table>
		</body>
	</html>
	<xsl:apply-imports/>  <!-- dont forget -->
</xsl:template>

</xsl:stylesheet>