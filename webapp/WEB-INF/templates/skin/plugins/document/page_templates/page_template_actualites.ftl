<#--
Available objects :
 - String 				document 			The HTML code for the document (Xsl transformation result)
 - String 				portlet				The HTML code for documents list portlet containing the document
 - String 				categories			The HTML code for category list portlet linked with the document
 - String 				document_comments	The HTML code for the comments area
 - String 				document_id			The document id
 - String 				portlet_id			The portlet id
 - DocumentPublication 	publication 		The publication object. 
 											How to display the date publication : ${publication.datePublishing?date} or ${publication.datePublishing?datetime}
-->
<#if isExtendInstalled?? && isExtendInstalled>
	@ExtenderParameter[${document_id},document,opengraph]@
</#if>
<div class="container">

	<#-- Bloc de l'actualité principale -->
	<div id="actualite_article">

		<div class="article-card">
			${document}

		<#if isExtendInstalled?? && isExtendInstalled>

			<div id="actualite_sharing">
				@Extender[${document_id},document,opengraph,{footer:false, header:false}]@
			</div>

			@Extender[${document_id},document,comment]@
			@Extender[${document_id},document,feedback]@
			@Extender[${document_id},document,opengraph,{footer:true}]@
			
		</#if>

	</div>

	<#-- Barre de séparation -->
	<div class="article-separator"></div>

	<#-- Bloc des autres actualités -->
	<#if portlet?has_content >
		${portlet}
	</#if>
	
</div>