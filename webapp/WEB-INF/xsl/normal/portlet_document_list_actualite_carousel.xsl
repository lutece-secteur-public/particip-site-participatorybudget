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
    <div class="portlet-homepage-generic actu {$device_class}">
		<div class="portlet-content">
			<div id="carousel-actu" class="carousel slide" data-ride="carousel">
				<xsl:call-template name="indicators" />
				<xsl:apply-templates select="document-list-portlet" />
			</div>
		</div>
    </div>
</xsl:template>

<xsl:template name="indicators">
	<ol class="carousel-indicators">
		<xsl:for-each select="document-list-portlet/document">
			<xsl:choose>
				<xsl:when test="position() &gt; 1">
					<li data-target="#carousel-actu" data-slide-to="{position()-1}"></li>
				</xsl:when>
				<xsl:otherwise>
					<li data-target="#carousel-actu" data-slide-to="0" class="active"></li>
				</xsl:otherwise>
			</xsl:choose>	
		 </xsl:for-each>
	 </ol>
</xsl:template>

<xsl:template match="document-list-portlet">
	<!-- Wrapper for slides -->
	<div class="carousel-inner" role="listbox">
		<xsl:apply-templates select="document" />
	</div>
	<!-- Controls -->
	<a class="left carousel-control" href="#carousel-actu" role="button" data-slide="prev">
		<span class="fa fa-chevron-left" aria-hidden="true"></span>
		<span class="sr-only">Precedent</span>
	</a>
	<a class="right carousel-control" href="#carousel-actu" role="button" data-slide="next">
		<span class="fa fa-chevron-right" aria-hidden="true"></span>
		<span class="sr-only">Suivant</span>
	</a>	
</xsl:template>



<xsl:template match="document">
	<xsl:choose>
		<xsl:when test="position() &gt; 1">
			<div class="item">
				<xsl:apply-templates select="document-xml-content/actualite" />
			</div>
		</xsl:when>
		<xsl:otherwise>
			<div class="item active">
				<xsl:apply-templates select="document-xml-content/actualite" />
			</div>
		</xsl:otherwise>
	</xsl:choose>	
</xsl:template>

<xsl:template match="actualite">
	    <xsl:choose>
			<xsl:when test="actualite-imagemini/file-resource!=''">
				<xsl:apply-templates select="actualite-imagemini/file-resource" />
			</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
		<div class="carousel-caption">
			<h3>
				<xsl:choose>
				<xsl:when test="actualite-url_redirection!='http://'">
					<a href="{actualite-url_redirection}" title="{document-title}" target="_blank">
						<xsl:value-of select="document-title" />
					</a>
				</xsl:when>
				<xsl:otherwise>	
					<a href="{$site-path}?document_id={document-id}&#38;portlet_id={$portlet-id}" title="{document-title}" target="_top">
						<xsl:value-of select="document-title" />
					</a>
				</xsl:otherwise>
				</xsl:choose>
			</h3>
			
		</div>
</xsl:template>

<xsl:template match="file-resource">
    <xsl:choose>
	<xsl:when test="(resource-content-type='image/jpeg' or resource-content-type='image/jpg' or  resource-content-type='image/pjpeg' or resource-content-type='image/gif' or resource-content-type='image/png')">
        <img src="document?id={resource-document-id}&amp;id_attribute={resource-attribute-id}" class="img-responsive" />
	</xsl:when>
	<xsl:otherwise>
        <a href="document?id={resource-document-id}&amp;id_attribute={resource-attribute-id}">
			<img src="images/admin/skin/plugins/document/filetypes/file.png"  class="img-responsive" />
        </a>
	</xsl:otherwise>
    </xsl:choose>
</xsl:template>

</xsl:stylesheet>

