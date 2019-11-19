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
<div class="portlet-steps {$device_class}">
	<xsl:if test="not(string(display-portlet-title)='1')">
		<h3 class="portlet-header">
			<xsl:value-of disable-output-escaping="yes" select="portlet-name" />
		</h3>
	</xsl:if>
	<div class="portlet-content" >
		<xsl:apply-templates select="document-portlet/document/document-xml-content/steps" />  
	</div>
</div>
</xsl:template>

<xsl:template match="steps">
	<div class="row">
		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 steps">
			<h4><xsl:value-of select="steps-title_1" disable-output-escaping="yes" /></h4>
			<xsl:value-of select="steps-content_1" disable-output-escaping="yes" />
			<div class="image"><xsl:value-of select="steps-image_1" disable-output-escaping="yes" /></div>
		</div>
		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 steps">
			<h4><xsl:value-of select="steps-title_2" disable-output-escaping="yes" /></h4>
			<xsl:value-of select="steps-content_2" disable-output-escaping="yes" />
			<div class="image"><xsl:value-of select="steps-image_2" disable-output-escaping="yes" /></div>
		</div>
	</div>
	
<!-- 	<div class="clearfix"></div> -->
	
	<div class="row">
		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 steps">
			<h4><xsl:value-of select="steps-title_3" disable-output-escaping="yes" /></h4>
			<xsl:value-of select="steps-content_3" disable-output-escaping="yes" />
			<div class="image"><xsl:value-of select="steps-image_3" disable-output-escaping="yes" /></div>
		</div>
		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 steps">
			<h4><xsl:value-of select="steps-title_4" disable-output-escaping="yes" /></h4>
			<xsl:value-of select="steps-content_4" disable-output-escaping="yes" />
			<div class="image"><xsl:value-of select="steps-image_4" disable-output-escaping="yes" /></div>
		</div>
	</div>
	
<!-- 	<div class="clearfix"></div> -->
	

	<div class="row">
		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 steps">
			<h4><xsl:value-of select="steps-title_5" disable-output-escaping="yes" /></h4>
			<xsl:value-of select="steps-content_5" disable-output-escaping="yes" />
			<div class="image"><xsl:value-of select="steps-image_5" disable-output-escaping="yes" /></div>
		</div>
		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 steps">
			<h4><xsl:value-of select="steps-title_6" disable-output-escaping="yes" /></h4>
			<xsl:value-of select="steps-content_6" disable-output-escaping="yes" />
			<xsl:value-of select="steps-attachment" disable-output-escaping="yes" />
			<div class="image"><xsl:value-of select="steps-image_6" disable-output-escaping="yes" /></div>
		</div>
	</div>
	
<!-- 	<div class="clearfix"></div> -->

	<div class="row">
		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 steps">
			<h4><xsl:value-of select="steps-title_7" disable-output-escaping="yes" /></h4>
			<xsl:value-of select="steps-content_7" disable-output-escaping="yes" />
			<div class="image"><xsl:value-of select="steps-image_7" disable-output-escaping="yes" /></div>
		</div>
		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 steps">
			<h4><xsl:value-of select="steps-title_8" disable-output-escaping="yes" /></h4>
			<xsl:value-of select="steps-content_8" disable-output-escaping="yes" />
			<xsl:value-of select="steps-attachment" disable-output-escaping="yes" />
			<div class="image"><xsl:value-of select="steps-image_8" disable-output-escaping="yes" /></div>
		</div>
	</div>
	
<!-- 	<div class="clearfix"></div> -->
	
</xsl:template>
</xsl:stylesheet>

