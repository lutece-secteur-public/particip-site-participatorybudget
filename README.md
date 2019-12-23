<p align="center">
<img src="https://raw.githubusercontent.com/lutece-secteur-public/particip-site-participatorybudget/develop/webapp/images/logo-openpb-1280x1024.png" width="400">
</p>

# Site OpenPB

## Introduction

This site is an effort of City of Paris to provide a <a href="https://budgetparticipatif.paris">budgetparticipatif.paris</a>-like website to help other cities to get their own participatory budgeting process.

It is based on [Lutece](https://fr.lutece.paris.fr/fr/) open source portal, and mainly uses the following Lutece plugins :
- [participatory budget](https://github.com/lutece-secteur-public/particip-plugin-participatorybudget)
- [participatory ideation](https://github.com/lutece-secteur-public/particip-plugin-participatoryideation)
- [document](https://github.com/lutece-platform/lutece-cms-plugin-document)
- [mylutece-database](https://github.com/lutece-platform/lutece-auth-module-mylutece-database)

This demo will allow you to :

- Access the homepage of the PB demo site
- Add news and display it on the homepage


- Sign in / sign up from the front-office (via mylutece-database)


- Submit a proposal from the front-office
- Search and view every submitted proposals


- Creating a new submitted project from the back-office
- Search and view every submitted projects
- Vote for your preferred projects


- Add information about winner project realization in back-office
- Search and view winner projects and their level of realization

## Business configuration

Participary budget functionalities are provided depending on the dates of the current phase. You have to modify these dates to access some features, by accessing the [ManageIdeationCampagnes](http://localhost:8080/pb/jsp/admin/plugins/participatoryideation/ManageIdeationCampagnes.jsp) back-office page .

### Submit a proposal

A **proposal** is an idea submitted by a citizen during the *ideation* process.

To get the "Submit your proposal" menu on the homepage navbar, you need to change 'IDEATION' dates so the phase become active. Keep in mind you have to sign in to submit a proposal.

### Submit a project

A **"project"**-named object is a project which can be submitted to vote. These projects are based on one or more proposals, and built by the city municipality (and eventualy with the citizens). If more than one proposals drive to a project, these proposals must be grouped in a new proposal, and this proposal must be linked with the project (so one project is always linked to one proposal).

To get the "Submitted proposals" menu on the homepage navbar, you need to change 'SUBMIT' dates so the phase become active.

### Vote

To get the "Let's go to the vote !" menu on the homepage navbar, you need to change 'VOTE' dates so the phase become active. Keep in mind you have to sign in to vote.

### Winner projects

To do 

### New about projects realization

The entry "Current realization" of the menu does not depend on the current campaign, so it is always available.

## Usage

To do

## Build the image

After you clone the git repository, please **verify the proxy parameters** in the Dockerfile.

`docker build -t site-demo-openpb .`

## Launch the server

`docker run -p 80:8080 site-demo-openpb`

## Connect to the server to see the service

`http://localhost/pb`

## Back office management

`http://localhost/pb/jsp/admin/AdminLogin.jsp`

Connect to the back office with login/pwd : admin/adminadmin

# Project Information

 [Issue Tracking](http://dev.lutece.paris.fr/jira/browse/PARTIDEA) : this is a link to the issue management system for this project. Issues (bugs, features, change requests) can be created and queried using this link.
