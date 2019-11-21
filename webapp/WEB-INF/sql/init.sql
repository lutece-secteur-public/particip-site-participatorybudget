insert into core_datastore values ('solr.app.conf.list_idees.mapping', 'false');
insert into core_datastore values ('solr.app.conf.list_idees.fq.1', 'type:idee');
insert into core_datastore values ('solr.app.conf.list_idees.fq.2', 'idee_status_text:true');
insert into core_datastore values ('solr.app.conf.list_idees.template', 'skin/plugins/ideation/ideation_list_solr_search_results.html');
insert into core_datastore values ('solr.app.conf.list_idees.addonBeans.0', 'ideation.IdeationSolrAddon');
insert into core_datastore values ('solr.app.conf.map_idees.mapping', 'true');
insert into core_datastore values ('solr.app.conf.map_idees.fq.1', 'type:idee');
insert into core_datastore values ('solr.app.conf.map_idees.fq.2', 'idee_status_text:true');
insert into core_datastore values ('solr.app.conf.map_idees.template', 'skin/plugins/ideation/ideation_map_solr_search_results.html');
insert into core_datastore values ('solr.app.conf.map_idees.addonBeans.0', 'ideation.IdeationSolrAddon');


insert into core_datastore values ('solr.app.conf.projects_mdp.mapping', 'false');
insert into core_datastore values ('solr.app.conf.projects_mdp.fq.1', 'statut_project_text:SOUMIS' );
insert into core_datastore values ('solr.app.conf.projects_mdp.fq.2', 'type:Projet 2015' );
insert into core_datastore values ('solr.app.conf.projects_mdp.template', 'skin/plugins/participatorybudget/projet_mdp_list_solr_search_results.html');
insert into core_datastore values ('solr.app.conf.projects_mdp.addonBeans.0', 'participatorybudget.BudgetSolrListAddon');


insert into core_datastore values ('solr.app.conf.map_projets.mapping', 'true');
insert into core_datastore values ('solr.app.conf.map_projets.fq.1', 'statut_project_text:SOUMIS');
insert into core_datastore values ('solr.app.conf.map_projets.fq.2', 'type:Projet 2015');
insert into core_datastore values ('solr.app.conf.map_projets.template', 'skin/pluginsparticipatorybudget/projet_mdp_map_solr_search_results.html');
insert into core_datastore values ('solr.app.conf.map_projets.addonBeans.0', participatorybudget..BudgetSolrAddon');

insert into core_datastore values ('solr.app.conf.projects_mdp_detail.mapping', 'false');
insert into core_datastore values ('solr.app.conf.projects_mdp_detail.fq.1', 'statut_project_text:SOUMIS');
insert into core_datastore values ('solr.app.conf.projects_mdp_detail.fq.2', 'type:Projet 2015');
insert into core_datastore values ('solr.app.conf.projects_mdp_detail.template', 'skin/pluginsparticipatorybudget/projet_mdp_details_solr_search_results.html');
insert into core_datastore values ('solr.app.conf.projects_mdp_detail.addonBeans.0'participatorybudget.f.VotesSolrAddon');



insert into core_datastore values ('solr.app.conf.list_projects.mapping', 'false');
insert into core_datastore values ('solr.app.conf.list_projects.fq.1', 'statut_project_text:GAGNANT');
insert into core_datastore values ('solr.app.conf.list_projects.fq.2', 'type:Projet 2015');
insert into core_datastore values ('solr.app.conf.list_projects.template', 'skin/pluginsparticipatorybudget/document_list_solr_search_results.html');


insert into core_datastore values ('sitelabels.site_property.intro_projets.textblock', 'Du ... au ... janvier 2016, vous pouvez déposer vos projets, pour Paris comme pour votre arrondissement.');


INSERT INTO `core_portlet` VALUES (100,'HTML_PORTLET',2,'Texte libre','2015-11-30 10:07:46',0,1,1,100,0,'2015-11-30 09:58:08',1,'none',4369);

INSERT INTO `html_portlet` VALUES (100,'<p class=\"text-center\">Ici on peut <span style=\n\"color: #ff0000;\"><strong>&eacute;crire</strong></span> ce qu\'on\nveut et mettre des images et &ecirc;tre responsive !</p>\n<div class=\"row\">\n<div class=\"col-xs-12\">\n<p class=\"text-center\">&gt;&gt;&gt;&gt; <a title=\"Je Propose\" href=\n\"jsp/site/Portal.jsp?page=ideation\">Je Propose</a>\n&lt;&lt;&lt;&lt;</p>\n<p class=\"text-center\">&nbsp;</p>\n</div>\n</div>\n<div class=\"row\">\n<div class=\"col-sm-6\"><img class=\"img-reponsive center-block\" src=\n\"images/local/skin/header_notext.png\" alt=\"\">\n</div>\n<div class=\"col-sm-6\"><img class=\"img-reponsive center-block\" src=\n\"images/local/skin/logo_paris_bp.png\" alt=\"\">\n</div>\n</div>');

update core_datastore set  entity_value= "skin/pluginsparticipatorybudget/document_list_solr_search_results.html" where entity_key="solr.app.conf.list_projects.template";
