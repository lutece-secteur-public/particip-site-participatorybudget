<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:param name="site-path" select="site-path" />
<xsl:variable name="portlet-id" select="portlet/portlet-id" />
    
<xsl:template match="portlet">

	<xsl:variable name="device_class">
	<xsl:choose>
		<xsl:when test="string(display-on-small-device)='0'">hide-for-small</xsl:when>
		<xsl:otherwise></xsl:otherwise>
	</xsl:choose>
	</xsl:variable>
    <div class="portlet portlet-project-list content-centered {$device_class}">
            <div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
        <xsl:if test="not(string(display-portlet-title)='1')">
					<span class="title1">
						<xsl:value-of disable-output-escaping="yes" select="portlet-name" />
					</span>
        </xsl:if>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 sort">
					Trier par : 
					<a href="" title="" id="sort-alpha" class="sortable-link active">Ordre Alphab&#233;tique</a> 
					<!-- VOTE DESACTIVE -->
					<a href="" title="" id="sort-pop" class="sortable-link">Popularit&#233;</a>
				</div>
			</div>
        <xsl:apply-templates select="document-list-portlet" />
    </div>
</xsl:template>


<xsl:template match="document-list-portlet">
	<div class="row project-list-margin-top">
		<xsl:apply-templates select="document" />
    </div>
</xsl:template>


<xsl:template match="document">
	<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 budget-document">
		<xsl:apply-templates select="document-xml-content/project" />
	</div>
</xsl:template>


<xsl:template match="document-xml-content/project">
	<div class="budget-document-content">
		<div class="sub-title">
			<a href="{$site-path}?document_id={document-id}&#38;portlet_id={$portlet-id}" target="_top">
				<xsl:value-of select="document-title" />
			</a>
		</div>
		
		<table class="table budget-table-info-projet">
			<tr>
				<td class="centered">
					<xsl:value-of select="project-cost_value" /> M€
				</td>
				<td class="budget-td-info-projet centered">
					<a class="budget-lien-fiche-projet" href="jsp/site/Portal.jsp?document_id={document-id}&#38;portlet_id=92">Fiche du projet</a>
				</td>
				<!-- VOTE DESACTIVE -->
			
				<td class="budget-td-info-projet centered">
					<span id="vote-amount-{document-id}" class="vote-amount">
						<xsl:value-of select="sum(../../document-number-rating | project-vote_offline)" />
					</span>  votes
				</td>
			</tr>
		</table>
		<div class="project_image_div">
			<a href="{$site-path}?document_id={document-id}&#38;portlet_id={$portlet-id}" target="_top">
				<xsl:choose>
					<xsl:when test="project-image/file-resource!=''">
						<xsl:apply-templates select="project-image/file-resource" />
					</xsl:when>
					<xsl:otherwise></xsl:otherwise>
				</xsl:choose>
			</a>
		</div>
		<!-- VOTE DESACTIVE 
		<xsl:text disable-output-escaping="yes">@Extender[</xsl:text>
		<xsl:value-of disable-output-escaping="yes" select="document-id" /><xsl:text disable-output-escaping="yes">,document,vote,{show:"all"}]@</xsl:text> 
		-->	
		<div class="vote">
			<xsl:choose>
				<xsl:when test="project-winner='Oui'">
					<div class="bg-gagnant">
						<i class="glyphicon glyphicon-ok-circle">&#160;</i>Projet gagnant
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div class="bg-perdant">
						<i class="glyphicon glyphicon-remove-circle">&#160;</i>Projet perdant
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</div>
</xsl:template>

<xsl:template match="file-resource">
	<xsl:choose>
		<xsl:when test="(resource-content-type='image/jpeg' or resource-content-type='image/jpg' or  resource-content-type='image/pjpeg' or resource-content-type='image/gif' or resource-content-type='image/png')">
			<img src="document?id={resource-document-id}&amp;id_attribute={resource-attribute-id}" class="img-responsive" title="{../../document-title}" alt="{../../document-title}" />
		</xsl:when>
		<xsl:otherwise>
			<a href="document?id={resource-document-id}&amp;id_attribute={resource-attribute-id}">
				<img src="images/admin/skin/plugins/document/filetypes/file.png" border="0" class="img-responsive" />
			</a>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

</xsl:stylesheet>

