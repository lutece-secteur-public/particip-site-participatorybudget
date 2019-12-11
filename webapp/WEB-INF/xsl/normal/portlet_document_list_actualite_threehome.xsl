<?xml version="1.0"?>

<!-- Structure XML en entrée

	<portlet>
		<portlet-name>ThreeHome Actualités</portlet-name>
		<portlet-id>165</portlet-id>
		<page-id>1</page-id>
		<plugin-name>document</plugin-name>
		<display-portlet-title>1</display-portlet-title>
		<display-on-small-device>1</display-on-small-device>
		<display-on-normal-device>1</display-on-normal-device>
		<display-on-large-device>1</display-on-large-device>
		<display-on-xlarge-device>1</display-on-xlarge-device>

		<document-list-portlet>
			<document>
				<document-id>2267</document-id>
				<document-date-publication>09/06/2017</document-date-publication>
				<document-xml-content>
					<news_topic>
						<document-id>2267</document-id>
						<document-title>Un tirage au sort pour la réalisation d'une fresque street art par arrondissement </document-title>
						<document-summary>Lors du vote du Budget participatif 2014, les Parisiens ont retenu...</document-summary>
						<document-date-begin>11/02/2016</document-date-begin>
						<document-date-end>
							<document-categories>
								<news_topic-content>&lt;p&gt;&lt;img src="document?id=2264&amp;amp;id_attri...</news_topic-content>
								<news_topic-imagemini>
									<file-resource>
										<resource-document-id>2267</resource-document-id>
										<resource-attribute-id>107</resource-attribute-id>
										<resource-content-type>image/jpeg</resource-content-type>
									</file-resource>
									<file-size>82103</file-size>
								</news_topic-imagemini>
								<news_topic-image>
									<file-resource>
										<resource-document-id>2267</resource-document-id>
										<resource-attribute-id>47</resource-attribute-id>
										<resource-content-type>image/jpeg</resource-content-type>
									</file-resource>
									<file-size>163798</file-size>
								</news_topic-image>
								<news_topic-video>
									<news_topic-url_redirection>http://www.paris.fr/talentsparis2024</news_topic-url_redirection>
								</news_topic-video>
							</document-categories>
						</document-date-end>
					</news_topic>
				</document-xml-content>
				<document-number-comment>0</document-number-comment>
			</document>
			<document>
				...
			</document>
		</document-list-portlet>
	</portlet>

-->

<xsl:stylesheet version="1.0" exclude-result-prefixes="xalan str" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xalan="http://xml.apache.org/xalan" xmlns:str="xalan://java.lang.String" >
        
<xsl:param name="site-path" select="site-path" />
<xsl:variable name="portlet-id" select="portlet/portlet-id" />
    
<!-- *********************************************************************************** -->
<!-- * ROOT   ROOT   ROOT   ROOT   ROOT   ROOT   ROOT   ROOT   ROOT   ROOT   ROOT   RO * -->
<!-- * ROOT   ROOT   ROOT   ROOT   ROOT   ROOT   ROOT   ROOT   ROOT   ROOT   ROOT   RO * -->
<!-- *********************************************************************************** -->

<xsl:template match="portlet">

	<!-- Affichage du XML source : <pre><xsl:copy-of select="."/></pre> -->

	<!-- Prise en compte des options d'affichage -->
    <xsl:variable name="device_class">
        <xsl:choose>
            <xsl:when test="string(display-on-small-device)='0'">hidden-xs</xsl:when>
            <xsl:when test="string(display-on-normal-device)='0'">hidden-sm</xsl:when>
            <xsl:when test="string(display-on-large-device)='0'">hidden-md</xsl:when>
            <xsl:otherwise></xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
	
	<!-- Affichage du threehome -->
    <div id="threehome-actu" class="row {$device_class}">
		<xsl:apply-templates select="document-list-portlet" />
    </div>
</xsl:template>


<!-- Affichage des trois premières actus -->
<xsl:template match="document-list-portlet">
	<xsl:apply-templates select="document[position() &lt; 4]" />
</xsl:template>

<!-- Row d'une actualité -->
<xsl:template match="document">
	<div class="col-md-4">
		<xsl:apply-templates select="document-xml-content/news_topic" />
	</div>
</xsl:template>

<!-- Affichage d'une actualité -->
<xsl:template match="news_topic">
    <div id="actu-{document-id}" class="actualite">

		<!-- a href="{$site-path}?document_id={document-id}&#38;portlet_id={$portlet-id}" title="{document-title}" target="_top" -->
		<a title="{document-title}" target="_top">

			<xsl:choose>
				<xsl:when test="news_topic-url_redirection != '' and news_topic-url_redirection != 'http://' and news_topic-url_redirection != 'https://'">
					<xsl:attribute name="href"><xsl:value-of select="news_topic-url_redirection"/></xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="href"><xsl:value-of select="$site-path"/>?document_id=<xsl:value-of select="document-id"/>&#38;portlet_id=<xsl:value-of select="$portlet-id"/></xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			
			<div class="article-banner">
				<div class="article-banner-img">
					<xsl:choose>
						<xsl:when test="news_topic-imagemini/file-resource != ''">
							 <xsl:apply-templates select="news_topic-imagemini/file-resource" />
						</xsl:when>
					</xsl:choose>
				</div>
				<div class="article-banner-title"><xsl:value-of select="document-title"/></div>
				<xsl:choose>
					<xsl:when test="news_topic-url_redirection != '' and news_topic-url_redirection != 'http://' and news_topic-url_redirection != 'https://'">
						<div class="article-banner-from"><span>sur <xsl:value-of select="str:replaceAll(str:new(substring-before(substring-after(news_topic-url_redirection, '://'), '/')), 'www.', '')"/></span></div>
					</xsl:when>
					<xsl:otherwise>
						<div class="article-banner-from"><span>sur budgetparticipatif.paris</span></div>
					</xsl:otherwise>
				</xsl:choose>
			</div>
		</a>
		
	</div>
</xsl:template>

<xsl:template match="file-resource">
    <xsl:choose>
		<xsl:when test="(resource-content-type='image/jpeg' or resource-content-type='image/jpg' or resource-content-type='image/pjpeg' or resource-content-type='image/gif' or resource-content-type='image/png')">
			<img>
				<xsl:attribute name="src">document?id=<xsl:value-of select="resource-document-id" />&amp;id_attribute=<xsl:value-of select="resource-attribute-id" /></xsl:attribute>
			</img>
		</xsl:when>
    </xsl:choose>
</xsl:template>

</xsl:stylesheet>

