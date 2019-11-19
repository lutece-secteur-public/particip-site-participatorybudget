<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:param name="site-path" select="site-path" />
	<xsl:variable name="portlet-id" select="portlet/portlet-id" />

	<xsl:template match="portlet">
	
		<xsl:variable name="device_class">
		<xsl:choose>
			<xsl:when test="string(display-on-small-device)='0'">hidden-xs</xsl:when>
			<xsl:when test="string(display-on-small-device)='0'">hidden-sm</xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<div id="portlet-policy" class="{$device_class}">
			<xsl:if test="not(string(display-portlet-title)='1')">
				<div class="portlet-header">
					<xsl:value-of disable-output-escaping="yes" select="portlet-name" />
				</div>
			</xsl:if>
			<div class="portlet-content" >
				<xsl:apply-templates select="document-portlet/document/document-xml-content/info" />  
			</div>
		</div>
		
	</xsl:template>

	<xsl:template match="info">
		<xsl:value-of select="info-content" disable-output-escaping="yes" />
		<!-- div class="attachment"><xsl:value-of select="info-attachment" disable-output-escaping="yes" /></div -->
		<!-- div id="close-suite"><a href="#" class="btn btn-link">Fermer</a></div -->
		<!-- <xsl:value-of select="info-button" disable-output-escaping="yes" /> -->
	</xsl:template>

</xsl:stylesheet>