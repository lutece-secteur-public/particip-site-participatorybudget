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
								<h3 class="text-center text-warning"> <i class="fa fa-warning"></i> Attention !</h3>
								<p class="text-center">Ce projet n'est pas disponible.</p>
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
					<a href="http://www.facebook.com" data-action="facebook-action" data-title="{document-title}" data-doc="{document-id}" class="share"  title="Partager sur Facebook">
					  <img src="images/local/skin/pastille-fb.png" alt="Partager sur Facebook" title="Partager sur Facebook"/>
					</a>
					<a href="http://www.twitter.com" data-action="twitter-action" data-title="{document-title}" data-doc="{document-id}" class="share" title="Partager sur Twitter" target="_blank">
					  <img src="images/local/skin/pastille-tw.png" alt="Partager sur Twitter" title="Partager sur Twitter"/>
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
				
					<!-- Localisation -->
					<div class="psoum-desc-localisation">
					
						<img alt="Localisation" title="Localisation">
							<xsl:attribute name="src">images/local/skin/marker-<xsl:value-of select="$theme"/>.png</xsl:attribute>
						</img>
					
						<div class="psoum-desc-localisation-addr">
							<xsl:if test="not(string(pb_project-lieu)='')"><xsl:value-of select="pb_project-lieu" /><br /></xsl:if>
							<xsl:value-of select="pb_project-localisation" />
						</div>
					</div>
					
					<!-- Titre -->
					<div class="psoum-desc-titre">
						<h1>
							<xsl:choose>
								<xsl:when test="not(string(pb_project-code_projet)='') and (string(pb_project-statut_project)='SOUMIS')">
									<p class="num-project"><xsl:variable name="ordre" select="pb_project-code_projet"></xsl:variable><span>Projet n° <xsl:value-of select='format-number($ordre, "##")' /></span></p>
								</xsl:when>
								<xsl:otherwise>
									<p class="num-project">&#160;</p> <!-- To keep margin between localisation and title divs -->
								</xsl:otherwise>
							</xsl:choose>
							<p><xsl:value-of select="document-title" /></p>
						</h1>
					</div>
					
					<!-- Sous-titre -->
					<div class="psoum-desc-soustitre">
						<xsl:if test="not(string(pb_project-sous_titre)='')">
							<h2>
								<p><xsl:value-of select="pb_project-sous_titre" /></p>
							</h2>
						</xsl:if>
					</div>
					
					<!-- Projet livré (uniquement en format XS) -->
					<xsl:if test="($auj &gt; $date-step4f)">
						<div>
							<xsl:attribute name="class">psoum-desc-delivered visible-xs visible-sm bgcolor-theme-<xsl:value-of select="$theme"/></xsl:attribute>
							Réalisé !
						</div>
					</xsl:if>

					<!-- Projet abandonné (uniquement en format XS) -->
					<xsl:if test="string(pb_project-statut_eudo)='Abandonné'">
						<div>
							<xsl:attribute name="class">psoum-desc-undeliverable visible-xs visible-sm bgcolor-theme-<xsl:value-of select="$theme"/></xsl:attribute>
							Projet non réalisable
						</div>
					</xsl:if>

					<!-- Image : spécifique au document courant ou générale à la thématique -->
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
					
					<!-- Description textuelle du projet -->
					<h2>
						<xsl:attribute name="class">color-theme-<xsl:value-of select="$theme"/></xsl:attribute>
						Le projet
					</h2>
					<div>
						<xsl:attribute name="class">psoum-desc-txt</xsl:attribute>
						<xsl:value-of disable-output-escaping="yes" select="pb_project-description" />
					</div>
					
					<!-- Cartographie du projet -->
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

					<!-- Avancement du projet -->
					<xsl:if test="(string(pb_project-statut_project)='SUIVI' or string(pb_project-statut_project)='suivi') and (pb_project-content != '')">
						<h2>
							<xsl:attribute name="class">color-theme-<xsl:value-of select="$theme"/></xsl:attribute>
							<a id="avct"></a>
							Où en est-on ?
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
				
					<!-- Div uniquement visible en XS pour afficher une ligne horizontale de séparation -->
					<div class="psoum-data-sep visible-xs"/>
				
					<!-- Projet livré -->
					<xsl:if test="($auj &gt; $date-step4f)">
						<div>
							<xsl:attribute name="class">psoum-data-delivered hidden-xs hidden-sm bgcolor-theme-<xsl:value-of select="$theme"/></xsl:attribute>
							Réalisé !
						</div>
					</xsl:if>
					
					<!-- Projet abandonné -->
					<xsl:if test="string(pb_project-statut_eudo)='Abandonné'">
						<div>
							<xsl:attribute name="class">psoum-data-undeliverable hidden-xs hidden-sm bgcolor-theme-<xsl:value-of select="$theme"/></xsl:attribute>
							Projet non réalisable
						</div>
					</xsl:if>
					
					<div id="psoum-data-header">
						
						<!-- Pastille QP et RATP -->
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

					</div>
						
					<!-- Bouton de vote. Le HTML du bouton de favori est en base de données (table = core-template, templatename = extend_follow). -->
					<div id="title-{document-id}" title="{document-title}" style="display:none;">.</div>
					<div id="vote">&#160;</div>		<!-- Extend : vote -->

					<!-- Quelques données -->
					<h2>Le projet</h2>
					
					<!-- Edition du BP -->
					<div class="psoum-data-kv">
						<div class="psoum-data-key">
							<img alt="Campagne" title="Campagne">
								<xsl:attribute name="src">images/local/skin/logo_paris_bp_ultramini-<xsl:value-of select="$theme"/>.png</xsl:attribute>
							</img>
						</div>
						<div class="psoum-data-value">
							<xsl:value-of select="pb_project-campagne" />
						</div>
					</div>
					
					<!-- Résultat du vote -->
					<div class="psoum-data-kv">
						<xsl:choose>
							<xsl:when test="(string(pb_project-statut_project)='GAGNANT') or (string(pb_project-statut_project)='SUIVI')">
								<div class="psoum-data-key">
									<img alt="Résultat du vote" title="Résultat du vote">
										<xsl:attribute name="src">images/local/skin/trophy-<xsl:value-of select="$theme"/>.png</xsl:attribute>
									</img>
								</div>
								<div class="psoum-data-value">
									<xsl:variable name="nb_votes" select="pb_project-nombre_de_votes"></xsl:variable>
									Projet lauréat avec <xsl:value-of select='format-number($nb_votes, "# ###", "space")' /> votes !
								</div>
							</xsl:when>
							<xsl:when test="(string(pb_project-statut_project)='PERDANT') or (string(pb_project-statut_project)='NON_SUIVI')">
								<div class="psoum-data-key">
									<img src="images/local/skin/trophy-empty.png" alt="Résultat du vote" title="Résultat du vote"/>
								</div>
								<div class="psoum-data-value">
									<xsl:variable name="nb_votes" select="pb_project-nombre_de_votes"></xsl:variable>
									Projet non lauréat, <xsl:value-of select='format-number($nb_votes, "# ###", "space")' /> votes
								</div>
							</xsl:when>
						</xsl:choose>
					</div>
					

					<!-- Coût -->
					<xsl:if test="not(string(pb_project-budget)='')">
						<div class="psoum-data-kv last">
							<div class="psoum-data-key">
								<img alt="Coût" title="Coût">
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

					<!-- Cartographie du projet -->
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

					<!-- Boutons de mise en favori. Le HTML du bouton de favori est en base de données (table = core-template, templatename = extend_follow). -->
					<xsl:if test="string(pb_project-statut_eudo)!='Abandonné'">
						<div id="fav">&#160;</div>		<!-- Extend : favorite -->
						<div id="follow">&#160;</div>	<!-- Extend : follow -->
					</xsl:if>

					<!-- Planning : en gris si non démarré, en noir si démarré, en noir avec check si fini -->
					<xsl:if test="(string(pb_project-statut_project)='SUIVI' or string(pb_project-statut_project)='suivi') and (string(pb_project-statut_eudo)!='Abandonné')">
						<div class="psoum-data-planning separator-horiz-4px">
						
							<h2>Planning</h2>
	
							<!-- Principe d'affichage des dates :
									Phase non démarrée : marquée 'unactive'
									Phase démarrée     : marquée   'active'                 + date de démarrage
									Phase Achevée      : marquée   'active' + icône 'check' + date de démarrage (sauf phase 4 : date de fin) -->
							
							<!-- <xsl:value-of select="pb_project-phase1_date_deb" /> -->
							<xsl:choose>
								<xsl:when test="($auj &gt;= $date-step2) and (pb_project-phase1_date_deb = '')">
									<p class="date-step phase-active"><img src="images/local/skin/plugins/plugin-participatorybudget/check.png" alt="Études terminées" title=""/>1. Études et conception</p>
								</xsl:when>
								<xsl:when test="($auj &gt;= $date-step2)">
									<p class="date-step phase-active"><img src="images/local/skin/plugins/plugin-participatorybudget/check.png" alt="Études terminées" title=""/>1. Études et conception<br/><span style="color:#ffffff"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png"/>1. </span><span class="phase-beginning">(démarrées en <xsl:value-of select="java:format(java:java.text.SimpleDateFormat.new('MMMM yyyy'), $dtStep1 )" />)</span></p>
								</xsl:when>
							
								<xsl:when test="($auj &lt; $date-step2) and ($auj &gt;= $date-step1) and (pb_project-phase1_date_deb = '')">
									<p class="date-step phase-active"><img src="images/local/skin/plugins/plugin-participatorybudget/check-current.png" alt="Études en cours" title=""/>1. Études et conception</p>
								</xsl:when>
								<xsl:when test="($auj &lt; $date-step2) and ($auj &gt;= $date-step1)">
									<p class="date-step phase-active"><img src="images/local/skin/plugins/plugin-participatorybudget/check-current.png" alt="Études en cours" title=""/>1. Études et conception<br/><span style="color:#ffffff"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png"/>1. </span><span class="phase-beginning">(démarrées en <xsl:value-of select="java:format(java:java.text.SimpleDateFormat.new('MMMM yyyy'), $dtStep1 )" />)</span></p>
								</xsl:when>

								<xsl:when test="($auj &lt; $date-step1) and ($date-step1 &gt; 20990000)">
									<p class="date-step phase-unactive"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png" alt="Études à venir" title=""/>1. Études et conception</p>
								</xsl:when>

								<xsl:when test="($auj &lt; $date-step1) and (pb_project-phase1_date_deb != '')">
									<p class="date-step phase-unactive"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png" alt="Études à venir" title=""/>1. Études et conception<br/><span style="color:#ffffff"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png"/>1. </span><span class="phase-beginning">(prévues en <xsl:value-of select="java:format(java:java.text.SimpleDateFormat.new('MMMM yyyy'), $dtStep1 )" />)</span></p>
								</xsl:when>

								<xsl:otherwise>
									<p>Projet en cours de démarrage.</p>
									<p class="date-step phase-unactive"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png" alt="Études non démarrées" title=""/>1. Études et conception</p>
								</xsl:otherwise>
							</xsl:choose>
						
							<!-- <xsl:value-of select="pb_project-phase2_date_deb" /> -->
							<xsl:choose>
								<xsl:when test="($auj &gt;= $date-step3) and (pb_project-phase2_date_deb = '')">
									<p class="date-step phase-active"><img src="images/local/skin/plugins/plugin-participatorybudget/check.png" alt="Procédures terminées" title=""/>2. Lancement des procédures</p>
								</xsl:when>
								<xsl:when test="($auj &gt;= $date-step3)">
									<p class="date-step phase-active"><img src="images/local/skin/plugins/plugin-participatorybudget/check.png" alt="Procédures terminées" title=""/>2. Lancement des procédures<br/><span style="color:#ffffff"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png"/>2. </span><span class="phase-beginning">(démarré en <xsl:value-of select="java:format(java:java.text.SimpleDateFormat.new('MMMM yyyy'), $dtStep2 )" />)</span></p>
								</xsl:when>

								<xsl:when test="($auj &lt; $date-step3) and ($auj &gt;= $date-step2) and (pb_project-phase2_date_deb = '')">
									<p class="date-step phase-active"><img src="images/local/skin/plugins/plugin-participatorybudget/check-current.png" alt="Procédures en cours" title=""/>2. Lancement des procédures</p>
								</xsl:when>
								<xsl:when test="($auj &lt; $date-step3) and ($auj &gt;= $date-step2)">
									<p class="date-step phase-active"><img src="images/local/skin/plugins/plugin-participatorybudget/check-current.png" alt="Procédures en cours" title=""/>2. Lancement des procédures<br/><span style="color:#ffffff"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png"/>2. </span><span class="phase-beginning">(démarré en <xsl:value-of select="java:format(java:java.text.SimpleDateFormat.new('MMMM yyyy'), $dtStep2 )" />)</span></p>
								</xsl:when>

								<xsl:when test="($auj &lt; $date-step2) and ($date-step2 &gt; 20990000)">
									<p class="date-step phase-unactive"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png" alt="Procédures à venir" title=""/>2. Lancement des procédures</p>
								</xsl:when>

								<xsl:when test="($auj &lt; $date-step2) and (pb_project-phase2_date_deb != '')">
									<p class="date-step phase-unactive"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png" alt="Procédures à venir" title=""/>2. Lancement des procédures<br/><span style="color:#ffffff"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png"/>2. </span><span class="phase-beginning">(prévu en <xsl:value-of select="java:format(java:java.text.SimpleDateFormat.new('MMMM yyyy'), $dtStep2 )" />)</span></p>
								</xsl:when>

								<xsl:otherwise>
									<p class="date-step phase-unactive"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png" alt="Procédures non démarrées" title=""/>2. Lancement des procédures</p>
								</xsl:otherwise>
							</xsl:choose>
						
							<!-- <xsl:value-of select="pb_project-phase3_date_deb" /> -->
							<xsl:choose>
								<xsl:when test="($auj &gt;= $date-step4) and (pb_project-phase3_date_deb = '')">
									<p class="date-step phase-active"><img src="images/local/skin/plugins/plugin-participatorybudget/check.png" alt="Travaux terminés" title=""/>3. Réalisation des travaux</p>
								</xsl:when>
								<xsl:when test="($auj &gt;= $date-step4)">
									<p class="date-step phase-active"><img src="images/local/skin/plugins/plugin-participatorybudget/check.png" alt="Travaux terminés" title=""/>3. Réalisation des travaux<br/><span style="color:#ffffff"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png"/>3. </span><span class="phase-beginning">(démarrée en <xsl:value-of select="java:format(java:java.text.SimpleDateFormat.new('MMMM yyyy'), $dtStep3 )" />)</span></p>
								</xsl:when>
								
								<xsl:when test="($auj &lt; $date-step4) and ($auj &gt;= $date-step3) and (pb_project-phase3_date_deb = '')">
									<p class="date-step phase-active"><img src="images/local/skin/plugins/plugin-participatorybudget/check-current.png" alt="Travaux en cours" title=""/>3. Réalisation des travaux</p>
								</xsl:when>
								<xsl:when test="($auj &lt; $date-step4) and ($auj &gt;= $date-step3)">
									<p class="date-step phase-active"><img src="images/local/skin/plugins/plugin-participatorybudget/check-current.png" alt="Travaux en cours" title=""/>3. Réalisation des travaux<br/><span style="color:#ffffff"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png"/>3. </span><span class="phase-beginning">(démarrée en <xsl:value-of select="java:format(java:java.text.SimpleDateFormat.new('MMMM yyyy'), $dtStep3 )" />)</span></p>
								</xsl:when>
								
								<xsl:when test="($auj &lt; $date-step3) and ($date-step3 &gt; 20990000)">
									<p class="date-step phase-unactive"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png" alt="Travaux à venir" title=""/>3. Réalisation des travaux</p>
								</xsl:when>
								
								<xsl:when test="($auj &lt; $date-step3) and (pb_project-phase3_date_deb != '')">
									<p class="date-step phase-unactive"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png" alt="Travaux à venir" title=""/>3. Réalisation des travaux<br/><span style="color:#ffffff"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png"/>3. </span><span class="phase-beginning">(prévue en <xsl:value-of select="java:format(java:java.text.SimpleDateFormat.new('MMMM yyyy'), $dtStep3 )" />)</span></p>
								</xsl:when>
								
								<xsl:otherwise>
									<p class="date-step phase-unactive"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png" alt="Travaux non démarrés" title=""/>3. Réalisation des travaux</p>
								</xsl:otherwise>
							</xsl:choose>
						
							<!-- <xsl:value-of select="pb_project-phase4_date_deb" /> -->
							<xsl:choose>
								<xsl:when test="($auj &gt;= $date-step4f) and (pb_project-phase4_date_deb = '')">
									<p class="date-step phase-active"><img src="images/local/skin/plugins/plugin-participatorybudget/check.png" alt="Réalisé !" title=""/>4. Réalisé !</p>
								</xsl:when>
								<xsl:when test="($auj &gt;= $date-step4f)">
									<p class="date-step phase-active"><img src="images/local/skin/plugins/plugin-participatorybudget/check.png" alt="Réalisé !" title=""/>4. Réalisé !<br/><span style="color:#ffffff"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png"/>4. </span><span class="phase-beginning">(livré en <xsl:value-of select="java:format(java:java.text.SimpleDateFormat.new('MMMM yyyy'), $dtStep4f )" />)</span></p>
								</xsl:when>
								
								<xsl:when test="($auj &lt; $date-step4f) and ($auj &gt;= $date-step4) and (pb_project-phase4_date_deb = '')">
									<p class="date-step phase-active"><img src="images/local/skin/plugins/plugin-participatorybudget/check-current.png" alt="Livraison en cours" title=""/>4. En cours de livraison</p>
								</xsl:when>
								<xsl:when test="($auj &lt; $date-step4f) and ($auj &gt;= $date-step4)">
									<p class="date-step phase-active"><img src="images/local/skin/plugins/plugin-participatorybudget/check-current.png" alt="Livraison en cours" title=""/>4. En cours de livraison<br/><span style="color:#ffffff"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png"/>3. </span><span class="phase-beginning">(démarrée en <xsl:value-of select="java:format(java:java.text.SimpleDateFormat.new('MMMM yyyy'), $dtStep4 )" />)</span></p>
								</xsl:when>
								
								<xsl:when test="($auj &lt; $date-step4) and ($date-step4 &gt; 20990000)">
									<p class="date-step phase-unactive"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png" alt="Livraison à venir" title=""/>4. Livraison</p>
								</xsl:when>
								
								<xsl:when test="($auj &lt; $date-step4) and (pb_project-phase4_date_deb != '')">
									<p class="date-step phase-unactive"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png" alt="Livraison à venir" title=""/>4. Livraison<br/><span style="color:#ffffff"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png"/>4. </span><span class="phase-beginning">(prévue en <xsl:value-of select="java:format(java:java.text.SimpleDateFormat.new('MMMM yyyy'), $dtStep4 )" />)</span></p>
								</xsl:when>
								
								<xsl:otherwise>
									<p class="date-step phase-unactive"><img src="images/local/skin/plugins/plugin-participatorybudget/check-empty.png" alt="Livraison non démarrée" title=""/>4. Livraison</p>
								</xsl:otherwise>
							</xsl:choose>
							
							<!-- <xsl:value-of select="pb_project-phase4_date_fin" /> -->
						
						</div>
					</xsl:if>

					<!-- Origine du projet -->
					<!-- Propositions source ; fonctionnement différent entre les projets des campagnes avant 2016 et à partir de 2016 (regroupements) -->
					<div class="psoum-data-origin separator-horiz-4px">
						<h2>Origine du projet</h2>

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
