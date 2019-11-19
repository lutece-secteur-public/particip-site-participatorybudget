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

<div id="portlet-results" class="portlet {$device_class}">
<xsl:if test="not(string(display-portlet-title)='1')">
	<h3 class="portlet-header">
		<xsl:value-of disable-output-escaping="yes" select="portlet-name" />
	</h3>
</xsl:if>
	<div class="centered">
		<xsl:apply-templates select="document-portlet/document/document-xml-content/info" />  
	</div>
</div>
</xsl:template>

<xsl:template match="info">
	<div class="title1"><xsl:value-of select="info-content" disable-output-escaping="yes" /></div>
	<a class="btn" href="jsp/site/Portal.jsp?document_id=133&#38;portlet_id=100">
		<xsl:value-of select="info-button" disable-output-escaping="yes" />
	</a>
</xsl:template>

</xsl:stylesheet>

