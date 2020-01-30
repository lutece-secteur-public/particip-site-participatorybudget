<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:param name="site-path" select="site-path" />
<xsl:variable name="portlet-id" select="portlet/portlet-id" />
    
<xsl:template match="portlet">
    <xsl:variable name="device_class">
        <xsl:choose>
            <xsl:when test="string(display-on-small-device)='0'">hidden-phone</xsl:when>
            <xsl:when test="string(display-on-normal-device)='0'">hidden-tablet</xsl:when>
            <xsl:when test="string(display-on-large-device)='0'">hidden-desktop</xsl:when>
            <xsl:otherwise></xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <div class="portlet-actualites {$device_class}">
        <xsl:if test="not(string(display-portlet-title)='1')">
           <h3><xsl:value-of disable-output-escapding="yes" select="portlet-name" /></h3>
        </xsl:if>
		<xsl:apply-templates select="document-list-portlet" />
    </div>
</xsl:template>


<xsl:template match="document-list-portlet">
    <xsl:apply-templates select="document" />
</xsl:template>


<xsl:template match="document">
	<div class="col-xs-12 col-sm-12 col-md-12">
        <xsl:apply-templates select="document-xml-content/actualite" />
	</div>
</xsl:template>


<xsl:template match="actualite">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12">
            <xsl:choose>
		<xsl:when test="actualite-image/file-resource!=''">
             <xsl:apply-templates select="actualite-image/file-resource" />
		</xsl:when>
		<xsl:otherwise></xsl:otherwise>
        </xsl:choose>
		</div>
    </div>
    <div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12">
            <h4>
				<a href="{$site-path}?document_id={document-id}&#38;portlet_id={$portlet-id}" title="{document-title}" target="_top">
					<xsl:value-of select="document-title" />
				</a>
			</h4>
            <p class="portlet-actualites-content">
				<xsl:value-of disable-output-escaping="yes" select="document-summary" />
            </p>
	</div>
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

