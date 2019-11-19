<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:param name="site-path" select="site-path" />

	<xsl:variable name="portlet-id" select="portlet/portlet-id" />

	<!-- *********************************************************************************** -->
	<!-- * SOMMAIRE SOMMAIRE SOMMAIRE SOMMAIRE SOMMAIRE SOMMAIRE SOMMAIRE SOMMAIRE SOMMAIR * -->
	<!-- * SOMMAIRE SOMMAIRE SOMMAIRE SOMMAIRE SOMMAIRE SOMMAIRE SOMMAIRE SOMMAIRE SOMMAIR * -->
	<!-- *********************************************************************************** -->
		
	<xsl:template match="portlet">

		<xsl:variable name="device_class">
			<xsl:choose>
				<xsl:when test="string(display-on-small-device)='0'">hidden-phone</xsl:when>
				<xsl:when test="string(display-on-normal-device)='0'">hidden-tablet</xsl:when>
				<xsl:when test="string(display-on-large-device)='0'">hidden-desktop</xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<div id="portlet-ladem-som" class="container-fluid {$device_class}">
			<div class="row">
			
				<div id="search-form">
					<h1>La démarche</h1>
					<h2>Le mode d'emploi du Budget Participatif</h2>
				</div>
				
				<div class="container">
					<xsl:apply-templates select="document-list-portlet" />
				</div>
				
			</div>
		</div>
	</xsl:template>

	<!-- *********************************************************************************** -->
	<!-- * CHAPTER CHAPTER CHAPTER CHAPTER CHAPTER CHAPTER CHAPTER CHAPTER CHAPTER CHAPTER * -->
	<!-- * CHAPTER CHAPTER CHAPTER CHAPTER CHAPTER CHAPTER CHAPTER CHAPTER CHAPTER CHAPTER * -->
	<!-- *********************************************************************************** -->

	<xsl:template match="document-list-portlet">
		<xsl:apply-templates select="document/document-xml-content/ladem_chapter" />
	</xsl:template>


	<xsl:template match="ladem_chapter">
	
		<div class="ladem-chapter-line row row-eq-height">

			<div class="ladem-chapter-col1 col-xs-12 col-sm-12 col-md-1 col-md-offset-2">
				<div class="ladem-chapter-num">
					<xsl:value-of select="position()"/>
				</div>
			</div>
			
			<div class="ladem-chapter-col2 col-xs-12 col-sm-12 col-md-7">
				<div class="ladem-chapter-period"><xsl:value-of select="ladem_chapter-period"/></div>
				<div class="ladem-chapter-title"><xsl:value-of select="document-title"/></div>
				<div class="ladem-chapter-content"><xsl:value-of select="document-summary"/></div>
				<a class="ladem-chapter-btn btn btn-14rem btn-black-on-white">
					<xsl:attribute name="href">jsp/site/Portal.jsp?page_id=<xsl:value-of select="ladem_chapter-page_id"/></xsl:attribute>
					En savoir plus
				</a>
			</div>
		
		</div>

	</xsl:template>

</xsl:stylesheet>

