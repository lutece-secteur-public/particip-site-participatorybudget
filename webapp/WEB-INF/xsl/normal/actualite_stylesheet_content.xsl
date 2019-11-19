<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="publication-date" select="publication-date" />
    <!--
   	How to display the publication date :
   	<xsl:value-of select="$publication-date" />
   	-->
    <xsl:output method="html" indent="yes"/>
	
    <xsl:template match="content">
        <xsl:apply-templates select="actualite"/>
    </xsl:template>
    
	<!-- Actualité à la une -->
	<xsl:template match="actualite">
				<!-- Titre et image -->
				<xsl:choose>

					<!-- Image du titre, avec titre en surimpression -->
					<xsl:when test="actualite-image/file-resource != ''">
						<xsl:apply-templates select="actualite-image/file-resource"/>
					</xsl:when>
					
					<xsl:otherwise>		
						<xsl:choose>
							<!-- Sinon image mini, avec titre en surimpression -->
							<xsl:when test="actualite-imagemini/file-resource != ''">
								<xsl:apply-templates select="actualite-imagemini/file-resource"/>
							</xsl:when>
							
							<xsl:otherwise>
								<!-- Sinon titre avec image générique / couleur de fond -->
								<div class="article-banner">
									<h1><xsl:value-of select="document-title" /></h1>
								</div>
							</xsl:otherwise>        
						</xsl:choose>        
					</xsl:otherwise>        
				</xsl:choose>
				
				<br/><br/>
				
				<!-- Contenu de l'actualité -->
				<div class="article-description">
					<xsl:value-of disable-output-escaping="yes" select="actualite-content" />
				</div>

				<!-- Visualisation du contenu XML source -->
				<!-- pre><xsl:copy-of select="."/></pre -->
    </xsl:template>

	
	<!-- Génération du tag HTML IMG à partir du numéro du document "image" -->
    <xsl:template match="file-resource">
	
		<!-- Version avec DIV et BACKGROUND-IMAGE --> 
		<xsl:choose>
			<xsl:when test="(resource-content-type='image/jpeg' or resource-content-type='image/jpg' or  resource-content-type='image/pjpeg' or resource-content-type='image/gif' or resource-content-type='image/png')" >
				<div class="article-banner">
					<div class="article-banner-title">
						<h1><xsl:value-of select="../../document-title"/></h1>
					</div>
					<div class="article-banner-img">
						<img>
							<xsl:attribute name="src">document?id=<xsl:value-of select="resource-document-id" />&amp;id_attribute=<xsl:value-of select="resource-attribute-id" /></xsl:attribute>
						</img>
					</div>
				</div>
			</xsl:when>
			<xsl:otherwise></xsl:otherwise>  
		</xsl:choose>
		
		<!-- Version avec tag IMG -->
		<!-- xsl:choose>
            <xsl:when test="(resource-content-type='image/jpeg' or resource-content-type='image/jpg' or  resource-content-type='image/pjpeg' or resource-content-type='image/gif' or resource-content-type='image/png')" >
                <img class="img-responsive" src="document?id={resource-document-id}&amp;id_attribute={resource-attribute-id}" alt="{../document-title}" title="{../document-title}" width="100%" />
            </xsl:when>
            <xsl:otherwise></xsl:otherwise>        
        </xsl:choose -->
    </xsl:template>
	
</xsl:stylesheet>