<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:param name="site-path" select="site-path" />

	<xsl:variable name="portlet-id" select="portlet/portlet-id" />

	<!-- *********************************************************************************** -->
	<!-- * TITLE TITLE TITLE TITLE TITLE TITLE TITLE TITLE TITLE TITLE TITLE TITLE TITLE T * -->
	<!-- * TITLE TITLE TITLE TITLE TITLE TITLE TITLE TITLE TITLE TITLE TITLE TITLE TITLE T * -->
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

		<xsl:apply-templates select="document-portlet" />

	</xsl:template>

	<!-- *********************************************************************************** -->
	<!-- * CHAPTER CHAPTER CHAPTER CHAPTER CHAPTER CHAPTER CHAPTER CHAPTER CHAPTER CHAPTER * -->
	<!-- * CHAPTER CHAPTER CHAPTER CHAPTER CHAPTER CHAPTER CHAPTER CHAPTER CHAPTER CHAPTER * -->
	<!-- *********************************************************************************** -->

	<xsl:template match="document-portlet">
		<xsl:apply-templates select="document/document-xml-content/ladem_chapter" />
	</xsl:template>


	<xsl:template match="ladem_chapter">
	
		<div class="ladem-chp-content"><xsl:value-of disable-output-escaping='yes' select="ladem_chapter-content"/></div>

	</xsl:template>

</xsl:stylesheet>

