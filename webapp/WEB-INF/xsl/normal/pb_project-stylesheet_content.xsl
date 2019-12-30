<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:java="http://xml.apache.org/xslt/java" exclude-result-prefixes="java">
  <!--
   	How to display the publication date :
   	<xsl:value-of select="$publication-date" />
  -->
<xsl:output method="html" indent="yes"/>
	<xsl:decimal-format name="space" grouping-separator=" "></xsl:decimal-format>

	<xsl:template match="content">
	
		<!-- Visualisation du contenu XML source -->
		<!-- pre><xsl:copy-of select="."/></pre -->
	
		<xsl:choose>
			<xsl:when test="(string(pb_project/pb_project-statut_project)!='SUIVI') and (java:isBeforeBeginning(java:fr.paris.lutece.plugins.participatorybudget.service.CampagnesService.getInstance(), 'SUBMIT'))" >
				<div id="prop-card">
					<div class="row">
						<div class="col-xs-12 col-sm-offset-2 col-sm-8">
							<br/>
							<div class="alert alert-warning">
								<h3 class="text-center text-warning"> <i class="fa fa-warning"></i>#i18n{portal.openpb.project.sheet.warning}</h3>
								<p class="text-center">#i18n{portal.openpb.project.sheet.not_available}</p>
							</div>
						</div>
					</div>			
				</div>			
			</xsl:when> 
			<xsl:otherwise>
				<xsl:apply-templates select="pb_project"/>
			</xsl:otherwise>
		</xsl:choose>

	</xsl:template>

	<xsl:template match="pb_project">

		<!-- *************************************************************************************************************************************************************************** -->
		<!-- * PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM * -->
		<!-- * PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM PSOUM * -->
		<!-- *************************************************************************************************************************************************************************** -->
		
		<!-- On identifie le code technique du theme pour la gestion de la couleur de fond et de l'image -->
		<xsl:variable name="theme">
			<xsl:choose>
				<xsl:when test="(pb_project-thematique='Cadre de vie')" >cadre_vie</xsl:when> 
				<xsl:when test="(pb_project-thematique='Culture')" >culture</xsl:when>
				<xsl:when test="(pb_project-thematique='Culture et patrimoine')" >culture</xsl:when>
				<xsl:when test="(pb_project-thematique='Economie et emploi')" >economie_emploi</xsl:when>
				<xsl:when test="(pb_project-thematique='Économie, emploi et attractivité')" >economie_emploi</xsl:when>
				<xsl:when test="(pb_project-thematique='Education et jeunesse')" >education</xsl:when>
				<xsl:when test="(pb_project-thematique='Environnement')" >environnement</xsl:when>
				<xsl:when test="(pb_project-thematique='Logement et habitat')" >logement</xsl:when>
				<xsl:when test="(pb_project-thematique='Participation citoyenne')" >participation_citoyenne</xsl:when>
				<xsl:when test="(pb_project-thematique='Propreté')" >proprete</xsl:when>
				<xsl:when test="(pb_project-thematique='Prévention et sécurité')" >prevention_securite</xsl:when>
				<xsl:when test="(pb_project-thematique='Santé')" >sante</xsl:when>
				<xsl:when test="(pb_project-thematique='Solidarité')" >solidarite</xsl:when>
				<xsl:when test="(pb_project-thematique='Solidarité et cohésion sociale')" >solidarite</xsl:when>
				<xsl:when test="(pb_project-thematique='Solidarité et cohésion sociale ')" >solidarite</xsl:when>
				<xsl:when test="(pb_project-thematique='Sport')" >sport</xsl:when>
				<xsl:when test="(pb_project-thematique='Transport et mobilité')" >transport</xsl:when>
				<xsl:when test="(pb_project-thematique='Ville intelligente et numérique')" >ville_numerique</xsl:when>
				<xsl:otherwise><img src="images/local/skin/autre_1x2.jpg"/></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<!-- On calcule au préalable les variables nécessaires aux tests sur les dates. On calcule à partir de la dernière (au pire au 31/12/2099), et si une date est vide, on prend celle de l'étape suivante. -->
												
		<xsl:variable name="auj" select="number(java:format(java:java.text.SimpleDateFormat.new('yyyyMMdd'), java:java.util.Date.new()))" />
		
		<xsl:variable name="dtStep4f-txt"> <!-- Format String : 31/12/2099 -->
			<xsl:choose>
				<xsl:when test="pb_project-step5 = ''"><xsl:value-of select="string('31/12/2099')" /></xsl:when>
				<xsl:otherwise><xsl:value-of select="string(pb_project-step5)" /></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="dtStep4f"    select="java:parse(java:java.text.SimpleDateFormat.new('dd/MM/yyyy'), $dtStep4f-txt )" />    <!-- Format Date : Thu Dec 31 00:00:00 CET 2099 -->
		<xsl:variable name="date-step4f" select="number( java:format(java:java.text.SimpleDateFormat.new('yyyyMMdd'), $dtStep4f ))" /> <!-- Format Number : 20990131 -->
		
		<xsl:variable name="dtStep4-txt"> <!-- Format String : 31/12/2099 -->
			<xsl:choose>
				<xsl:when test="pb_project-step4 = ''"><xsl:value-of select="string('31/12/2099')" /></xsl:when>
				<xsl:otherwise><xsl:value-of select="string(pb_project-step4)" /></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="dtStep4"    select="java:parse(java:java.text.SimpleDateFormat.new('dd/MM/yyyy'), $dtStep4-txt )" />    <!-- Format Date : Thu Dec 31 00:00:00 CET 2099 -->
		<xsl:variable name="date-step4" select="number( java:format(java:java.text.SimpleDateFormat.new('yyyyMMdd'), $dtStep4 ))" /> <!-- Format Number : 20990131 -->

		<xsl:variable name="dtStep3-txt"> <!-- Format String : 31/12/2099 -->
			<xsl:choose>
				<xsl:when test="pb_project-step3 = ''"><xsl:value-of select="string('31/12/2099')" /></xsl:when>
				<xsl:otherwise><xsl:value-of select="string(pb_project-step3)" /></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="dtStep3"    select="java:parse(java:java.text.SimpleDateFormat.new('dd/MM/yyyy'), $dtStep3-txt )" />    <!-- Format Date : Thu Dec 31 00:00:00 CET 2099 -->
		<xsl:variable name="date-step3" select="number( java:format(java:java.text.SimpleDateFormat.new('yyyyMMdd'), $dtStep3 ))" /> <!-- Format Number : 20990131 -->

		<xsl:variable name="dtStep2-txt"> <!-- Format String : 31/12/2099 -->
			<xsl:choose>
				<xsl:when test="pb_project-step2 = ''"><xsl:value-of select="string('31/12/2099')" /></xsl:when>
				<xsl:otherwise><xsl:value-of select="string(pb_project-step2)" /></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="dtStep2"    select="java:parse(java:java.text.SimpleDateFormat.new('dd/MM/yyyy'), $dtStep2-txt )" />    <!-- Format Date : Thu Dec 31 00:00:00 CET 2099 -->
		<xsl:variable name="date-step2" select="number( java:format(java:java.text.SimpleDateFormat.new('yyyyMMdd'), $dtStep2 ))" /> <!-- Format Number : 20990131 -->

		<xsl:variable name="dtStep1-txt"> <!-- Format String : 31/12/2099 -->
			<xsl:choose>
				<xsl:when test="pb_project-step1 = ''"><xsl:value-of select="string('31/12/2099')" /></xsl:when>
				<xsl:otherwise><xsl:value-of select="string(pb_project-step1)" /></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="dtStep1"    select="java:parse(java:java.text.SimpleDateFormat.new('dd/MM/yyyy'), $dtStep1-txt )" />    <!-- Format Date : Thu Dec 31 00:00:00 CET 2099 -->
		<xsl:variable name="date-step1" select="number( java:format(java:java.text.SimpleDateFormat.new('yyyyMMdd'), $dtStep1 ))" /> <!-- Format Number : 20990131 -->

		<!-- Affichage de debug... -->
		<!-- 
		<div style="display:none">
		<br/><br/><br/><br/><br/><br/><br/>
		auj = <xsl:value-of select="$auj" /><br/>
		<br/>
		pb_project-phase1_date_deb = <xsl:value-of select="pb_project-phase1_date_deb" /><br/>
		pb_project-phase2_date_deb = <xsl:value-of select="pb_project-phase2_date_deb" /><br/>
		pb_project-phase3_date_deb = <xsl:value-of select="pb_project-phase3_date_deb" /><br/>
		pb_project-phase4_date_deb = <xsl:value-of select="pb_project-phase4_date_deb" /><br/>
		pb_project-phase4_date_fin = <xsl:value-of select="pb_project-phase4_date_fin" /><br/>
		<br/>
		$dtStep1  = <xsl:value-of select="$dtStep1" /><br/>
		$dtStep2  = <xsl:value-of select="$dtStep2" /><br/>
		$dtStep3  = <xsl:value-of select="$dtStep3" /><br/>
		$dtStep4  = <xsl:value-of select="$dtStep4" /><br/>
		$dtStep4f = <xsl:value-of select="$dtStep4f" /><br/>
		<br/>
		$date-step1  = <xsl:value-of select="$date-step1" /><br/>
		$date-step2  = <xsl:value-of select="$date-step2" /><br/>
		$date-step3  = <xsl:value-of select="$date-step3" /><br/>
		$date-step4  = <xsl:value-of select="$date-step4" /><br/>
		$date-step4f = <xsl:value-of select="$date-step4f" /><br/>
		</div>
		-->
		
		<div class="container">
		
			<xsl:if test="string(pb_project-statut_project)='PERDANT' or string(pb_project-statut_project)='NON_SUIVI' or string(pb_project-statut_eudo)='Abandonné'">
				<xsl:attribute name="class">container grayscaled</xsl:attribute>
			</xsl:if>
		
			<!-- *********************************************************************************** -->
			<!-- * HEADER HEADER HEADER HEADER HEADER HEADER HEADER HEADER HEADER HEADER HEADER HE * -->
			<!-- * HEADER HEADER HEADER HEADER HEADER HEADER HEADER HEADER HEADER HEADER HEADER HE * -->
			<!-- *********************************************************************************** -->
			<div id="psoum-header">
				<xsl:attribute name="class">row bgcolor-theme-<xsl:value-of select="$theme"/></xsl:attribute>
			
				<span><xsl:value-of select="pb_project-thematique" /></span>
			
				<div class="psoum-header-share">
					<a href="http://www.facebook.com" data-action="facebook-action" data-title="{document-title}" data-doc="{document-id}" class="share"  title="Share on Facebook">
					  <img src="images/local/skin/pastille-fb.png" alt="Share on Facebook" title="Share on Facebook"/>
					</a>
					<a href="http://www.twitter.com" data-action="twitter-action" data-title="{document-title}" data-doc="{document-id}" class="share" title="Share on Twitter" target="_blank">
					  <img src="images/local/skin/pastille-tw.png" alt="Share on Twitter" title="Share on Twitter"/>
					</a>
				</div>
			</div>
			
			<div id="psoum-body">
				<xsl:attribute name="class">row bg-color0 bordered-4px-theme-<xsl:value-of select="$theme"/></xsl:attribute>
			
				<!-- *********************************************************************************** -->
				<!-- * DESC DESC DESC DESC DESC DESC DESC DESC DESC DESC DESC DESC DESC DESC DESC DESC * -->
				<!-- * DESC DESC DESC DESC DESC DESC DESC DESC DESC DESC DESC DESC DESC DESC DESC DESC * -->
				<!-- *********************************************************************************** -->
				<div id="psoum-desc" class="col-xs-12 col-sm-8 bg-color0">
				
					<!-- Location -->
					<div class="psoum-desc-localisation">
					
						<img alt="Location" title="Location">
							<xsl:attribute name="src">images/local/skin/marker-<xsl:value-of select="$theme"/>.png</xsl:attribute>
						</img>
					
						<div class="psoum-desc-localisation-addr">
							<xsl:if test="not(string(pb_project-lieu)='')"><xsl:value-of select="pb_project-lieu" /><br /></xsl:if>
							<xsl:value-of select="pb_project-localisation" />
						</div>
					</div>
					
					<!-- Title -->
					<div class="psoum-desc-titre">
						<h1>
							<xsl:choose>
								<xsl:when test="not(string(pb_project-code_projet)='') and (string(pb_project-statut_project)='SOUMIS')">
									<p class="num-project"><xsl:variable name="ordre" select="pb_project-code_projet"></xsl:variable><span>Projet n° <xsl:value-of select='format-number($ordre, "##")' /></span></p>
								</xsl:when>
								<xsl:otherwise>
									<p class="num-project">&#160;</p> <!-- To keep margin between location and title divs -->
								</xsl:otherwise>
							</xsl:choose>
							<p><xsl:value-of select="document-title" /></p>
						</h1>
					</div>
					
					<!-- Subtitle -->
					<div class="psoum-desc-soustitre">
						<xsl:if test="not(string(pb_project-sous_titre)='')">
							<h2>
								<p><xsl:value-of select="pb_project-sous_titre" /></p>
							</h2>
						</xsl:if>
					</div>
					
					<!-- Delivered project (only in XS format) -->
					<xsl:if test="($auj &gt; $date-step4f)">
						<div>
							<xsl:attribute name="class">psoum-desc-delivered visible-xs visible-sm bgcolor-theme-<xsl:value-of select="$theme"/></xsl:attribute>
							#i18n{portal.openpb.project.sheet.status.completed}
						</div>
					</xsl:if>

					<!-- Abandoned project (only in XS format) -->
					<xsl:if test="string(pb_project-statut_eudo)='Abandonné'">
						<div>
							<xsl:attribute name="class">psoum-desc-undeliverable visible-xs visible-sm bgcolor-theme-<xsl:value-of select="$theme"/></xsl:attribute>
							#i18n{portal.openpb.project.sheet.status.abandoned}
						</div>
					</xsl:if>

					<!-- Image: specific to the current document or general to the theme -->
					<div class="psoum-desc-img">
						<xsl:choose>
							<xsl:when test="pb_project-image!=''">
								<xsl:value-of disable-output-escaping="yes" select="pb_project-image" />
							</xsl:when>
							<xsl:otherwise>
								<img><xsl:attribute name="src">images/local/skin/i_<xsl:value-of select="$theme"/>_1x2.png</xsl:attribute></img>
							</xsl:otherwise>
						</xsl:choose>
					</div>
					
					<!-- Textual description of the project -->
					<h2>
						<xsl:attribute name="class">color-theme-<xsl:value-of select="$theme"/></xsl:attribute>
                        #i18n{portal.openpb.project.sheet.project}
                    </h2>
					<div>
						<xsl:attribute name="class">psoum-desc-txt</xsl:attribute>
						<xsl:value-of disable-output-escaping="yes" select="pb_project-description" />
					</div>
					
					<!-- Project Mapping -->
					<!-- 
					<xsl:choose>
						<xsl:when test="pb_project-localisation_precise/geoloc/address != ''">
							<script type='text/javascript'>
								var x = <xsl:value-of select="pb_project-localisation_precise/geoloc/lat"/>;
								var y = <xsl:value-of select="pb_project-localisation_precise/geoloc/lon"/>;
							</script>
							<div id="carto" class="psoum-desc-carto">&#160;</div>
						</xsl:when>
					</xsl:choose>
					-->

					<!-- Project progress -->
					<xsl:if test="(string(pb_project-statut_project)='SUIVI' or string(pb_project-statut_project)='suivi') and (pb_project-content != '')">
						<h2>
							<xsl:attribute name="class">color-theme-<xsl:value-of select="$theme"/></xsl:attribute>
							<a id="avct"></a>
							#i18n{portal.openpb.project.sheet.progress}
						</h2>
						<div class="psoum-desc-avct">
							<xsl:value-of disable-output-escaping="yes" select="pb_project-content" />
						</div>
					</xsl:if>

				</div>
				
				<!-- *********************************************************************************** -->
				<!-- * DATA DATA DATA DATA DATA DATA DATA DATA DATA DATA DATA DATA DATA DATA DATA DATA * -->
				<!-- * DATA DATA DATA DATA DATA DATA DATA DATA DATA DATA DATA DATA DATA DATA DATA DATA * -->
				<!-- *********************************************************************************** -->
				<div id="psoum-data" class="col-xs-12 col-sm-4 bg-color0">
				
					<!-- Div only visible in XS to display a horizontal dividing line -->
					<div class="psoum-data-sep visible-xs"/>
				
					<!-- Delivered project -->
					<xsl:if test="($auj &gt; $date-step4f)">
						<div>
							<xsl:attribute name="class">psoum-data-delivered hidden-xs hidden-sm bgcolor-theme-<xsl:value-of select="$theme"/></xsl:attribute>
							#i18n{portal.openpb.project.sheet.status.completed}
						</div>
					</xsl:if>
					
					<!-- Abandoned project -->
					<xsl:if test="string(pb_project-statut_eudo)='Abandonné'">
						<div>
							<xsl:attribute name="class">psoum-data-undeliverable hidden-xs hidden-sm bgcolor-theme-<xsl:value-of select="$theme"/></xsl:attribute>
							#i18n{portal.openpb.project.sheet.status.abandoned}
						</div>
					</xsl:if>
					
				<!-- 	<div id="psoum-data-header">
						
						Pastille QP et RATP
						<div id="psoum-data-pastilles">
							<xsl:if test="not(string(pb_project-pop_district)='')">
								<img class="img-qp" src="images/local/skin/quartier-populaire.png" alt="Projet en quartier populaire" />
							</xsl:if>
							<xsl:if test="not(string(pb_project-direction)='')">
								<xsl:if test="string(pb_project-direction)='RATP'">
									<img class="img-ratp" src="images/local/skin/ratp_color.png" alt="Projet RATP" />
								</xsl:if>
							</xsl:if>
						</div>

					</div> -->
						
					<!-- Voting button. The HTML of the bookmark button is in the database (table = core-template, templatename = extend_follow). -->
					<div id="title-{document-id}" title="{document-title}" style="display:none;">.</div>
					<div id="vote">&#160;</div>		<!-- Extend : vote -->

					<!-- Some data -->
					<h2>#i18n{portal.openpb.project.sheet.project}</h2>
					
					<!-- Edition of the PB -->
					<div class="psoum-data-kv">
						<div class="psoum-data-key">
							<img alt="Campaign" title="Campaign">
								<xsl:attribute name="src">images/local/skin/logo_paris_bp_ultramini-<xsl:value-of select="$theme"/>.png</xsl:attribute>
							</img>
						</div>
						<div class="psoum-data-value">
							<xsl:value-of select="pb_project-campagne" />
						</div>
					</div>
					
					<!-- Result of the vote -->
					<div class="psoum-data-kv">
						<xsl:choose>
							<xsl:when test="(string(pb_project-statut_project)='GAGNANT') or (string(pb_project-statut_project)='SUIVI')">
								<div class="psoum-data-key">
									<img alt="Result of the vote" title="Result of the vote">
										<xsl:attribute name="src">images/local/skin/trophy-<xsl:value-of select="$theme"/>.png</xsl:attribute>
									</img>
								</div>
								<div class="psoum-data-value">
									<xsl:variable name="nb_votes" select="pb_project-nombre_de_votes"></xsl:variable>
									#i18n{portal.openpb.project.sheet.vote_result.winning} <xsl:value-of select='format-number($nb_votes, "# ###", "space")' /> votes !
								</div>
							</xsl:when>
							<xsl:when test="(string(pb_project-statut_project)='PERDANT') or (string(pb_project-statut_project)='NON_SUIVI')">
								<div class="psoum-data-key">
									<img src="images/local/skin/trophy-empty.png" alt="Result of the vote" title="Result of the vote"/>
								</div>
								<div class="psoum-data-value">
									<xsl:variable name="nb_votes" select="pb_project-nombre_de_votes"></xsl:variable>
									#i18n{portal.openpb.project.sheet.vote_result.losing} <xsl:value-of select='format-number($nb_votes, "# ###", "space")' /> votes
								</div>
							</xsl:when>
						</xsl:choose>
					</div>
					

					<!-- Cost -->
					<xsl:if test="not(string(pb_project-budget)='')">
						<div class="psoum-data-kv last">
							<div class="psoum-data-key">
								<img alt="Cost" title="Cost">
									<xsl:attribute name="src">images/local/skin/money-<xsl:value-of select="$theme"/>.png</xsl:attribute>
								</img>
							</div>
							<div class="psoum-data-value">
								<xsl:variable name="budget" select="pb_project-budget"></xsl:variable>
								<xsl:value-of select='format-number($budget, "# ###", "space")' /> €
							</div>
						</div>
					</xsl:if>

					<!-- Handicap -->
					<xsl:if test="string(pb_project-handicap)='oui'">
						<p id="psoum-data-handicap">
							Les questions du handicap et de l'accessibilité sont prises en compte dans le cadre de ce projet.
						</p>
					</xsl:if>

					<!-- Project Mapping -->
					<xsl:choose>
						<xsl:when test="(string(pb_project-localisation_precise/geoloc/address) = '') and (string(pb_project-statut_project)='SUIVI')">
							<script type='text/javascript'>
								var x = 48.8564826;
								var y = 2.3524135;
							</script>
							<div id="carto" class="psoum-data-carto">&#160;</div>
						</xsl:when>
						<xsl:when test="(pb_project-localisation_precise/geoloc/address != '') or (string(pb_project-statut_project)='SUIVI')">
							<script type='text/javascript'>
								var x = <xsl:value-of select="pb_project-localisation_precise/geoloc/lat"/>;
								var y = <xsl:value-of select="pb_project-localisation_precise/geoloc/lon"/>;
							</script>
							<div id="carto" class="psoum-data-carto">&#160;</div>
						</xsl:when>
						<xsl:otherwise>
							<script type='text/javascript'>
								var x = 48.8564826;
								var y = 2.3524135;
							</script>
							<div id="carto" class="psoum-data-carto" style="display:none;">&#160;</div>
						</xsl:otherwise>
					</xsl:choose>

					<!-- Bookmark buttons. The HTML of the bookmark button is in the database (table = core-template, templatename = extend_follow). -->
					<xsl:if test="string(pb_project-statut_eudo)!='Abandonné'">
						<div id="fav">&#160;</div>		<!-- Extend : favorite -->
						<div id="follow">&#160;</div>	<!-- Extend : follow -->
					</xsl:if>

					<!-- Schedule: in grey if not started, in black if started, in black with check if finished -->
					<xsl:if test="(string(pb_project-statut_project)='SUIVI' or string(pb_project-statut_project)='suivi') and (string(pb_project-statut_eudo)!='Abandonné')">
						<div class="psoum-data-planning separator-horiz-4px">
						
							<h2>#i18n{portal.openpb.project.sheet.planning}</h2>
	
							<!-- Principle of date display :
									Phase not started: marked 'unactive'.
									Phase started    : marked 'active'         + start date
									Phase Completed  : marked 'active'         + 'check' icon + start date (except phase 4: end date) -->
							
							<!-- <xsl:value-of select="pb_project-phase1_date_deb" /> -->
							<xsl:choose>
								<xsl:when test="($auj &gt;= $date-step2) and (pb_project-phase1_date_deb = '')">
									<p class="date-step phase-active"><img src="images/local/skin/plugins/plugin-participatorybudget/check.png" alt="Completed studies" title=""/>#i18n{portal.openpb.project.sheet.planning.study}</p>
								</xsl:when>
								<xsl:when test="($auj &gt;= $date-step2)">
									<p class="date-step phase-active"><img src="images/local/skin/plugins/plugin-participatorybudget/check.png" alt="Completed studies" title=""/>#i18n{portal.openpb.project.sheet.planning.study}<br/><span style="color:#ffffff"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png"/>1. </span><span class="phase-beginning">(#i18n{portal.openpb.project.sheet.planning.started_in} <xsl:value-of select="java:format(java:java.text.SimpleDateFormat.new('MMMM yyyy'), $dtStep1 )" />)</span></p>
								</xsl:when>
							
								<xsl:when test="($auj &lt; $date-step2) and ($auj &gt;= $date-step1) and (pb_project-phase1_date_deb = '')">
									<p class="date-step phase-active"><img src="images/local/skin/plugins/plugin-participatorybudget/check-current.png" alt="Studies in progress" title=""/>#i18n{portal.openpb.project.sheet.planning.study}</p>
								</xsl:when>
								<xsl:when test="($auj &lt; $date-step2) and ($auj &gt;= $date-step1)">
									<p class="date-step phase-active"><img src="images/local/skin/plugins/plugin-participatorybudget/check-current.png" alt="Studies in progress" title=""/>#i18n{portal.openpb.project.sheet.planning.study}<br/><span style="color:#ffffff"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png"/>1. </span><span class="phase-beginning">(#i18n{portal.openpb.project.sheet.planning.started_in} <xsl:value-of select="java:format(java:java.text.SimpleDateFormat.new('MMMM yyyy'), $dtStep1 )" />)</span></p>
								</xsl:when>

								<xsl:when test="($auj &lt; $date-step1) and ($date-step1 &gt; 20990000)">
									<p class="date-step phase-unactive"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png" alt="Upcoming studies" title=""/>#i18n{portal.openpb.project.sheet.planning.study}</p>
								</xsl:when>

								<xsl:when test="($auj &lt; $date-step1) and (pb_project-phase1_date_deb != '')">
									<p class="date-step phase-unactive"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png" alt="Upcoming studies" title=""/>#i18n{portal.openpb.project.sheet.planning.study}<br/><span style="color:#ffffff"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png"/>1. </span><span class="phase-beginning">(#i18n{portal.openpb.project.sheet.planning.expected_in} <xsl:value-of select="java:format(java:java.text.SimpleDateFormat.new('MMMM yyyy'), $dtStep1 )" />)</span></p>
								</xsl:when>

								<xsl:otherwise>
									<p>#i18n{portal.openpb.project.sheet.planning.study.not_started.title}</p>
									<p class="date-step phase-unactive"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png" alt="Not started studies" title=""/>#i18n{portal.openpb.project.sheet.planning.study}</p>
								</xsl:otherwise>
							</xsl:choose>
						
							<!-- <xsl:value-of select="pb_project-phase2_date_deb" /> -->
							<xsl:choose>
								<xsl:when test="($auj &gt;= $date-step3) and (pb_project-phase2_date_deb = '')">
									<p class="date-step phase-active"><img src="images/local/skin/plugins/plugin-participatorybudget/check.png" alt="Completed procedures" title=""/>#i18n{portal.openpb.project.sheet.planning.proceeding}</p>
								</xsl:when>
								<xsl:when test="($auj &gt;= $date-step3)">
									<p class="date-step phase-active"><img src="images/local/skin/plugins/plugin-participatorybudget/check.png" alt="Completed procedures" title=""/>#i18n{portal.openpb.project.sheet.planning.proceeding}<br/><span style="color:#ffffff"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png"/>2. </span><span class="phase-beginning">(#i18n{portal.openpb.project.sheet.planning.started_in} <xsl:value-of select="java:format(java:java.text.SimpleDateFormat.new('MMMM yyyy'), $dtStep2 )" />)</span></p>
								</xsl:when>

								<xsl:when test="($auj &lt; $date-step3) and ($auj &gt;= $date-step2) and (pb_project-phase2_date_deb = '')">
									<p class="date-step phase-active"><img src="images/local/skin/plugins/plugin-participatorybudget/check-current.png" alt="Procedures in progress" title=""/>#i18n{portal.openpb.project.sheet.planning.proceeding}</p>
								</xsl:when>
								<xsl:when test="($auj &lt; $date-step3) and ($auj &gt;= $date-step2)">
									<p class="date-step phase-active"><img src="images/local/skin/plugins/plugin-participatorybudget/check-current.png" alt="Procedures in progress" title=""/>#i18n{portal.openpb.project.sheet.planning.proceeding}<br/><span style="color:#ffffff"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png"/>2. </span><span class="phase-beginning">(#i18n{portal.openpb.project.sheet.planning.started_in} <xsl:value-of select="java:format(java:java.text.SimpleDateFormat.new('MMMM yyyy'), $dtStep2 )" />)</span></p>
								</xsl:when>

								<xsl:when test="($auj &lt; $date-step2) and ($date-step2 &gt; 20990000)">
									<p class="date-step phase-unactive"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png" alt="Upcoming procedures" title=""/>#i18n{portal.openpb.project.sheet.planning.proceeding}</p>
								</xsl:when>

								<xsl:when test="($auj &lt; $date-step2) and (pb_project-phase2_date_deb != '')">
									<p class="date-step phase-unactive"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png" alt="Upcoming procedures" title=""/>#i18n{portal.openpb.project.sheet.planning.proceeding}<br/><span style="color:#ffffff"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png"/>2. </span><span class="phase-beginning">(#i18n{portal.openpb.project.sheet.planning.expected_in} <xsl:value-of select="java:format(java:java.text.SimpleDateFormat.new('MMMM yyyy'), $dtStep2 )" />)</span></p>
								</xsl:when>

								<xsl:otherwise>
									<p class="date-step phase-unactive"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png" alt="Not started procedures" title=""/>#i18n{portal.openpb.project.sheet.planning.proceeding}</p>
								</xsl:otherwise>
							</xsl:choose>
						
							<!-- <xsl:value-of select="pb_project-phase3_date_deb" /> -->
							<xsl:choose>
								<xsl:when test="($auj &gt;= $date-step4) and (pb_project-phase3_date_deb = '')">
									<p class="date-step phase-active"><img src="images/local/skin/plugins/plugin-participatorybudget/check.png" alt="Completed work" title=""/>#i18n{portal.openpb.project.sheet.planning.work}</p>
								</xsl:when>
								<xsl:when test="($auj &gt;= $date-step4)">
									<p class="date-step phase-active"><img src="images/local/skin/plugins/plugin-participatorybudget/check.png" alt="Completed work" title=""/>#i18n{portal.openpb.project.sheet.planning.work}<br/><span style="color:#ffffff"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png"/>3. </span><span class="phase-beginning">(#i18n{portal.openpb.project.sheet.planning.started_in} <xsl:value-of select="java:format(java:java.text.SimpleDateFormat.new('MMMM yyyy'), $dtStep3 )" />)</span></p>
								</xsl:when>
								
								<xsl:when test="($auj &lt; $date-step4) and ($auj &gt;= $date-step3) and (pb_project-phase3_date_deb = '')">
									<p class="date-step phase-active"><img src="images/local/skin/plugins/plugin-participatorybudget/check-current.png" alt="Work in progress" title=""/>#i18n{portal.openpb.project.sheet.planning.work}</p>
								</xsl:when>
								<xsl:when test="($auj &lt; $date-step4) and ($auj &gt;= $date-step3)">
									<p class="date-step phase-active"><img src="images/local/skin/plugins/plugin-participatorybudget/check-current.png" alt="Work in progress" title=""/>#i18n{portal.openpb.project.sheet.planning.work}<br/><span style="color:#ffffff"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png"/>3. </span><span class="phase-beginning">(#i18n{portal.openpb.project.sheet.planning.started_in} <xsl:value-of select="java:format(java:java.text.SimpleDateFormat.new('MMMM yyyy'), $dtStep3 )" />)</span></p>
								</xsl:when>
								
								<xsl:when test="($auj &lt; $date-step3) and ($date-step3 &gt; 20990000)">
									<p class="date-step phase-unactive"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png" alt="Upcoming work" title=""/>#i18n{portal.openpb.project.sheet.planning.work}</p>
								</xsl:when>
								
								<xsl:when test="($auj &lt; $date-step3) and (pb_project-phase3_date_deb != '')">
									<p class="date-step phase-unactive"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png" alt="Upcoming work" title=""/>#i18n{portal.openpb.project.sheet.planning.work}<br/><span style="color:#ffffff"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png"/>3. </span><span class="phase-beginning">(#i18n{portal.openpb.project.sheet.planning.expected_in} <xsl:value-of select="java:format(java:java.text.SimpleDateFormat.new('MMMM yyyy'), $dtStep3 )" />)</span></p>
								</xsl:when>
								
								<xsl:otherwise>
									<p class="date-step phase-unactive"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png" alt="Not started work" title=""/>#i18n{portal.openpb.project.sheet.planning.work}</p>
								</xsl:otherwise>
							</xsl:choose>
						
							<!-- <xsl:value-of select="pb_project-phase4_date_deb" /> -->
							<xsl:choose>
								<xsl:when test="($auj &gt;= $date-step4f) and (pb_project-phase4_date_deb = '')">
									<p class="date-step phase-active"><img src="images/local/skin/plugins/plugin-participatorybudget/check.png" alt="Completed !" title=""/>#i18n{portal.openpb.project.sheet.planning.delivery.completed}</p>
								</xsl:when>
								<xsl:when test="($auj &gt;= $date-step4f)">
									<p class="date-step phase-active"><img src="images/local/skin/plugins/plugin-participatorybudget/check.png" alt="Completed !" title=""/>#i18n{portal.openpb.project.sheet.planning.delivery.completed}<br/><span style="color:#ffffff"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png"/>4. </span><span class="phase-beginning">(#i18n{portal.openpb.project.sheet.planning.delivered_in} <xsl:value-of select="java:format(java:java.text.SimpleDateFormat.new('MMMM yyyy'), $dtStep4f )" />)</span></p>
								</xsl:when>
								
								<xsl:when test="($auj &lt; $date-step4f) and ($auj &gt;= $date-step4) and (pb_project-phase4_date_deb = '')">
									<p class="date-step phase-active"><img src="images/local/skin/plugins/plugin-participatorybudget/check-current.png" alt="Delivery in progress" title=""/>#i18n{portal.openpb.project.sheet.planning.delivery.in_progress}</p>
								</xsl:when>
								<xsl:when test="($auj &lt; $date-step4f) and ($auj &gt;= $date-step4)">
									<p class="date-step phase-active"><img src="images/local/skin/plugins/plugin-participatorybudget/check-current.png" alt="Delivery in progress" title=""/>#i18n{portal.openpb.project.sheet.planning.delivery.in_progress}<br/><span style="color:#ffffff"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png"/>3. </span><span class="phase-beginning">(#i18n{portal.openpb.project.sheet.planning.started_in } <xsl:value-of select="java:format(java:java.text.SimpleDateFormat.new('MMMM yyyy'), $dtStep4 )" />)</span></p>
								</xsl:when>
								
								<xsl:when test="($auj &lt; $date-step4) and ($date-step4 &gt; 20990000)">
									<p class="date-step phase-unactive"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png" alt="Upcoming delivery" title=""/>#i18n{portal.openpb.project.sheet.planning.delivery}</p>
								</xsl:when>
								
								<xsl:when test="($auj &lt; $date-step4) and (pb_project-phase4_date_deb != '')">
									<p class="date-step phase-unactive"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png" alt="Upcoming delivery" title=""/>#i18n{portal.openpb.project.sheet.planning.delivery}<br/><span style="color:#ffffff"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png"/>4. </span><span class="phase-beginning">(#i18n{portal.openpb.project.sheet.planning.expected_in} <xsl:value-of select="java:format(java:java.text.SimpleDateFormat.new('MMMM yyyy'), $dtStep4 )" />)</span></p>
								</xsl:when>
								
								<xsl:otherwise>
									<p class="date-step phase-unactive"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png" alt="Livraison non démarrée" title=""/>#i18n{portal.openpb.project.sheet.planning.delivery}</p>
								</xsl:otherwise>
							</xsl:choose>
							
							<!-- <xsl:value-of select="pb_project-phase4_date_fin" /> -->
						
						</div>
					</xsl:if>

					<!-- Origin of the project -->
					<!-- Propositions source ; fonctionnement différent entre les projets des campagnes avant 2016 et à partir de 2016 (regroupements) -->
					<div class="psoum-data-origin separator-horiz-4px">
						<h2>#i18n{portal.openpb.project.sheet.origin}</h2>

						<xsl:choose> 
							<div id="project-elaboration">
							</div>
						</xsl:choose> 
					</div>
						
				</div>
				
			</div>
			
		</div>
		
	</xsl:template>

	<xsl:template match="file-resource">
		<xsl:choose>
			<xsl:when test="(resource-content-type='image/jpeg' or resource-content-type='image/jpg' or  resource-content-type='image/pjpeg' or resource-content-type='image/gif' or resource-content-type='image/png')" >
				<img src="document?id={resource-document-id}&amp;id_attribute={resource-attribute-id}"  alt="" title="" class="img-responsive" />
			</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>
