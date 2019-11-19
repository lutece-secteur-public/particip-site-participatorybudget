<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes"/>

<xsl:template match="portlet">

<xsl:variable name="device_class">
		<xsl:choose>
			<xsl:when test="string(display-on-small-device)='0'">hidden-xs</xsl:when>
			<xsl:when test="string(display-on-normal-device)='0'">hidden-sm</xsl:when>
			<xsl:when test="string(display-on-large-device)='0'">hidden-md</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
</xsl:variable>

<div class="portlet portlet-twitter {$device_class} col-md-10 col-lg-10">

<xsl:choose>
	<xsl:when test="not(string(display-portlet-title)='1')">
		<div class="title2">
			<xsl:value-of disable-output-escaping="yes" select="portlet-name" />
		</div>
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
	<xsl:value-of disable-output-escaping="yes" select="." />
</xsl:template>

</xsl:stylesheet>