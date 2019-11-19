<?xml version="1.0"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:param name="publication-date" select="publication-date" />
    <!--
   	How to display the publication date :
   	<xsl:value-of select="$publication-date" />
   	-->
    <xsl:output method="html" indent="yes"/>
	
    <xsl:template match="content">
        <xsl:apply-templates select="project_2015"/>
    </xsl:template>
    
    <xsl:template match="project_2015">
			<div class="row" id="project_2015_pdf">

				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<h2 class="project-data-title">PROJET N°<xsl:value-of select="project_2015-code_projet" /></h2>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<div class="project-description">
						<h1 class="project2015_title"><xsl:value-of select="document-title" /></h1>
						<xsl:choose>
						<xsl:when test="project_2015-image!=''">
						<div class="project_image">
							<xsl:value-of disable-output-escaping="yes" select="project_2015-image" />
						</div>
						</xsl:when>
						</xsl:choose>

						<div class="project-data">
							<table>
								<xsl:if test="not(string(project_2015-thematique)='')">
									<tr>
										<td><img src="images/local/skin/projet_theme.png" alt="Thématique" title="Thématique" /></td>
										<td><p><xsl:value-of select="project_2015-thematique" /></p></td>
									</tr>
								</xsl:if>
								<xsl:if test="not(string(project_2015-localisation)='')">
									<tr>
										<td><img src="images/local/skin/projet_localisation.png" alt="Localisation" title="Localisation" /></td>
										<td><p><xsl:if test="not(string(project_2015-lieu)='')"><xsl:value-of select="project_2015-lieu" /><br /></xsl:if>
										<xsl:value-of select="project_2015-localisation" /></p></td>
									</tr>
								</xsl:if>
								<xsl:if test="not(string(project_2015-budget)='')">
								<tr>
									<td><img src="images/local/skin/projet_cout.png" alt="Coût" title="Coût" /></td>
									<td>
									<xsl:variable name="budget" select="project_2015-budget"></xsl:variable>
									<xsl:decimal-format name="space" grouping-separator=" " />
									<xsl:value-of select='format-number($budget, "# ###", "space")' /> €</td>
								</tr>
								</xsl:if>
							</table>
						</div>
						<div class="project-data">
							<p>Origine du projet : <xsl:value-of disable-output-escaping="yes" select="project_2015-contributeur" /></p>
						</div>
						<h2 class="project-data-title">DESCRIPTION DU PROJET</h2>
						<xsl:value-of disable-output-escaping="yes" select="project_2015-description" />
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