<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes"/>

<xsl:template match="portlet">

<xsl:variable name="device_class">
<xsl:choose>
	<xsl:when test="string(display-on-small-device)='0'">hidden-phone</xsl:when>
	<xsl:otherwise></xsl:otherwise>
</xsl:choose>
</xsl:variable>

<div class="portlet portlet-video {$device_class}">

<xsl:choose>
	<xsl:when test="not(string(display-portlet-title)='1')">
		<h2 class="title1">
			<xsl:value-of disable-output-escaping="yes" select="portlet-name" />
		</h2>
		<div class="portlet-content">
			<xsl:apply-templates select="html-portlet" />
		</div>
	</xsl:when>
	<xsl:otherwise>
		<div class="portlet-content">
			<xsl:apply-templates select="html-portlet" />
		</div>
	</xsl:otherwise>
</xsl:choose>


</div>
</xsl:template>
	
<xsl:template match="html-portlet">
	<xsl:apply-templates select="html-portlet-content" />
</xsl:template>
	
<xsl:template match="html-portlet-content">
	<div class="video centered embed-responsive embed-responsive-16by9"><xsl:value-of disable-output-escaping="yes" select="." /></div>
</xsl:template>

</xsl:stylesheet>




