
INSERT INTO `workflow_workflow` VALUES (1,'Workflow Idées','Workflow Idées','2015-11-05 11:05:51',1,'all');

INSERT INTO `workflow_state` VALUES (1,'Initial','État initial',1,1,0,NULL,1);
INSERT INTO `workflow_state` VALUES (2,'Nouveau','Nouveau',1,1,0,NULL,2);
INSERT INTO `workflow_state` VALUES (3,'Déposé','Déposé',1,0,0,NULL,3);
INSERT INTO `workflow_state` VALUES (4,'À l\'étude','À l\'étude',1,0,0,NULL,4);
INSERT INTO `workflow_state` VALUES (5,'Non retenu','Non retenu',1,0,0,NULL,5);
INSERT INTO `workflow_state` VALUES (6,'Supprimé Dépositaire','Supprimé Dépositaire',1,0,0,NULL,6);
INSERT INTO `workflow_state` VALUES (7,'Supprimé MdP','Supprimé MdP',1,0,0,NULL,7);

INSERT INTO `workflow_action` VALUES (1,'Creation','Notification création',1,1,2,3,1,0,1,0);
INSERT INTO `workflow_action` VALUES (2,'Fin Nouveau','Fin nouveau',1,2,3,3,1,0,2,0);
INSERT INTO `workflow_action` VALUES (3,'fin ideation','validation',1,3,4,1,0,0,3,0);
INSERT INTO `workflow_action` VALUES (4,'Non retenu1','Non retenu1',1,3,5,2,0,0,4,0);
INSERT INTO `workflow_action` VALUES (5,'Non retenu2','Non retenu2',1,4,5,2,0,0,5,0);
INSERT INTO `workflow_action` VALUES (6,'Supprimé Dépositaire','Supprimé Dépositaire',1,3,6,2,0,0,6,0);
INSERT INTO `workflow_action` VALUES (7,'Supprimé MdP1','Supprimé MdP1',1,3,7,2,0,0,7,0);
INSERT INTO `workflow_action` VALUES (8,'Supprimé MdP2','Supprimé MdP2',1,4,7,2,0,0,8,0);

INSERT INTO `workflow_task` VALUES (1,'taskNotifyIdeation',1,1);

INSERT INTO `workflow_prerequisite` VALUES (1,2,'workflow.prerequisite.duration');
INSERT INTO `workflow_prerequisite_duration_cf` VALUES (1,172800);
