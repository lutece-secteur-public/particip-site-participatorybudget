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
<div class="portlet portlet-piecharts {$device_class}">
	<xsl:if test="not(string(display-portlet-title)='1')">
		<h2 class="portlet-header">
			<xsl:value-of disable-output-escaping="yes" select="portlet-name" />
		</h2>
	</xsl:if>
	<div class="portlet-content" >
		<xsl:apply-templates select="document-portlet/document/document-xml-content/steps" />  
	</div>
</div>
</xsl:template>

<xsl:template match="steps">
	<div class="row">
	<h2 class="title1 text-center">
		<xsl:value-of disable-output-escaping="yes" select="document-summary" />
	</h2>
	</div>
	<div class="row">
		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
			<h3 class="sub-title"><xsl:value-of select="steps-title_1" disable-output-escaping="yes" /></h3>
			<xsl:value-of select="steps-content_1" disable-output-escaping="yes" />
		</div>
		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
			<div class="image text-center"><xsl:value-of select="steps-image_1" disable-output-escaping="yes" /></div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 hidden-xs centered">
			<div class="image text-center"><xsl:value-of select="steps-image_2" disable-output-escaping="yes" /></div>
		</div>
		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
			<h3 class="sub-title"><xsl:value-of select="steps-title_2" disable-output-escaping="yes" /></h3>
			<xsl:value-of select="steps-content_2" disable-output-escaping="yes" />
		</div>
		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 hidden-sm hidden-md hidden-lg">
			<div class="image text-center"><xsl:value-of select="steps-image_2" disable-output-escaping="yes" /></div>
		</div>
	</div>

</xsl:template>
</xsl:stylesheet>

