<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:param name="site-path" select="site-path" />

	<xsl:variable name="portlet-id" select="portlet/portlet-id" />

	<!-- *********************************************************************************** -->
	<!-- * HEADER HEADER HEADER HEADER HEADER HEADER HEADER HEADER HEADER HEADER HEADER HE * -->
	<!-- * HEADER HEADER HEADER HEADER HEADER HEADER HEADER HEADER HEADER HEADER HEADER HE * -->
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

		<!-- Displaying portlet only if documents available -->
		<xsl:if test="document-list-portlet/*">
		
			<div id="portlet-dl" class="container {$device_class}">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-1 col-md-offset-2">
						&#160;
					</div>
					<div class="col-xs-12 col-sm-12 col-md-7">
						<div class="dl-title">Documents à télécharger</div>
						<xsl:apply-templates select="document-list-portlet" />
					</div>
				</div>
			</div>
				
		</xsl:if>
		
	</xsl:template>

	<!-- *********************************************************************************** -->
	<!-- * FILE FILE FILE FILE FILE FILE FILE FILE FILE FILE FILE FILE FILE FILE FILE FILE * -->
	<!-- * FILE FILE FILE FILE FILE FILE FILE FILE FILE FILE FILE FILE FILE FILE FILE FILE * -->
	<!-- *********************************************************************************** -->

	<xsl:template match="document-list-portlet">
		<xsl:apply-templates select="document/document-xml-content/download_file" />
	</xsl:template>


	<xsl:template match="download_file">

		<div class="dl-file">
			<div class="dl-file-title">
				<xsl:choose>
					<!-- URL takes priority... -->
					<xsl:when test="string-length(download_file-url) > 7">
						<a>
							<xsl:attribute name="href"><xsl:value-of select="download_file-url"/></xsl:attribute>
							<xsl:value-of select="document-title"/>
						</a>
					</xsl:when>
					
					<!-- ...over file. -->
					<xsl:otherwise>
						<a>
							<xsl:attribute name="href">document?id=<xsl:value-of select="download_file-file/file-resource/resource-document-id"/>&amp;id_attribute=<xsl:value-of select="download_file-file/file-resource/resource-attribute-id"/></xsl:attribute>
							<xsl:value-of select="document-title"/>
						</a>
						<xsl:choose>
							<xsl:when test="download_file-file/file-resource/resource-content-type = 'application/msword'"> (Microsoft Word)</xsl:when>
							<xsl:when test="download_file-file/file-resource/resource-content-type = 'application/vnd.ms-excel'"> (Microsoft Excel)</xsl:when>
							<xsl:when test="download_file-file/file-resource/resource-content-type = 'application/pdf'"> (PDF)</xsl:when>
							<xsl:when test="download_file-file/file-resource/resource-content-type = 'application/vnd.oasis.opendocument.text'"> (OpenDocument ODF</xsl:when>
							<xsl:when test="download_file-file/file-resource/resource-content-type = 'application/vnd.openxmlformats-officedocument.presentationml.presentation'"> (Microsoft PowerPoint OpenXML)</xsl:when>
							<xsl:when test="download_file-file/file-resource/resource-content-type = 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'"> (Microsoft Word OpenXML)</xsl:when>
							<xsl:when test="download_file-file/file-resource/resource-content-type = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'"> (Microsoft Excel OpenXML)</xsl:when>
							<xsl:when test="download_file-file/file-resource/resource-content-type = 'application/xml'"> (XML)</xsl:when>
							<xsl:when test="download_file-file/file-resource/resource-content-type = 'image/jpeg'"> (JPEG)</xsl:when>
							<xsl:when test="download_file-file/file-resource/resource-content-type = 'image/png'"> (PNG)</xsl:when>
							<xsl:otherwise> </xsl:otherwise>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</div>
		</div>
		
	</xsl:template>

</xsl:stylesheet>

