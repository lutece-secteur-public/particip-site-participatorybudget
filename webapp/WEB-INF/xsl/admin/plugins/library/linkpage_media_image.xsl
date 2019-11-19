<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="false" omit-xml-declaration="yes" />

	<xsl:template match="media">
			<img src="{src}" class="{class}" alt="{alt}" title="{alt}" height="{height}" width="{width}"/>
	</xsl:template>

</xsl:stylesheet>