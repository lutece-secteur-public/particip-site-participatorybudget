<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:param name="site-path" select="site-path" />
<xsl:variable name="portlet-id" select="portlet/portlet-id" />
<xsl:template match="portlet">
<xsl:variable name="device_class">
<xsl:choose>
	<xsl:when test="string(display-on-small-device)='0'">hidden-xs</xsl:when>
    <xsl:when test="string(display-on-normal-device)='0'">hidden-sm</xsl:when>
    <xsl:when test="string(display-on-large-device)='0'">hidden-md</xsl:when>
	<xsl:otherwise></xsl:otherwise>
	</xsl:choose>
</xsl:variable>

<div class="portlet {$device_class}">
	<div class="portlet-homepage-generic {document-portlet/document/document-xml-content/info/info-class}">
		<xsl:choose>
			<xsl:when test="document-portlet/document/document-xml-content/info/info-image/file-resource!=''">
				<xsl:attribute name="style">
					<xsl:apply-templates select="document-portlet/document/document-xml-content/info/info-image/file-resource" />
				</xsl:attribute>	
			</xsl:when>
			<xsl:otherwise>
			</xsl:otherwise>
		</xsl:choose>
		
		<xsl:if test="not(string(display-portlet-title)='1')">
			<h3 class="title1">
				<xsl:value-of disable-output-escaping="yes" select="portlet-name" />
			</h3>
		</xsl:if>
		&#160;
	<xsl:apply-templates select="document-portlet/document/document-xml-content/info" />  
	</div>
</div>
</xsl:template>

<xsl:template match="info">

	<xsl:choose>
		<xsl:when test="info-content!=''">
				<xsl:value-of select="info-content" disable-output-escaping="yes" />
		</xsl:when>
	</xsl:choose>
	
	<xsl:choose>
		<xsl:when test="info-attachment!=''">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<xsl:value-of select="info-attachment" disable-output-escaping="yes" />
		</div>
		</xsl:when>
	</xsl:choose>
	
	<xsl:choose>
		<xsl:when test="info-link!=''">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<a class="btn" href="{info-link}"><xsl:value-of select="info-button" disable-output-escaping="yes" /></a>
			</div>
		</xsl:when>
	</xsl:choose>
	
	<xsl:choose>
		<xsl:when test="info-video!=''">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<a class="btn" href="{info-video}">
				<xsl:attribute name="data-toggle">lightbox</xsl:attribute>	
				<xsl:attribute name="data-remote">
					<xsl:value-of select="info-video" />
				</xsl:attribute>
				<xsl:attribute name="data-type">vimeo</xsl:attribute>	
				<xsl:value-of select="info-button" disable-output-escaping="yes" />
				</a>
			</div>
		</xsl:when>
	</xsl:choose>

	<xsl:choose>
		<xsl:when test="info-video_embed!=''">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<div class="video centered embed-responsive embed-responsive-16by9">
					<iframe>
						<xsl:attribute name="src">
						<xsl:value-of select="info-video_embed" />
						</xsl:attribute>
					</iframe>
				</div>
			</div>
		</xsl:when>
	</xsl:choose>
	
	<xsl:choose>
		<xsl:when test="info-embed!=''">
			<iframe>
				<xsl:attribute name="width"></xsl:attribute>
				<xsl:attribute name="height"></xsl:attribute>
				<xsl:attribute name="src">
					<xsl:value-of select="info-embed" />
				</xsl:attribute>
			</iframe>
		</xsl:when>
	</xsl:choose>	

</xsl:template>

<xsl:template match="file-resource">
	<xsl:value-of select="concat('background:url(document?id=', resource-document-id ,'&amp;id_attribute=', resource-attribute-id, ')  center center / cover')" />
</xsl:template>

</xsl:stylesheet>