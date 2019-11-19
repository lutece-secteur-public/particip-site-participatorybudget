<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:java="http://xml.apache.org/xslt/java" exclude-result-prefixes="java">

	<xsl:param name="site-path" select="site-path" />

	<xsl:variable name="portlet-id" select="portlet/portlet-id" />

	<!-- 
	<portlet>
		<portlet-name>Les realisations a la une</portlet-name>
		<portlet-id>195</portlet-id>
		<page-id>7</page-id>
		<plugin-name>document</plugin-name>
		<display-portlet-title>0</display-portlet-title>
		<display-on-small-device>1</display-on-small-device>
		<display-on-normal-device>1</display-on-normal-device>
		<display-on-large-device>1</display-on-large-device>
		<display-on-xlarge-device>1</display-on-xlarge-device>
		<document-list-portlet>
			<document>
				<document-id>1636</document-id>
				<document-date-publication>06/07/2018</document-date-publication>
				<document-xml-content>
					<project_2015>
						<document-id>1636</document-id>
						<document-title>Sécuriser les traversées piétonnes avenue Simon Bolivar</document-title>
						<document-summary>Le projet consiste à limiter la vitesse sur l'avenue Simon Bolivar à 30 km/h et à installer des ralentisseurs type coussins berlinois, afin de réduire la pollution sonore et d'assurer un meilleur partage de l'espace public entre tous les usagers.</document-summary>
						<document-date-begin/>
						<document-date-end/>
						<document-categories/>
						<project_2015-code_projet>22</project_2015-code_projet>
						<project_2015-identifiant>2871</project_2015-identifiant>
						<project_2015-thematique>Transport et mobilité</project_2015-thematique>
						<project_2015-description>&lt;p&gt;Le projet consiste &amp;agrave; limiter la vitesse sur l'avenue Simon Bolivar &amp;agrave; 30 km/h et &amp;agrave; installer des ralentisseurs type coussins berlinois, afin de r&amp;eacute;duire la pollution sonore et d'assurer un meilleur partage de l'espace public entre tous les usagers.&lt;/p&gt;</project_2015-description>
						<project_2015-localisation>19e arrondissement</project_2015-localisation>
						<project_2015-lieu>Avenue Simon Bolivar</project_2015-lieu>
						<project_2015-url>https://idee.paris.fr/amenagement-de-lavenue-simon-bolivar</project_2015-url>
						<project_2015-budget>200000</project_2015-budget>
						<project_2015-contributeur>Projet élaboré à partir des propositions de deux Parisiens.</project_2015-contributeur>
						<project_2015-direction>DVD</project_2015-direction>
						<project_2015-image>&lt;img src="document?id=1329&amp;id_attribute=43" class="img-responsive" alt="Thématique : Transport et mobilité" title="Thématique : Transport et mobilité" height="100%" width="100%"/&gt;</project_2015-image>
						<project_2015-nombre_de_votes>791</project_2015-nombre_de_votes>
						<project_2015-statut_project>SUIVI</project_2015-statut_project>
						<project_2015-content>&lt;p style="margin: 0cm 0cm 10pt;"&gt;&lt;font face="Calibri" size="3"&gt;L’avenue Simon Bolivar au niveau du 36 ayant déjà été aménagée pour plus de sécurité, la sécurisation de l’avenue a consisté&amp;nbsp;en la mise en place d’îlots au niveau de la rue Sadi Lecointe et de la rue Lauzi, complétée par la création d’un plateau surélevé.&lt;/font&gt;&lt;/p&gt;
						</project_2015-content>
						<project_2015-pop_district/>
						<project_2015-localisation_precise>
							<geoloc>
							<lon>2.379279372158752</lon>
							<lat>48.87759102013792</lat>
							<address>Avenue Simon Bolivar, 75019 PARIS</address>
							</geoloc>
						</project_2015-localisation_precise>
						<project_2015-phase1_date_deb>01/04/2016</project_2015-phase1_date_deb>
						<project_2015-phase1_echeancier/>
						<project_2015-phase2_date_deb>01/10/2016</project_2015-phase2_date_deb>
						<project_2015-phase2_echeancier/>
						<project_2015-phase3_date_deb>01/08/2017</project_2015-phase3_date_deb>
						<project_2015-phase3_echeancier/>
						<project_2015-phase4_date_deb>10/11/2017</project_2015-phase4_date_deb>
						<project_2015-phase4_date_fin>17/11/2017</project_2015-phase4_date_fin>
						<project_2015-phase4_echeancier/>
						<project_2015-campagne>Budget Participatif 2015</project_2015-campagne>
						<project_2015-statut_eudo>Achevé</project_2015-statut_eudo>
						<project_2015-num_idea>2961</project_2015-num_idea>
						<project_2015-pseudos>Treize Accessible  (autre Collectif CQ et Associations)</project_2015-pseudos>
						<project_2015-title_idea>Mise en accessibilité des centres d'animation</project_2015-title_idea>
						<project_2015-statut_eudo>Achevé</project_2015-statut_eudo>
						<project_2015-step1>01/01/2017</project_2015-step1>
						<project_2015-step2>01/04/2017</project_2015-step2>
						<project_2015-step3>01/07/2017</project_2015-step3>
						<project_2015-step4>30/09/2017</project_2015-step4>
						<project_2015-step5>10/03/2018</project_2015-step5>
						<project_2015-handicap>non</project_2015-handicap>
					</project_2015>
				</document-xml-content>
				<document-number-comment>0</document-number-comment>
				<document-number-favorite>2</document-number-favorite>
				<document-number-follow>3</document-number-follow>
			</document>
	-->
		
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
		
			<div id="portlet-pgagn-focus" class="{$device_class}">
				<div class="focus-body">
					<p>Zoom sur 3 projets :</p>
					<xsl:apply-templates select="document-list-portlet" />				
				</div>
			</div>
				
		</xsl:if>
		
	</xsl:template>

	<!-- *********************************************************************************** -->
	<!-- * FILE FILE FILE FILE FILE FILE FILE FILE FILE FILE FILE FILE FILE FILE FILE FILE * -->
	<!-- * FILE FILE FILE FILE FILE FILE FILE FILE FILE FILE FILE FILE FILE FILE FILE FILE * -->
	<!-- *********************************************************************************** -->

	<xsl:template match="document-list-portlet">
		<div class="row row-eq-height">
			<xsl:apply-templates select="document" />
		</div>
	</xsl:template>

	<xsl:template match="document">
		<div class="col-md-4">
			<a class="focus-item">
				<xsl:attribute name="href">jsp/site/Portal.jsp?document_id=<xsl:value-of select="document-id"/>&amp;portlet_id=158</xsl:attribute>
				<xsl:apply-templates select="document-xml-content/project_2015" />
			</a>
		</div>
	</xsl:template>

	<xsl:template match="document/document-xml-content/project_2015">
	
		<!-- On identifie le code technique du theme pour la gestion de la couleur de fond et de l'image -->
		<xsl:variable name="theme">
			<xsl:choose>
				<xsl:when test="(project_2015-thematique='Cadre de vie')" >cadre_vie</xsl:when> 
				<xsl:when test="(project_2015-thematique='Culture')" >culture</xsl:when>
				<xsl:when test="(project_2015-thematique='Culture et patrimoine')" >culture</xsl:when>
				<xsl:when test="(project_2015-thematique='Economie et emploi')" >economie_emploi</xsl:when>
				<xsl:when test="(project_2015-thematique='Education et jeunesse')" >education</xsl:when>
				<xsl:when test="(project_2015-thematique='Environnement')" >environnement</xsl:when>
				<xsl:when test="(project_2015-thematique='Logement et habitat')" >logement</xsl:when>
				<xsl:when test="(project_2015-thematique='Propreté')" >proprete</xsl:when>
				<xsl:when test="(project_2015-thematique='Prévention et sécurité')" >prevention_securite</xsl:when>
				<xsl:when test="(project_2015-thematique='Santé')" >sante</xsl:when>
				<xsl:when test="(project_2015-thematique='Solidarité')" >solidarite</xsl:when>
				<xsl:when test="(project_2015-thematique='Solidarité et cohésion sociale')" >solidarite</xsl:when>
				<xsl:when test="(project_2015-thematique='Solidarité et cohésion sociale ')" >solidarite</xsl:when>
				<xsl:when test="(project_2015-thematique='Sport')" >sport</xsl:when>
				<xsl:when test="(project_2015-thematique='Transport et mobilité')" >transport</xsl:when>
				<xsl:when test="(project_2015-thematique='Ville intelligente et numérique')" >ville_numerique</xsl:when>
				<xsl:otherwise><img src="images/local/skin/autre_1x2.jpg"/></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<!--  Calculs des variables pour la gestion des dates  -->
		<xsl:variable name="auj" select="number(java:format(java:java.text.SimpleDateFormat.new('yyyyMMdd'), java:java.util.Date.new()))" />
		
		<xsl:variable name="dtStep5" select="java:parse(java:java.text.SimpleDateFormat.new('dd/MM/yyyy'), project_2015-step5 )" />    <!-- Format Date : Thu Dec 31 00:00:00 CET 2099 -->
		<xsl:variable name="dtStep4" select="java:parse(java:java.text.SimpleDateFormat.new('dd/MM/yyyy'), project_2015-step4 )" />    <!-- Format Date : Thu Dec 31 00:00:00 CET 2099 -->
		<xsl:variable name="dtStep3" select="java:parse(java:java.text.SimpleDateFormat.new('dd/MM/yyyy'), project_2015-step3 )" />    <!-- Format Date : Thu Dec 31 00:00:00 CET 2099 -->
		<xsl:variable name="dtStep2" select="java:parse(java:java.text.SimpleDateFormat.new('dd/MM/yyyy'), project_2015-step2 )" />    <!-- Format Date : Thu Dec 31 00:00:00 CET 2099 -->
		<xsl:variable name="dtStep1" select="java:parse(java:java.text.SimpleDateFormat.new('dd/MM/yyyy'), project_2015-step1 )" />    <!-- Format Date : Thu Dec 31 00:00:00 CET 2099 -->

		<xsl:variable name="date-step5" select="number( java:format(java:java.text.SimpleDateFormat.new('yyyyMMdd'), $dtStep5 ))" /> <!-- Format Number : 20990131 -->
		<xsl:variable name="date-step4" select="number( java:format(java:java.text.SimpleDateFormat.new('yyyyMMdd'), $dtStep4 ))" /> <!-- Format Number : 20990131 -->
		<xsl:variable name="date-step3" select="number( java:format(java:java.text.SimpleDateFormat.new('yyyyMMdd'), $dtStep3 ))" /> <!-- Format Number : 20990131 -->
		<xsl:variable name="date-step2" select="number( java:format(java:java.text.SimpleDateFormat.new('yyyyMMdd'), $dtStep2 ))" /> <!-- Format Number : 20990131 -->
		<xsl:variable name="date-step1" select="number( java:format(java:java.text.SimpleDateFormat.new('yyyyMMdd'), $dtStep1 ))" /> <!-- Format Number : 20990131 -->
		
		<div class="focus-img">
			<xsl:choose>
				<xsl:when test="project_2015-image!=''">
					<xsl:value-of disable-output-escaping="yes" select="project_2015-image" />
				</xsl:when>
				<xsl:otherwise>
					<img><xsl:attribute name="src">images/local/skin/i_<xsl:value-of select="$theme"/>_1x2.jpg</xsl:attribute></img>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	
		<div>
			<xsl:attribute name="class">focus-theme bgcolor-theme-<xsl:value-of select="$theme"/></xsl:attribute>
			<img>
				<xsl:attribute name="src">images/local/skin/i2_<xsl:value-of select="$theme"/>.png</xsl:attribute>
			</img>
			<xsl:value-of select="project_2015-thematique"/>
		</div>
		
		<div>
			<xsl:attribute name="class">bordered-4px-theme-<xsl:value-of select="$theme"/></xsl:attribute>
	
			<div class="focus-title">
				<xsl:value-of select="document-title"/>
			</div>
	
			<div class="focus-bottom">
				<div class="focus-progress">
				
					<xsl:choose>
			
						<xsl:when test="($auj &gt;= $date-step5)">
							<div class="focus-phase">réalisé !</div>
							<div>
								<xsl:attribute name="class">focus-steps finished bordered-light-4px-theme-<xsl:value-of select="$theme"/></xsl:attribute>
								
								<div><xsl:attribute name="class">focus-step bgcolor-theme-<xsl:value-of select="$theme"/></xsl:attribute>&#160;</div>
								<div><xsl:attribute name="class">focus-step bgcolor-theme-<xsl:value-of select="$theme"/></xsl:attribute>&#160;</div>
								<div><xsl:attribute name="class">focus-step bgcolor-theme-<xsl:value-of select="$theme"/></xsl:attribute>&#160;</div>
								<div><xsl:attribute name="class">focus-step bgcolor-theme-<xsl:value-of select="$theme"/></xsl:attribute>&#160;</div>
								<div><xsl:attribute name="class">focus-step bgcolor-theme-<xsl:value-of select="$theme"/></xsl:attribute>&#160;</div>
							</div>
						</xsl:when>
						
						<xsl:when test="($auj &gt;= $date-step4)">
							<div class="focus-phase">4/5 en cours de livraison</div>
							<div class="focus-steps">
								<div><xsl:attribute name="class">focus-step bgcolor-theme-<xsl:value-of select="$theme"/></xsl:attribute>&#160;</div>
								<div><xsl:attribute name="class">focus-step bgcolor-theme-<xsl:value-of select="$theme"/></xsl:attribute>&#160;</div>
								<div><xsl:attribute name="class">focus-step bgcolor-theme-<xsl:value-of select="$theme"/></xsl:attribute>&#160;</div>
								<div><xsl:attribute name="class">focus-step bgcolor-theme-<xsl:value-of select="$theme"/></xsl:attribute>&#160;</div>
								<div><xsl:attribute name="class">focus-step bgcolor-theme-lightgray</xsl:attribute>&#160;</div>
							</div>
						</xsl:when>
						
						<xsl:when test="($auj &gt;= $date-step3)">
							<div class="focus-phase">3/5 travaux en cours</div>
							<div class="focus-steps">
								<div><xsl:attribute name="class">focus-step bgcolor-theme-<xsl:value-of select="$theme"/></xsl:attribute>&#160;</div>
								<div><xsl:attribute name="class">focus-step bgcolor-theme-<xsl:value-of select="$theme"/></xsl:attribute>&#160;</div>
								<div><xsl:attribute name="class">focus-step bgcolor-theme-<xsl:value-of select="$theme"/></xsl:attribute>&#160;</div>
								<div><xsl:attribute name="class">focus-step bgcolor-theme-lightgray</xsl:attribute>&#160;</div>
								<div><xsl:attribute name="class">focus-step bgcolor-theme-lightgray</xsl:attribute>&#160;</div>
							</div>
						</xsl:when>
						
						<xsl:when test="($auj &gt;= $date-step2)">
							<div class="focus-phase">2/5 procédures en cours</div>
							<div class="focus-steps">
								<div><xsl:attribute name="class">focus-step bgcolor-theme-<xsl:value-of select="$theme"/></xsl:attribute>&#160;</div>
								<div><xsl:attribute name="class">focus-step bgcolor-theme-<xsl:value-of select="$theme"/></xsl:attribute>&#160;</div>
								<div><xsl:attribute name="class">focus-step bgcolor-theme-lightgray</xsl:attribute>&#160;</div>
								<div><xsl:attribute name="class">focus-step bgcolor-theme-lightgray</xsl:attribute>&#160;</div>
								<div><xsl:attribute name="class">focus-step bgcolor-theme-lightgray</xsl:attribute>&#160;</div>
							</div>
						</xsl:when>
						
						<xsl:when test="($auj &gt;= $date-step1)">
							<div class="focus-phase">1/5 études en cours</div>
							<div class="focus-steps">
								<div><xsl:attribute name="class">focus-step bgcolor-theme-<xsl:value-of select="$theme"/></xsl:attribute>&#160;</div>
								<div><xsl:attribute name="class">focus-step bgcolor-theme-lightgray</xsl:attribute>&#160;</div>
								<div><xsl:attribute name="class">focus-step bgcolor-theme-lightgray</xsl:attribute>&#160;</div>
								<div><xsl:attribute name="class">focus-step bgcolor-theme-lightgray</xsl:attribute>&#160;</div>
								<div><xsl:attribute name="class">focus-step bgcolor-theme-lightgray</xsl:attribute>&#160;</div>
							</div>
						</xsl:when>
						
						<xsl:otherwise>
							<div class="focus-phase">en cours de démarrage</div>
							<div class="focus-steps">
								<div><xsl:attribute name="class">focus-step bgcolor-theme-lightgray</xsl:attribute>&#160;</div>
								<div><xsl:attribute name="class">focus-step bgcolor-theme-lightgray</xsl:attribute>&#160;</div>
								<div><xsl:attribute name="class">focus-step bgcolor-theme-lightgray</xsl:attribute>&#160;</div>
								<div><xsl:attribute name="class">focus-step bgcolor-theme-lightgray</xsl:attribute>&#160;</div>
								<div><xsl:attribute name="class">focus-step bgcolor-theme-lightgray</xsl:attribute>&#160;</div>
							</div>
						</xsl:otherwise>
						
					</xsl:choose>
					
				</div>
		
				<span class="focus-link btn btn-14rem btn-black-on-white">
					<xsl:attribute name="href">jsp/site/Portal.jsp?document_id=<xsl:value-of select="document-id"/>&amp;portlet_id=158</xsl:attribute>
					découvrir le projet
				</span>
			
			</div>

		</div>

	</xsl:template>

</xsl:stylesheet>
