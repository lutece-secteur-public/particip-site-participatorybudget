<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:java="http://xml.apache.org/xslt/java" exclude-result-prefixes="java">
  <!--
   	How to display the publication date :
   	<xsl:value-of select="$publication-date" />
  -->
  <xsl:output method="html" indent="yes"/>
	<xsl:decimal-format name="space" grouping-separator=" "></xsl:decimal-format>

	<xsl:template match="content">
		<xsl:apply-templates select="project_2015"/>
	</xsl:template>
	
	<xsl:template match="project_2015">
		<xsl:choose>
          	<xsl:when test="string(project_2015-statut_project)!='SUIVI' and string(project_2015-statut_project)!='suivi'">
				<div class="row">
					<div class="col-xs-12 col-sm-12" id="project2015_print_new">
						<h1>
							<xsl:if test="not(string(project_2015-code_projet)='')">
								<xsl:variable name="ordre" select="project_2015-code_projet"></xsl:variable>
								<span style="font-size:20px;text-transform:none"> Projet n° <xsl:value-of select='format-number($ordre, "##")' /></span>
								<br/>
							</xsl:if>

							<xsl:attribute name="id">title-<xsl:value-of select="document-id" /></xsl:attribute> 
							<xsl:value-of select="document-title" />
						</h1>
					</div>
				</div>
				<div id="project-info_new" class="row">
					<div class="col-xs-12 col-sm-8">
						<div class="project_image">
							<xsl:if test="not(string(project_2015-pop_district)='')">
								<img class="img-qp" src="images/local/skin/quartier-populaire.png" alt="Quartier Populaire" />
							</xsl:if>
							<xsl:choose>
								<xsl:when test="project_2015-image!=''">
										<xsl:value-of disable-output-escaping="yes" select="project_2015-image" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:if test="not(string(project_2015-thematique)='')">
										<xsl:choose>
											<xsl:when test="(project_2015-thematique='Cadre de vie')" ><img src="images/local/skin/i_cadre_vie_wide.jpg"/></xsl:when>
											<xsl:when test="(project_2015-thematique='Culture')" ><img src="images/local/skin/i_culture_wide.jpg"/></xsl:when>
											<xsl:when test="(project_2015-thematique='Culture et patrimoine')" ><img src="images/local/skin/i_culture_wide.jpg"/></xsl:when>
											<xsl:when test="(project_2015-thematique='Economie et emploi')" ><img src="images/local/skin/i_economie_wide.jpg"/></xsl:when>
											<xsl:when test="(project_2015-thematique='Education et jeunesse')" ><img src="images/local/skin/i_jeunesse_wide.jpg"/></xsl:when>
											<xsl:when test="(project_2015-thematique='Environnement')" ><img src="images/local/skin/i_environnement_wide.jpg"/></xsl:when>
											<xsl:when test="(project_2015-thematique='Logement et habitat')" ><img src="images/local/skin/i_logement_wide.jpg"/></xsl:when>
											<xsl:when test="(project_2015-thematique='Nature en ville')" ><img src="images/local/skin/i_Nature en ville_wide.jpg"/></xsl:when>
											<xsl:when test="(project_2015-thematique='Participation citoyenne')" ><img src="images/local/skin/i_participation_citoyenne_wide.jpg"/></xsl:when>
											<xsl:when test="(project_2015-thematique='Propreté')" ><img src="images/local/skin/i_proprete_wide.jpg"/></xsl:when>
											<xsl:when test="(project_2015-thematique='Prévention et sécurité')" ><img src="images/local/skin/i_securite_wide.jpg"/></xsl:when>
											<xsl:when test="(project_2015-thematique='Santé')" ><img src="images/local/skin/i_sante_wide.jpg"/></xsl:when>
											<xsl:when test="(project_2015-thematique='Solidarité')" ><img src="images/local/skin/i_solidarites_wide.jpg"/></xsl:when>
											<xsl:when test="(project_2015-thematique='Solidarité')" ><img src="images/local/skin/i_solidarites_wide.jpg"/></xsl:when>
											<xsl:when test="(project_2015-thematique='Solidarité et cohésion sociale')" ><img src="images/local/skin/i_solidarites_wide.jpg"/></xsl:when>
											<xsl:when test="(project_2015-thematique='Solidarité et cohésion sociale ')" ><img src="images/local/skin/i_solidarites_wide.jpg"/></xsl:when>
											<xsl:when test="(project_2015-thematique='Sport')" ><img src="images/local/skin/i_sport_wide.jpg"/></xsl:when>
											<xsl:when test="(project_2015-thematique='Transport et mobilité')" ><img src="images/local/skin/i_transport_wide.jpg"/></xsl:when>
											<xsl:when test="(project_2015-thematique='Ville intelligente et numérique')" ><img src="images/local/skin/i_ville_intelligente_wide.jpg"/></xsl:when>
											<xsl:when test="(project_2015-thematique='Vivre ensemble')" ><img src="images/local/skin/i_solidarites_wide.jpg"/></xsl:when>
											<xsl:otherwise><img src="images/local/skin/default_illustration.jpg"/></xsl:otherwise>
										</xsl:choose>
									</xsl:if>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<div class="col-xs-12 col-sm-4 hidden-print">
					  <div class="project-data info">
					  <xsl:comment>
						<!-- JPO, 21/09 : suppression temporaire de l'icone "favoris" pendant la période de vote -->
						<xsl:text disable-output-escaping="yes">@Extender[</xsl:text><xsl:value-of disable-output-escaping="yes" select="document-id" /><xsl:text disable-output-escaping="yes">,document,follow,{show:"favtag"}]@</xsl:text> 
						</xsl:comment>
						<xsl:if test="not(string(project_2015-thematique)='')">
							<xsl:variable name="code-theme">
								<xsl:choose>
									<xsl:when test="(project_2015-thematique='Cadre de vie')" ><xsl:text>i_cadre_vie_1.png</xsl:text></xsl:when>
									<xsl:when test="(project_2015-thematique='Culture')" ><xsl:text>i_culture_1.png</xsl:text></xsl:when>
									<xsl:when test="(project_2015-thematique='Culture et patrimoine')" ><xsl:text>i_culture_1.png</xsl:text></xsl:when>
									<xsl:when test="(project_2015-thematique='Economie et emploi')" ><xsl:text>i_economie_1.png</xsl:text></xsl:when>
									<xsl:when test="(project_2015-thematique='Education et jeunesse')" ><xsl:text>i_jeunesse_1.png</xsl:text></xsl:when>
									<xsl:when test="(project_2015-thematique='Environnement')" ><xsl:text>i_environnement_1.png</xsl:text></xsl:when>
									<xsl:when test="(project_2015-thematique='Logement et habitat')" ><xsl:text>i_logement_1.png</xsl:text></xsl:when>
									<xsl:when test="(project_2015-thematique='Nature en ville')" ><xsl:text>i_Nature en ville_1.png</xsl:text></xsl:when>
									<xsl:when test="(project_2015-thematique='Participation citoyenne')" ><xsl:text>i_participation_citoyenne_1.png</xsl:text></xsl:when>
									<xsl:when test="(project_2015-thematique='Propreté')" ><xsl:text>i_proprete_1.png</xsl:text></xsl:when>
									<xsl:when test="(project_2015-thematique='Prévention et sécurité')" ><xsl:text>i_securite_1.png</xsl:text></xsl:when>
									<xsl:when test="(project_2015-thematique='Santé')" ><xsl:text>i_sante_1.png</xsl:text></xsl:when>
									<xsl:when test="(project_2015-thematique='Solidarité')" ><xsl:text>i_solidarites_1.png</xsl:text></xsl:when>
									<xsl:when test="(project_2015-thematique='Solidarité et cohésion sociale')" ><xsl:text>i_solidarites_1.png</xsl:text></xsl:when>
									<xsl:when test="(project_2015-thematique='Solidarité et cohésion sociale ')" ><xsl:text>i_solidarites_1.png</xsl:text></xsl:when>
									<xsl:when test="(project_2015-thematique='Sport')" ><xsl:text>i_sport_1.png</xsl:text></xsl:when>
									<xsl:when test="(project_2015-thematique='Transport et mobilité')" ><xsl:text>i_transport_1.png</xsl:text></xsl:when>
									<xsl:when test="(project_2015-thematique='Ville intelligente et numérique')" ><xsl:text>i_ville_intelligente_1.png</xsl:text></xsl:when>
									<xsl:when test="(project_2015-thematique='Vivre ensemble')" ><xsl:text>i_solidarites_1.png</xsl:text></xsl:when>
									<xsl:otherwise><xsl:text>i_participation_citoyenne_1.png</xsl:text></xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<p>
								<img src="images/local/skin/{$code-theme}" alt="Thématique" title="Thématique" />
								<xsl:value-of select="project_2015-thematique" />
							</p>
								<input type="hidden" name="Localisation_{document-id}" id="localisation_{document-id}" value="{project_2015-localisation}"/>
								<input type="hidden" name="title_{document-id}" id="title_{document-id}" value="{document-title}"/>
								<input type="hidden" name="thematique_{document-id}" id="thematique_{document-id}" value="{project_2015-thematique}"/>
						</xsl:if>
						<xsl:if test="not(string(project_2015-localisation)='')">
							<p>
								<xsl:if test="not(string(project_2015-lieu)='')"><xsl:value-of select="project_2015-lieu" /><br /></xsl:if>
									<img src="images/local/skin/marker_1.png" alt="Localisation" title="Localisation" />
								<xsl:value-of select="project_2015-localisation" />
							</p>
						</xsl:if>
						<xsl:if test="not(string(project_2015-budget)='')">
							<p>
								<img src="images/local/skin/money.png" alt="Coût" title="Coût" />
								<xsl:variable name="budget" select="project_2015-budget"></xsl:variable>
								<xsl:value-of select='format-number($budget, "# ###", "space")' /> €
							</p>
						</xsl:if>

						<xsl:if test="string(project_2015-statut_project)='GAGNANT'">
							<h3 style="color:#3EAE71;margin-left:15px;font-size:3rem;">
								<strong>Projet gagnant<br/>avec <xsl:value-of select="project_2015-nombre_de_votes" /> votes !</strong>
							</h3>
						</xsl:if>

						<xsl:if test="string(project_2015-statut_project)='PERDANT'">
							<p>
								<xsl:value-of select="project_2015-nombre_de_votes" /> votes
							</p>
						</xsl:if>

						<div id="fav">&#160;</div>
						<div id="vote">&#160;</div>
						</div>
					</div>
				</div>
				<div class="row">
					<article id="article_project_new" class="col-xs-12 col-sm-8 hidden-print">
						<div class="project-description">
						<xsl:value-of disable-output-escaping="yes" select="project_2015-description" />
						<xsl:if test="project_2015-phase1_date_deb != '' ">
						  <div id="planning">
							<h2>Planning estimé</h2>
							<xsl:variable name="auj" select="number(java:format(java:java.text.SimpleDateFormat.new('yyyyMMdd'), java:java.util.Date.new()))" />
							<p>
							  <span>
								<xsl:attribute name="class">step
								<xsl:if test="project_2015-phase1_date_deb != '' ">
								  <xsl:variable name="dtStep1" select="java:parse(java:java.text.SimpleDateFormat.new('dd/MM/yyyy'), project_2015-phase1_date_deb )" />
								  <xsl:variable name="date-step1" select="number( java:format(java:java.text.SimpleDateFormat.new('yyyyMMdd'), $dtStep1 ))" />
								  <xsl:if test="($auj - $date-step1) &gt; 0"> active</xsl:if>
								</xsl:if>
								</xsl:attribute> Etudes et conception
							  </span>
							  <span>
								<xsl:attribute name="class">step
								<xsl:if test="project_2015-phase2_date_deb != '' ">
								  <xsl:variable name="dtStep2" select="java:parse(java:java.text.SimpleDateFormat.new('dd/MM/yyyy'), project_2015-phase2_date_deb )" />
								  <xsl:variable name="date-step2" select="number( java:format(java:java.text.SimpleDateFormat.new('yyyyMMdd'), $dtStep2 ))" />
								  <xsl:if test="($auj - $date-step2) &gt; 0"> active</xsl:if>
								</xsl:if>
								</xsl:attribute> Lancement des procédures
							  </span>
							  <span>
								<xsl:attribute name="class">step
								<xsl:if test="project_2015-phase3_date_deb != '' ">
								  <xsl:variable name="dtStep3" select="java:parse(java:java.text.SimpleDateFormat.new('dd/MM/yyyy'), project_2015-phase3_date_deb )" />
								  <xsl:variable name="date-step3" select="number( java:format(java:java.text.SimpleDateFormat.new('yyyyMMdd'), $dtStep3 ))" />
								  <xsl:if test="($auj - $date-step3) &gt; 0"> active</xsl:if>
								</xsl:if>
								</xsl:attribute> Réalisation des travaux
							  </span>
							  <span>
								<xsl:attribute name="class">step
								<xsl:if test="project_2015-phase4_date_deb != '' ">
								  <xsl:variable name="dtStep4" select="java:parse(java:java.text.SimpleDateFormat.new('dd/MM/yyyy'), project_2015-phase4_date_deb )" />
								  <xsl:variable name="date-step4" select="number( java:format(java:java.text.SimpleDateFormat.new('yyyyMMdd'), $dtStep4 ))" />
								<xsl:if test="project_2015-phase4_date_deb !=''"><xsl:if test="($auj - $date-step4) &gt; 0"> active</xsl:if></xsl:if>
								</xsl:if>
								</xsl:attribute> Livraison et inauguration
							  </span>
							</p>
							<p>
							  <span class="date-step">
							  <xsl:if test="project_2015-phase1_date_deb != '' ">
								<xsl:variable name="dtStep1" select="java:parse(java:java.text.SimpleDateFormat.new('dd/MM/yyyy'), project_2015-phase1_date_deb )" />
								<xsl:value-of select="java:format(java:java.text.SimpleDateFormat.new('MM/yyyy'), $dtStep1 )" />
							  </xsl:if>
							  </span>
							  <span class="date-step">
							  <xsl:if test="project_2015-phase2_date_deb != '' ">
								<xsl:variable name="dtStep2" select="java:parse(java:java.text.SimpleDateFormat.new('dd/MM/yyyy'), project_2015-phase2_date_deb )" />
								<xsl:value-of select="java:format(java:java.text.SimpleDateFormat.new('MM/yyyy'), $dtStep2 )" />
							  </xsl:if>
							  </span>
							  <span class="date-step">
							  <xsl:if test="project_2015-phase3_date_deb != '' ">
								<xsl:variable name="dtStep3" select="java:parse(java:java.text.SimpleDateFormat.new('dd/MM/yyyy'), project_2015-phase3_date_deb )" />
								<xsl:value-of select="java:format(java:java.text.SimpleDateFormat.new('MM/yyyy'), $dtStep3 )" />
							  </xsl:if>
							  </span>
							  <span class="date-step">
							  <xsl:if test="project_2015-phase4_date_deb != '' ">
								<xsl:variable name="dtStep4" select="java:parse(java:java.text.SimpleDateFormat.new('dd/MM/yyyy'), project_2015-phase4_date_deb )" />
								<xsl:value-of select="java:format(java:java.text.SimpleDateFormat.new('MM/yyyy'), $dtStep4 )" />
							  </xsl:if>
							  </span>
							  <span class="date-step">
							  <xsl:if test="project_2015-phase4_date_fin != '' ">
								<xsl:variable name="dtStep4f" select="java:parse(java:java.text.SimpleDateFormat.new('dd/MM/yyyy'), project_2015-phase4_date_fin )" />
								<xsl:value-of select="java:format(java:java.text.SimpleDateFormat.new('MM/yyyy'), $dtStep4f )" />
							  </xsl:if>
							  </span>
							</p>
						  </div>
						</xsl:if>
						<xsl:value-of disable-output-escaping="yes" select="project_2015-content" />
						</div>
					</article>
					<aside id="aside_project_new" class="col-xs-12 col-sm-4 hidden-print">
						<xsl:if test="project_2015-num_idea &lt;= 3502">
							<h2>Projet élaboré à partir de la proposition suivante :</h2>
						   <!--
						   <div class="project-data origin">
							<p><xsl:value-of disable-output-escaping="yes" select="project_2015-pseudos" /></p>
						  </div>
						  -->
							<ul class="list-unstyled">
								<li>
								<xsl:element name="a">
								  <xsl:attribute name="class">btn btn-link text-info</xsl:attribute>
								  <xsl:attribute name="href">jsp/site/Portal.jsp?page=proposal&amp;campaign=c&amp;proposal=<xsl:value-of select="project_2015-num_idea"/></xsl:attribute>
								   <xsl:value-of select="substring(project_2015-title_idea, 0,40) "/>…
								</xsl:element>
								</li>
							</ul>
						</xsl:if>
						<div id="project-elaboration">&#160;</div>
						<div id="project-sharing-buttons" class="hidden-print">
							<h2 class="title2">Je Partage ce projet !</h2>
							<a href="http://www.facebook.com" data-action="facebook-action" data-title="{document-title}" data-doc="{document-id}" class="share"  title="Partager sur Facebook">
							  <img src="images/local/skin/projet_logo_facebook.png" alt="Partager sur Facebook" title="Partager sur Facebook"/>
							</a>&#160;&#160;
							<a href="http://www.twitter.com" data-action="twitter-action" data-title="{document-title}" data-doc="{document-id}" class="share" title="Partager sur Twitter" target="_blank">
							  <img src="images/local/skin/projet_logo_twitter.png" alt="Partager sur Twitter" title="Partager sur Twitter"/>
							</a>&#160;&#160;
						</div>
					  <xsl:if test="not(string(project_2015-phase1_echeancier)='')">
					  <h2 class="project-data-title">ECHEANCIER</h2>
					  <div class="project-data echeance">
						<h3>ETUDES ET CONCEPTION <span class="pull-right"><xsl:value-of disable-output-escaping="yes" select="project_2015-phase1_date_deb " />&#160;-&#160;<xsl:value-of disable-output-escaping="yes" select="project_2015-phase2_date_deb " /></span></h3>
						<div id="etudes">
						  <xsl:value-of disable-output-escaping="yes" select="project_2015-phase1_echeancier" />
						</div>
						<xsl:if test="not(string(project_2015-phase2_echeancier)='')">
						  <hr/>
						  <h3>LANCEMENT DES PROCEDURES <span class="pull-right"><xsl:value-of disable-output-escaping="yes" select="project_2015-phase2_date_deb " />&#160;-&#160;<xsl:value-of disable-output-escaping="yes" select="project_2015-phase2_date_deb " /></span></h3>
						  <xsl:value-of disable-output-escaping="yes" select="project_2015-phase2_echeancier" />
						</xsl:if>
						<xsl:if test="not(string(project_2015-phase3_echeancier)='')">
						  <hr/>
						  <h3>REALISATION DES TRAVAUX <span class="pull-right"><xsl:value-of disable-output-escaping="yes" select="project_2015-phase3_date_deb " />&#160;-&#160;<xsl:value-of disable-output-escaping="yes" select="project_2015-phase4_date_deb " /></span></h3>
						  <xsl:value-of disable-output-escaping="yes" select="project_2015-phase3_echeancier" />
						</xsl:if>
						<xsl:if test="not(string(project_2015-phase4_echeancier)='')">
						  <hr/>
						  <h3>LIVRAISON ET INAUGURATION <span class="pull-right"><xsl:value-of disable-output-escaping="yes" select="project_2015-phase4_date_deb " />&#160;-&#160;<xsl:value-of disable-output-escaping="yes" select="project_2015-phase4_date_fin " /></span></h3>
						  <xsl:value-of disable-output-escaping="yes" select="project_2015-phase4_echeancier" />
						</xsl:if>
					  </div>
					</xsl:if>
					</aside>
				</div>
			</xsl:when>
			<xsl:otherwise>
				<div id="toolbar" class="row content-padding hidden-print">
					<div class="col-xs-12 col-sm-8">
						<a class="btn btn-include btn-small" title="Retour" href="jsp/site/Portal.jsp?page=search-solr&#38;conf=list_projects">
							<i class="fa fa-arrow-left"></i>
							<span class="hidden-xs hidden-sm">Retour aux projets</span>
						</a>
						&#160;
						<a href="javascript:window.print();" title="Imprimer" class="btn btn-include btn-small">
							<i class="fa fa-print"></i><span class="hidden-xs hidden-sm"> Imprimer</span>
						</a>
					</div>
					<div class="hidden-xs col-sm-4 project_social_share">
						<xsl:text disable-output-escaping="yes">@Extender[</xsl:text><xsl:value-of disable-output-escaping="yes" select="document-id" /><xsl:text disable-output-escaping="yes">,document,opengraph,{footer:false, header:false}]@</xsl:text> 
					</div>
				</div>
				<div class="content-padding row">
					<div class="col-xs-12 col-sm-offset-4 col-sm-8" id="campaign">
						<p><xsl:value-of select="project_2015-campaign" /></p>
				  </div>
				</div>
				<div class="content-padding row">
					<div class="col-xs-12 col-sm-offset-4 col-sm-8" id="project2015_print">
						<h1>
							<xsl:attribute name="id">title-<xsl:value-of select="document-id" /></xsl:attribute> 
							<xsl:value-of select="document-title" />
						</h1>
				  </div>
				</div>
				<div id="project-info" class="row">
					<aside class="col-xs-12 col-sm-4 col-md-4 col-lg-4 hidden-print">
						<div class="project-data info">
						<xsl:if test="not(string(project_2015-thematique)='')">
							<xsl:variable name="code-theme">
								<xsl:choose>
								<xsl:when test="(project_2015-thematique='Cadre de vie')" ><xsl:text>i_cadre_vie_1.png</xsl:text></xsl:when>
								<xsl:when test="(project_2015-thematique='Culture')" ><xsl:text>i_culture_1.png</xsl:text></xsl:when>
								<xsl:when test="(project_2015-thematique='Culture et patrimoine')" ><xsl:text>i_culture_1.png</xsl:text></xsl:when>
								<xsl:when test="(project_2015-thematique='Economie et emploi')" ><xsl:text>i_economie_1.png</xsl:text></xsl:when>
								<xsl:when test="(project_2015-thematique='Education et jeunesse')" ><xsl:text>i_jeunesse_1.png</xsl:text></xsl:when>
								<xsl:when test="(project_2015-thematique='Environnement')" ><xsl:text>i_environnement_1.png</xsl:text></xsl:when>
								<xsl:when test="(project_2015-thematique='Logement et habitat')" ><xsl:text>i_logement_1.png</xsl:text></xsl:when>
								<xsl:when test="(project_2015-thematique='Nature en ville')" ><xsl:text>i_Nature en ville_1.png</xsl:text></xsl:when>
								<xsl:when test="(project_2015-thematique='Participation citoyenne')" ><xsl:text>i_participation_citoyenne_1.png</xsl:text></xsl:when>
								<xsl:when test="(project_2015-thematique='Propreté')" ><xsl:text>i_proprete_1.png</xsl:text></xsl:when>
								<xsl:when test="(project_2015-thematique='Prévention et sécurité')" ><xsl:text>i_securite_1.png</xsl:text></xsl:when>
								<xsl:when test="(project_2015-thematique='Solidarité')" ><xsl:text>i_solidarites_1.png</xsl:text></xsl:when>
								<xsl:when test="(project_2015-thematique='Sport')" ><xsl:text>i_sport_1.png</xsl:text></xsl:when>
								<xsl:when test="(project_2015-thematique='Transport et mobilité')" ><xsl:text>i_transport_1.png</xsl:text></xsl:when>
								<xsl:when test="(project_2015-thematique='Ville intelligente et numérique')" ><xsl:text>i_ville_intelligente_1.png</xsl:text></xsl:when>
								<xsl:when test="(project_2015-thematique='Vivre ensemble')" ><xsl:text>i_solidarites_1.png</xsl:text></xsl:when>
									<xsl:otherwise><xsl:text>i_participation_citoyenne_1.png</xsl:text></xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<p>
							  <img src="images/local/skin/{$code-theme}" alt="Thématique" title="Thématique" />
							  <xsl:value-of select="project_2015-thematique" />
							</p>
						</xsl:if>
						<xsl:if test="not(string(project_2015-localisation)='')">
							<p>
							  <xsl:if test="not(string(project_2015-lieu)='')"><xsl:value-of select="project_2015-lieu" /><br /></xsl:if>
							  <img src="images/local/skin/marker_1.png" alt="Localisation" title="Localisation" />
								<xsl:value-of select="project_2015-localisation" /> 
							</p>
						</xsl:if>
						<xsl:if test="not(string(project_2015-budget)='')">
							<p>
								<img src="images/local/skin/money.png" alt="Coût" title="Coût" />
								<xsl:variable name="budget" select="project_2015-budget"></xsl:variable>
								<xsl:value-of select='format-number($budget, "# ###", "space")' /> €
							</p>
						</xsl:if>
						</div>
						<h2 class="project-data-title">
							<xsl:element name="a">
							  <xsl:attribute name="href"><xsl:value-of select="project_2015-url"/></xsl:attribute>
							   <xsl:value-of select="project_2015-title_idea"/>
							</xsl:element>
						</h2>	
						<xsl:if test="not(string(project_2015-phase1_echeancier)='')">
						<h2 class="project-data-title">ECHEANCIER</h2>
						<div class="project-data echeance">
						<h3>ETUDES ET CONCEPTION <span class="pull-right"><xsl:value-of disable-output-escaping="yes" select="project_2015-phase1_date_deb " />&#160;-&#160;<xsl:value-of disable-output-escaping="yes" select="project_2015-phase2_date_deb " /></span></h3>
						<div id="etudes">
							<xsl:value-of disable-output-escaping="yes" select="project_2015-phase1_echeancier" />
						</div>
						<xsl:if test="not(string(project_2015-phase2_echeancier)='')">
							<hr/>
							<h3>LANCEMENT DES PROCEDURES <span class="pull-right"><xsl:value-of disable-output-escaping="yes" select="project_2015-phase2_date_deb " />&#160;-&#160;<xsl:value-of disable-output-escaping="yes" select="project_2015-phase2_date_deb " /></span></h3>
							<xsl:value-of disable-output-escaping="yes" select="project_2015-phase2_echeancier" />
						</xsl:if>
						<xsl:if test="not(string(project_2015-phase3_echeancier)='')">
							<hr/>
							<h3>REALISATION DES TRAVAUX <span class="pull-right"><xsl:value-of disable-output-escaping="yes" select="project_2015-phase3_date_deb " />&#160;-&#160;<xsl:value-of disable-output-escaping="yes" select="project_2015-phase4_date_deb " /></span></h3>
							<xsl:value-of disable-output-escaping="yes" select="project_2015-phase3_echeancier" />
						</xsl:if>
						<xsl:if test="not(string(project_2015-phase4_echeancier)='')">
							<hr/>
							<h3>LIVRAISON ET INAUGURATION <span class="pull-right"><xsl:value-of disable-output-escaping="yes" select="project_2015-phase4_date_deb " />&#160;-&#160;<xsl:value-of disable-output-escaping="yes" select="project_2015-phase4_date_fin " /></span></h3>
							<xsl:value-of disable-output-escaping="yes" select="project_2015-phase4_echeancier" />
						</xsl:if>
						</div>
						</xsl:if>
					</aside>
					<article class="col-xs-12 col-sm-8 col-md-8 col-lg-8 hidden-print">
						<div class="project-description">
						<xsl:choose>
							<xsl:when test="project_2015-image!=''">
							<div class="project_image">
								<xsl:value-of disable-output-escaping="yes" select="project_2015-image" />
							</div>
							</xsl:when>
						</xsl:choose>
						<p>&#160;</p>
						<xsl:value-of disable-output-escaping="yes" select="project_2015-description" />
						<p>&#160;</p>
						<xsl:if test="project_2015-phase1_date_deb != '' ">
							<div id="planning">
								<h2>Planning estimé</h2>		
								<xsl:variable name="auj" select="number(java:format(java:java.text.SimpleDateFormat.new('yyyyMMdd'), java:java.util.Date.new()))" />
								<p>
									<span>
										<xsl:attribute name="class">step
										<xsl:if test="project_2015-phase1_date_deb != '' ">
											<xsl:variable name="dtStep1" select="java:parse(java:java.text.SimpleDateFormat.new('dd/MM/yyyy'), project_2015-phase1_date_deb )" />
											<xsl:variable name="date-step1" select="number( java:format(java:java.text.SimpleDateFormat.new('yyyyMMdd'), $dtStep1 ))" />
											<xsl:if test="($auj - $date-step1) &gt; 0"> active</xsl:if>
										</xsl:if>
										</xsl:attribute> Etudes et conception 
									</span>
									<span>
										<xsl:attribute name="class">step
										<xsl:if test="project_2015-phase2_date_deb != '' ">			
											<xsl:variable name="dtStep2" select="java:parse(java:java.text.SimpleDateFormat.new('dd/MM/yyyy'), project_2015-phase2_date_deb )" />
											<xsl:variable name="date-step2" select="number( java:format(java:java.text.SimpleDateFormat.new('yyyyMMdd'), $dtStep2 ))" />
											<xsl:if test="($auj - $date-step2) &gt; 0"> active</xsl:if>
										</xsl:if>
										</xsl:attribute> Lancement des procédures 
									</span>
									<span>
										<xsl:attribute name="class">step
										<xsl:if test="project_2015-phase3_date_deb != '' ">			
											<xsl:variable name="dtStep3" select="java:parse(java:java.text.SimpleDateFormat.new('dd/MM/yyyy'), project_2015-phase3_date_deb )" />
											<xsl:variable name="date-step3" select="number( java:format(java:java.text.SimpleDateFormat.new('yyyyMMdd'), $dtStep3 ))" />
											<xsl:if test="($auj - $date-step3) &gt; 0"> active</xsl:if>
										</xsl:if>
										</xsl:attribute> Réalisation des travaux 
									</span>
									<span>
										<xsl:attribute name="class">step	
										<xsl:if test="project_2015-phase4_date_deb != '' ">
											<xsl:variable name="dtStep4" select="java:parse(java:java.text.SimpleDateFormat.new('dd/MM/yyyy'), project_2015-phase4_date_deb )" />
											<xsl:variable name="date-step4" select="number( java:format(java:java.text.SimpleDateFormat.new('yyyyMMdd'), $dtStep4 ))" />
										<xsl:if test="project_2015-phase4_date_deb !=''"><xsl:if test="($auj - $date-step4) &gt; 0"> active</xsl:if></xsl:if>
										</xsl:if>
										</xsl:attribute> Livraison et inauguration 
									</span>	
								</p>
								<p>
								  <span class="date-step">
									<xsl:if test="project_2015-phase1_date_deb != '' ">
										<xsl:variable name="dtStep1" select="java:parse(java:java.text.SimpleDateFormat.new('dd/MM/yyyy'), project_2015-phase1_date_deb )" />
										<xsl:value-of select="java:format(java:java.text.SimpleDateFormat.new('MM/yyyy'), $dtStep1 )" />
									</xsl:if>
								  </span>
								  <span class="date-step">
									<xsl:if test="project_2015-phase2_date_deb != '' ">
										<xsl:variable name="dtStep2" select="java:parse(java:java.text.SimpleDateFormat.new('dd/MM/yyyy'), project_2015-phase2_date_deb )" />
										<xsl:value-of select="java:format(java:java.text.SimpleDateFormat.new('MM/yyyy'), $dtStep2 )" />
									</xsl:if>
								  </span>
								  <span class="date-step">
									<xsl:if test="project_2015-phase3_date_deb != '' ">
										<xsl:variable name="dtStep3" select="java:parse(java:java.text.SimpleDateFormat.new('dd/MM/yyyy'), project_2015-phase3_date_deb )" />
										<xsl:value-of select="java:format(java:java.text.SimpleDateFormat.new('MM/yyyy'), $dtStep3 )" />
									</xsl:if>
								  </span>
								  <span class="date-step">
									<xsl:if test="project_2015-phase4_date_deb != '' ">
										<xsl:variable name="dtStep4" select="java:parse(java:java.text.SimpleDateFormat.new('dd/MM/yyyy'), project_2015-phase4_date_deb )" />
										<xsl:value-of select="java:format(java:java.text.SimpleDateFormat.new('MM/yyyy'), $dtStep4 )" />
									</xsl:if>
								  </span>
								  <span class="date-step">
									<xsl:if test="project_2015-phase4_date_fin != '' ">
										<xsl:variable name="dtStep4f" select="java:parse(java:java.text.SimpleDateFormat.new('dd/MM/yyyy'), project_2015-phase4_date_fin )" />
										<xsl:value-of select="java:format(java:java.text.SimpleDateFormat.new('MM/yyyy'), $dtStep4f )" />
									</xsl:if>
								  </span>
								</p>
							</div>
						</xsl:if>
						<xsl:value-of disable-output-escaping="yes" select="project_2015-content" />
						</div>
					</article>
				</div>
				<div class="row">
					<div id="project-sharing-buttons" class="col-xs-12 col-sm-12 col-md-8 col-md-offset-4 col-lg-8 col-lg-offset-4 text-center hidden-print">
						<h2 class="title2">Je Partage !</h2>
						<a href="http://www.facebook.com" data-action="facebook-action" data-doc="{document-id}" data-title="{document-title}" class="share" title="Partager sur Facebook">
							<img src="images/local/skin/projet_logo_facebook.png" alt="Partager sur Facebook" title="Partager sur Facebook"/>
						</a>&#160;&#160;
						<a href="http://www.twitter.com" data-action="twitter-action" data-doc="{document-id}" data-title="{document-title}" class="share" title="Partager sur Twitter" target="_blank">
							<img src="images/local/skin/projet_logo_twitter.png" alt="Partager sur Twitter" title="Partager sur Twitter"/>
						</a>
					</div>
				</div>
			</xsl:otherwise>	
		</xsl:choose>	
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
