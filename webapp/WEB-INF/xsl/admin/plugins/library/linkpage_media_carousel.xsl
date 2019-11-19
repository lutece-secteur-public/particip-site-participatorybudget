<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="false" omit-xml-declaration="yes" />
	
	<xsl:template match="mediaList">
		<div id="myCarousel" class="carousel slide" data-ride="carousel" >
			<div class="carousel-inner">
				<xsl:apply-templates select="media" />
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</xsl:template>

	<xsl:template match="media">
		<xsl:choose>
			<xsl:when test="position() = 1">
				<div class="active item">
				<img src="{src}" alt="{alt}" height="{height}" width="{width}"/>
					<div class="carousel-caption">
						<p>
							<xsl:value-of select='alt'/>
						</p>
					</div>
				</div>
			</xsl:when>
			<xsl:otherwise>
				<div class="item">
					<img src="{src}" class="{class}" alt="{alt}" title="{alt}" height="{height}" width="{width}"/>
					<div class="carousel-caption">
						<p>
							<xsl:value-of select='alt'/>
						</p>
					</div>
				</div>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>