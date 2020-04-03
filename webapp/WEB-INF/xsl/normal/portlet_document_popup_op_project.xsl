<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:java="http://xml.apache.org/xslt/java" exclude-result-prefixes="java">

<xsl:param name="site-path" select="site-path" />
<xsl:variable name="portlet-id" select="portlet/portlet-id" />



<xsl:template match="portlet">

	<xsl:variable name="device_class">
		<xsl:choose>
			<xsl:when test="string(display-on-small-device)='0'">hidden-xs</xsl:when>
			<xsl:when test="string(display-on-normal-device)='0'">hidden-sm</xsl:when>
			<xsl:when test="string(display-on-large-device)='0'">hidden-md</xsl:when>
			<xsl:when test="string(display-on-xlarge-device)='0'">hidden-lg</xsl:when>
		<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	
	<div class="popup-proposal">
        <xsl:apply-templates select="document-portlet/document" />
	</div>
	
</xsl:template>



<xsl:template match="document">

	<!-- xsl:copy-of select="."/ -->

	<xsl:if test="not(string(document-xml-content)='null')">
	
		<!-- On calcule au préalable les variables nécessaires aux tests sur les dates. On calcule à partir de la dernière (au pire au 31/12/2099), et si une date est vide, on prend celle de l'étape suivante. -->
												
		<xsl:variable name="auj" select="number(java:format(java:java.text.SimpleDateFormat.new('yyyyMMdd'), java:java.util.Date.new()))" />
		
		<xsl:variable name="dtStep4f-txt"> <!-- Format String : 31/12/2099 -->
			<xsl:choose>
				<xsl:when test="document-xml-content/project_2015_op/project_2015_op-phase4_date_fin = ''"><xsl:value-of select="string('31/12/2099')" /></xsl:when>
				<xsl:otherwise><xsl:value-of select="string(document-xml-content/project_2015_op/project_2015_op-phase4_date_fin)" /></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="dtStep4f"    select="java:parse(java:java.text.SimpleDateFormat.new('dd/MM/yyyy'), $dtStep4f-txt ))" />    <!-- Format Date : Thu Dec 31 00:00:00 CET 2099 -->
		<xsl:variable name="date-step4f" select="number( java:format(java:java.text.SimpleDateFormat.new('yyyyMMdd'), $dtStep4f ))" /> <!-- Format Number : 20990131 -->
		
		<xsl:variable name="dtStep4-txt"> <!-- Format String : 31/12/2099 -->
			<xsl:choose>
				<xsl:when test="document-xml-content/project_2015_op/project_2015_op-phase4_date_deb = ''"><xsl:value-of select="string($dtStep4f-txt)" /></xsl:when>
				<xsl:otherwise><xsl:value-of select="string(document-xml-content/project_2015_op/project_2015_op-phase4_date_deb)" /></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="dtStep4"    select="java:parse(java:java.text.SimpleDateFormat.new('dd/MM/yyyy'), $dtStep4-txt ))" />    <!-- Format Date : Thu Dec 31 00:00:00 CET 2099 -->
		<xsl:variable name="date-step4" select="number( java:format(java:java.text.SimpleDateFormat.new('yyyyMMdd'), $dtStep4 ))" /> <!-- Format Number : 20990131 -->

		<xsl:variable name="dtStep3-txt"> <!-- Format String : 31/12/2099 -->
			<xsl:choose>
				<xsl:when test="document-xml-content/project_2015_op/project_2015_op-phase3_date_deb = ''"><xsl:value-of select="string($dtStep4-txt)" /></xsl:when>
				<xsl:otherwise><xsl:value-of select="string(document-xml-content/project_2015_op/project_2015_op-phase3_date_deb)" /></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="dtStep3"    select="java:parse(java:java.text.SimpleDateFormat.new('dd/MM/yyyy'), $dtStep3-txt ))" />    <!-- Format Date : Thu Dec 31 00:00:00 CET 2099 -->
		<xsl:variable name="date-step3" select="number( java:format(java:java.text.SimpleDateFormat.new('yyyyMMdd'), $dtStep3 ))" /> <!-- Format Number : 20990131 -->

		<xsl:variable name="dtStep2-txt"> <!-- Format String : 31/12/2099 -->
			<xsl:choose>
				<xsl:when test="document-xml-content/project_2015_op/project_2015_op-phase2_date_deb = ''"><xsl:value-of select="string($dtStep3-txt)" /></xsl:when>
				<xsl:otherwise><xsl:value-of select="string(document-xml-content/project_2015_op/project_2015_op-phase2_date_deb)" /></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="dtStep2"    select="java:parse(java:java.text.SimpleDateFormat.new('dd/MM/yyyy'), $dtStep2-txt ))" />    <!-- Format Date : Thu Dec 31 00:00:00 CET 2099 -->
		<xsl:variable name="date-step2" select="number( java:format(java:java.text.SimpleDateFormat.new('yyyyMMdd'), $dtStep2 ))" /> <!-- Format Number : 20990131 -->

		<xsl:variable name="dtStep1-txt"> <!-- Format String : 31/12/2099 -->
			<xsl:choose>
				<xsl:when test="document-xml-content/project_2015_op/project_2015_op-phase1_date_deb = ''"><xsl:value-of select="string($dtStep2-txt)" /></xsl:when>
				<xsl:otherwise><xsl:value-of select="string(document-xml-content/project_2015_op/project_2015_op-phase1_date_deb)" /></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="dtStep1"    select="java:parse(java:java.text.SimpleDateFormat.new('dd/MM/yyyy'), $dtStep1-txt ))" />    <!-- Format Date : Thu Dec 31 00:00:00 CET 2099 -->
		<xsl:variable name="date-step1" select="number( java:format(java:java.text.SimpleDateFormat.new('yyyyMMdd'), $dtStep1 ))" /> <!-- Format Number : 20990131 -->
	
	    <div class="popup-proposal-content">
	      
			<p style="display:none">OP #<xsl:value-of select="document-xml-content/project_2015_op/document-id"/></p>

			<div class="popup-title"><xsl:value-of select="document-xml-content/project_2015_op/document-title" /></div>
			
	        <div class="popup-localisation"><xsl:value-of select="document-xml-content/project_2015_op/project_2015_op-localisation_precise/geoloc/address" /></div>

	        <br/>
			
			<!-- Principe d'affichage des dates :
					Phase non démarrée : marquée 'unactive'
					Phase démarrée     : marquée   'active'                 + date de démarrage
					Phase Achevée      : marquée   'active' + icône 'check' + date de démarrage (sauf phase 4 : date de fin) -->
			
			<!-- <xsl:value-of select="project_2015-phase1_date_deb" /> -->
			<xsl:choose>
				<xsl:when test="($auj &gt; $date-step2)">
					<p class="date-step phase-active"><img src="images/local/skin/check.png" alt="Études terminées" title=""/>1. Études et conception</p>
				</xsl:when>
				<xsl:when test="($auj &lt; $date-step2) and ($auj &gt; $date-step1)">
					<p class="date-step phase-active"><img src="images/local/skin/check-current.png" alt="Études en cours" title=""/>1. Études et conception</p>
				</xsl:when>
				<xsl:when test="($auj &lt; $date-step1) and (project_2015-phase1_date_deb != '')">
					<p class="date-step phase-unactive"><img src="images/local/skin/check-empty.png" alt="Études à venir" title=""/>1. Études et conception</p>
				</xsl:when>
				<xsl:otherwise>
					<p>Projet en cours de démarrage.</p>
					<p class="date-step phase-unactive"><img src="images/local/skin/check-empty.png" alt="Études non démarrées" title=""/>1. Études et conception</p>
				</xsl:otherwise>
			</xsl:choose>
		
			<!-- <xsl:value-of select="project_2015-phase2_date_deb" /> -->
			<xsl:choose>
				<xsl:when test="($auj &gt; $date-step3)">
					<p class="date-step phase-active"><img src="images/local/skin/check.png" alt="Procédures terminées" title=""/>2. Lancement des procédures</p>
				</xsl:when>
				<xsl:when test="($auj &lt; $date-step3) and ($auj &gt; $date-step2)">
					<p class="date-step phase-active"><img src="images/local/skin/check-current.png" alt="Procédures en cours" title=""/>2. Lancement des procédures</p>
				</xsl:when>
				<xsl:when test="($auj &lt; $date-step2) and (project_2015-phase2_date_deb != '')">
					<p class="date-step phase-unactive"><img src="images/local/skin/check-empty.png" alt="Procédures à venir" title=""/>2. Lancement des procédures</p>
				</xsl:when>
				<xsl:otherwise>
					<p class="date-step phase-unactive"><img src="images/local/skin/check-empty.png" alt="Procédures non démarrées" title=""/>2. Lancement des procédures</p>
				</xsl:otherwise>
			</xsl:choose>
		
			<!-- <xsl:value-of select="project_2015-phase3_date_deb" /> -->
			<xsl:choose>
				<xsl:when test="($auj &gt; $date-step4)">
					<p class="date-step phase-active"><img src="images/local/skin/check.png" alt="Travaux terminés" title=""/>3. Réalisation des travaux</p>
				</xsl:when>
				<xsl:when test="($auj &lt; $date-step4) and ($auj &gt; $date-step3)">
					<p class="date-step phase-active"><img src="images/local/skin/check-current.png" alt="Travaux en cours" title=""/>3. Réalisation des travaux</p>
				</xsl:when>
				<xsl:when test="($auj &lt; $date-step3) and (project_2015-phase3_date_deb != '')">
					<p class="date-step phase-unactive"><img src="images/local/skin/check-empty.png" alt="Travaux à venir" title=""/>3. Réalisation des travaux</p>
				</xsl:when>
				<xsl:otherwise>
					<p class="date-step phase-unactive"><img src="images/local/skin/check-empty.png" alt="Travaux non démarrés" title=""/>3. Réalisation des travaux</p>
				</xsl:otherwise>
			</xsl:choose>
		
			<!-- <xsl:value-of select="project_2015-phase4_date_deb" /> -->
			<xsl:choose>
				<xsl:when test="($auj &gt; $date-step4f)">
					<p class="date-step phase-active"><img src="images/local/skin/check.png" alt="Réalisé !" title=""/>4. Livraison et inauguration</p>
				</xsl:when>
				<xsl:when test="($auj &lt; $date-step4f) and ($auj &gt; $date-step4)">
					<p class="date-step phase-active"><img src="images/local/skin/check-current.png" alt="Livraison en cours" title=""/>4. Livraison et inauguration</p>
				</xsl:when>
				<xsl:when test="($auj &lt; $date-step4) and (project_2015-phase4_date_deb != '')">
					<p class="date-step phase-unactive"><img src="images/local/skin/check-empty.png" alt="Livraison à venir" title=""/>4. Livraison et inauguration</p>
				</xsl:when>
				<xsl:otherwise>
					<p class="date-step phase-unactive"><img src="images/local/skin/check-empty.png" alt="Livraison non démarrée" title=""/>4. Livraison et inauguration</p>
				</xsl:otherwise>
			</xsl:choose>
			
			<!-- Lien vers la fiche du projet -->
			<xsl:choose>
				<xsl:when test="not(document-xml-content/project_2015_op/project_2015_op-document_suivi_synt_text = '')">
					<p>
						<a class="popup-link" target="_blank">
							<xsl:attribute name="href">./jsp/site/Portal.jsp?document_id=<xsl:value-of select="document-xml-content/project_2015_op/project_2015_op-document_suivi_synt_text"/>&amp;portlet_id=158</xsl:attribute>
							Voir le projet
						</a>
					</p>
				</xsl:when>
				<xsl:otherwise>
					<p style="display:none">no such projet for op #<xsl:value-of select="document-xml-content/project_2015_op/document-id"/></p>
				</xsl:otherwise>
			</xsl:choose>
	
	    </div>
	</xsl:if>
</xsl:template>

</xsl:stylesheet>
