<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:param name="site-path" select="site-path" />
<xsl:variable name="portlet-id" select="portlet/portlet-id" />
    
<xsl:template match="portlet">
	<xsl:apply-templates select="document-list-portlet" />
</xsl:template>


<xsl:template match="document-list-portlet">
	<xsl:variable name="device_class">
        <xsl:choose>
            <xsl:when test="string(display-on-small-device)='0'">hidden-xs</xsl:when>
            <xsl:when test="string(display-on-normal-device)='0'">hidden-sm</xsl:when>
            <xsl:when test="string(display-on-large-device)='0'">hidden-md</xsl:when>
			<xsl:when test="string(display-on-xlarge-device)='0'">hidden-lg</xsl:when>
            <xsl:otherwise></xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
	<div class="row">
		<section id="actualite_sidebar" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<!-- div class="portlet-sidebar-actualites {$device_class}">
				<h1>Plus d'actualit&#233;s</h1>
			</div -->
			<div class="row">
				<xsl:apply-templates select="document" />
			</div>
		</section>
	</div>
</xsl:template>


<xsl:template match="document">
	<!-- xsl:choose>
		<xsl:when test="position() mod 2=1">
		<div class="col-xs-12 col-sm-6 col-md-6 left">
			<xsl:apply-templates select="document-xml-content/actualite" />
		</div>
		</xsl:when>
		
		<xsl:when test="position() mod 2=0">
		<div class="col-xs-12 col-sm-6 col-md-6 right">
			<xsl:apply-templates select="document-xml-content/actualite" />
		</div>
		</xsl:when>
	</xsl:choose -->
	<div class="col-xs-12 col-sm-6 col-md-4">
		<xsl:apply-templates select="document-xml-content/actualite" />
	</div>
</xsl:template>

<xsl:template match="actualite">
    <div id="actu-{document-id}" class="actualite">
	
		<!-- a href="{$site-path}?document_id={document-id}&#38;portlet_id={$portlet-id}" title="{document-title}" target="_top" -->
		<a title="{document-title}" target="_top">

			<xsl:choose>
				<xsl:when test="actualite-url_redirection != '' and actualite-url_redirection != 'http://' and actualite-url_redirection != 'https://'">
					<xsl:attribute name="href"><xsl:value-of select="actualite-url_redirection"/></xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="href"><xsl:value-of select="$site-path"/>?document_id=<xsl:value-of select="document-id"/>&#38;portlet_id=<xsl:value-of select="$portlet-id"/></xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>

			<xsl:choose>
			
				<xsl:when test="actualite-imagemini/file-resource!=''">
					 <xsl:apply-templates select="actualite-imagemini/file-resource" />
				</xsl:when>
			
				<xsl:when test="actualite-image/file-resource!=''">
					 <xsl:apply-templates select="actualite-image/file-resource" />
				</xsl:when>
				
				<xsl:otherwise>
					<div class="article-banner">
						<div class="article-banner-title">
							<h3><xsl:value-of select="document-date-begin"/></h3>
							<h2><xsl:value-of select="document-title"/></h2>
						</div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</a>
		<!-- h2>
			<a href="{$site-path}?document_id={document-id}&#38;portlet_id={$portlet-id}" title="{document-title}" target="_top">
				<xsl:value-of select="document-title" />
			</a>
		</h2>
		<div class="portlet-actualites-content">
			<xsl:value-of disable-output-escaping="yes" select="document-summary" />
		</div -->
	</div>
</xsl:template>

<xsl:template match="file-resource">
    <xsl:choose>
		<xsl:when test="(resource-content-type='image/jpeg' or resource-content-type='image/jpg' or  resource-content-type='image/pjpeg' or resource-content-type='image/gif' or resource-content-type='image/png')">
			<div class="article-banner">
				<xsl:attribute name="style">background-image:url('document?id=<xsl:value-of select="resource-document-id" />&amp;id_attribute=<xsl:value-of select="resource-attribute-id" />')</xsl:attribute>
				<div class="article-banner-title">
					<h3><xsl:value-of select="../../document-date-begin"/></h3>
					<h2><xsl:value-of select="../../document-title"/></h2>
				</div>
			</div>
		</xsl:when>
		<xsl:otherwise>
			<div class="article-banner">
				<div class="article-banner-title">
					<h3><xsl:value-of select="../../document-date-begin"/></h3>
					<h2><xsl:value-of select="../../document-title"/></h2>
				</div>
			</div>
		</xsl:otherwise>
    </xsl:choose>
</xsl:template>

</xsl:stylesheet>