<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes"/>

<xsl:template match="portlet">
<xsl:variable name="device_class">
<xsl:choose>
	<xsl:when test="string(display-on-small-device)='0'">hidden-phone</xsl:when>
	<xsl:when test="string(display-on-normal-device)='0'">hidden-tablet</xsl:when>
	<xsl:when test="string(display-on-large-device)='0'">hidden-desktop</xsl:when>
	<xsl:otherwise></xsl:otherwise>
</xsl:choose>
</xsl:variable>

	<div class="portlet portlet-freetext{$device_class}">
	<xsl:choose>
	<xsl:when test="not(string(display-portlet-title)='1')">
	<h3><xsl:value-of disable-output-escaping="yes" select="portlet-name" /></h3>
	<xsl:apply-templates select="html-portlet" />
	</xsl:when>
	<xsl:otherwise>
	<xsl:apply-templates select="html-portlet" />
	</xsl:otherwise>
	</xsl:choose>
	</div>
</xsl:template>
	
<xsl:template match="html-portlet">
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12">
			<div class="project-list-freetext content-type1">
				<xsl:apply-templates select="html-portlet-content" />
			</div>
		</div>
	</div>
</xsl:template>
	
<xsl:template match="html-portlet-content">
	<xsl:value-of disable-output-escaping="yes" select="." />
</xsl:template>

</xsl:stylesheet>




