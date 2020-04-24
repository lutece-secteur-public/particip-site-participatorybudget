<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:math="http://exslt.org/math"  xmlns:func="http://exslt.org/functions" xmlns:bxf="http://bitflux.org/functions"  extension-element-prefixes="math" >


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
    <div class="portlet bg-bleu-clair {$device_class}">
		<div class="content-padding ">
			<xsl:if test="not(string(display-portlet-title)='1')">
				<h3>
					<xsl:value-of disable-output-escaping="yes" select="portlet-name" />
				</h3>
			</xsl:if>
			
			<!--<xsl:apply-templates select="document-list-portlet" />-->
			<xsl:call-template name="random-project" >
				<xsl:with-param name="size-list" select="count(document-list-portlet/document)"/>
			</xsl:call-template>
		</div>
    </div>
</xsl:template>

<xsl:template match="document-list-portlet">
    <xsl:param name="first-node-param" />
    <xsl:param name="second-node-param"/>
	<xsl:param name="third-node-param"/>
	
	<div class="row notre-budget-hashtag">
		<!-- Modif VOTE URL  -->
		<div class="col-xs-12 col-sm-7 col-md-8"><a href="les-projets.html" title="{document-title}"><span class="title1">Les projets 2014</span></a></div>
		<div class="col-xs-12 col-sm-5 col-md-4 title2"><a href="les-projets.html" alt="Voir tous les projets" title="Voir tous les projets">Tous les projets</a></div>
	</div>
	<div class="row notre-budget-content">
	<xsl:apply-templates select="document" >
		<xsl:with-param name="first-node-param" select="$first-node-param"/>
		<xsl:with-param name="second-node-param" select="$second-node-param"/>
		<xsl:with-param name="third-node-param" select="$third-node-param"/>
	</xsl:apply-templates>						
	</div>
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12" >
			<a id="project-list-btn" class="btn btn-block title2" href="les-projets.html" alt="Voir tous les projets" title="Voir tous les projets">
				Voir tous les projets
			</a>
		</div>
	</div>
</xsl:template>


<xsl:template match="document">
    <xsl:param name="first-node-param" />
    <xsl:param name="second-node-param"/>
	<xsl:param name="third-node-param"/>
	
	
   <xsl:variable name="index">
		<xsl:number level="single" value="position()" />
	</xsl:variable>
	<xsl:if test="$index=$first-node-param or $index=$second-node-param or $index=$third-node-param">
		<div class="col-xs-6 col-sm-6 col-md-4 budget-document">
			<xsl:apply-templates select="document-xml-content/project" />
		</div>
	</xsl:if>	
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
		
		<a href="{$site-path}?document_id={document-id}&#38;portlet_id={$portlet-id}" target="_top">
			<xsl:choose>
				<xsl:when test="project-image/file-resource!=''">
					<xsl:apply-templates select="project-image/file-resource" />
				</xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</a>
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

<xsl:template name="random-project">
	<xsl:param name="size-list" value=""/>
	<xsl:variable name="first-node" select="(floor(math:random()*1000) mod $size-list)+1" />
	<xsl:variable name="second-node" select="(floor(math:random()*1000) mod $size-list)+1" />
	<xsl:variable name="third-node" select="(floor(math:random()*1000) mod $size-list)+1" />
	<xsl:choose>
		<xsl:when test="$first-node=$second-node or $first-node=$third-node or $second-node=$third-node">
			 <xsl:call-template name="random-project" >
				<xsl:with-param name="size-list" 
                            select="$size-list"/>
			 </xsl:call-template>
		</xsl:when>
         <xsl:otherwise>
				<xsl:apply-templates select="document-list-portlet" >
					<xsl:with-param name="first-node-param" 
                            select="$first-node"/>
					<xsl:with-param name="second-node-param" 
                            select="$second-node"/>
					<xsl:with-param name="third-node-param" 
                            select="$third-node"/>
				</xsl:apply-templates>
		</xsl:otherwise>
        </xsl:choose>

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

