<?xml version="1.0"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:param name="publication-date" select="publication-date" />
    <!--
   	How to display the publication date :
   	<xsl:value-of select="$publication-date" />
   	-->
    <xsl:output method="html" indent="yes"/>
	
    <xsl:template match="content">
        <xsl:apply-templates select="project"/>
    </xsl:template>
    
    <xsl:template match="project">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12">
					<h1 class="project-title"><xsl:value-of select="document-title" /></h1>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12">
				<xsl:choose>
					<xsl:when test="string(project-carousel)=''" >
						<xsl:apply-templates select="project-image/file-resource" />
					</xsl:when>
					<xsl:otherwise>
						<div class="carousel">
							<xsl:value-of disable-output-escaping="yes" select="project-carousel" />
						</div>
					</xsl:otherwise>        
				</xsl:choose>
				</div>
			</div>
			<div class="row">	
				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					<h2 class="project-data-title">FICHE TECHNIQUE</h2>
					<div class="project-data">
						<table>
							<xsl:if test="not(string(project-cost)='')">
							<tr>
								<td><img src="images/local/skin/projet_cout.png" /></td>
								<td><xsl:value-of select="project-cost" /></td>
							</tr>
							</xsl:if>
							<xsl:if test="not(string(project-date)='')">
							<tr>
								<td><img src="images/local/skin/projet_date_livraison.png" /></td>
								<td><xsl:value-of select="project-date" /></td>
							</tr>
							</xsl:if>
							<xsl:if test="not(string(project-location)='')">
								<tr>
									<td><img src="images/local/skin/projet_location.png" /></td>
									<td><p>Location :</p>
									<xsl:value-of select="project-location" />
									</td>
								</tr>
							</xsl:if>
						</table>
					</div>
					<h2 class="project-data-title">CHIFFRES CLES</h2>
					<div class="project-data">
						<p><xsl:value-of disable-output-escaping="yes" select="project-keydata" /></p>
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
					
					<div class="project-description">
						<!-- VOTE DESACTIVE -->
						<xsl:text disable-output-escaping="yes">@Extender[</xsl:text>
						<xsl:value-of disable-output-escaping="yes" select="document-id" /><xsl:text disable-output-escaping="yes">,document,vote,{show:"all"}]@</xsl:text> 
						<!-- -->
						<xsl:value-of disable-output-escaping="yes" select="project-content" />
					</div>
				</div>
			</div>
    </xsl:template>

 
   <xsl:template match="file-resource">
        <xsl:choose>
            <xsl:when test="(resource-content-type='image/jpeg' or resource-content-type='image/jpg' or  resource-content-type='image/pjpeg' or resource-content-type='image/gif' or resource-content-type='image/png')" >
                <img src="document?id={resource-document-id}&amp;id_attribute={resource-attribute-id}"  alt="" title="" class="img-responsive" />
            </xsl:when>
            <xsl:otherwise></xsl:otherwise>        
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>