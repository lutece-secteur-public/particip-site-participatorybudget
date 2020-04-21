<!DOCTYPE html>
<html>
	<head>
		<base href="${base_url}" />
		<title>#i18n{portal.site.popup_send_resource.title}</title>
		<meta http-equiv="x-ua-compatible" content="IE=edge" >
		<meta charset="${encoding!}">
		<meta http-equiv="Content-Type" content="text/html;charset=${encoding!}">
		<meta http-equiv="Content-Language" content="fr">
		<!-- Set the viewport width to device width for mobile -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- Le style -->
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css/bootstrap-theme.min.css" rel="stylesheet">
		<link href="css/page_template_styles.css" rel="stylesheet">
		<link href="css/datepicker.css" rel="stylesheet">
		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!-- JQUERY UI: Keep for compatibility -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
			<link rel="stylesheet" href="js/jquery/plugins/ui/css/jquery.ui-1.10.0.ie.css">
		<![endif]-->
		<!-- Le fav and touch icons -->
		<link rel="shortcut icon" href="${base_url}favicon.ico"/>
		<!-- 
		<link rel="apple-touch-icon-precomposed" sizes="144x144" href="apple-touch-icon-144-precomposed.png">
		<link rel="apple-touch-icon-precomposed" sizes="114x114" href="apple-touch-icon-114-precomposed.png">
		<link rel="apple-touch-icon-precomposed" sizes="72x72" href="apple-touch-icon-72-precomposed.png">
		<link rel="apple-touch-icon-precomposed" href="apple-touch-icon-57-precomposed.png">
		-->
		<script src="js/jquery/jquery-1.11.1.min.js"></script>
	</head>
	<body>
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-8 col-md-12">
					<form class="form" role="form" action="jsp/site/SendResource.jsp" method="post">
						<input type="hidden" name="extendableResourceType" value="${resource.extendableResourceType}" >
						<input type="hidden" name="idExtendableResource" value="${resource.idExtendableResource}" >
						
								<#if error?? && error != "">
									<div class="alert alert-danger">
										${error}
										<button type="button" class="close" data-dismiss="alert">&times;</button>
									</div>
								</#if>
								<#if success??>
									<div class="alert alert-success">
										#i18n{portal.site.popup_send_resource.labelSent}
										<button type="button" class="close" data-dismiss="alert">&times;</button>
									</div>
								</#if>
								<div class="form-group">
									<label class="sr-only" class="control-label" for="senderName">#i18n{portal.site.popup_send_resource.senderName} *</label>
									<input type="text" class="form-control" name="senderName" id="senderName" value="${senderName!}" placeholder="#i18n{portal.site.popup_send_resource.senderName} *">
								</div>
								<div class="form-group">
									<label class="sr-only" for="senderFirstname">#i18n{portal.site.popup_send_resource.senderFirstname} *:</label>
									<input type="text" class="form-control" name="senderFirstname" id="senderFirstname" value="${senderFirstname!}"  placeholder="#i18n{portal.site.popup_send_resource.senderFirstname} *">
								</div>
								<div class="form-group">
									<label class="sr-only"  for="email">#i18n{portal.site.popup_send_resource.email} *</label>
									<input type="text" class="form-control" name="email" id="email" value=""  placeholder="#i18n{portal.site.popup_send_resource.email} *">
								</div>
								<div class="form-group">
									<label class="sr-only" for="content">#i18n{portal.site.popup_send_resource.content}</label>
									<textarea class="form-control richtext" rows="4" name="content" id="content" placeholder="#i18n{portal.site.popup_send_resource.content}">${content!}</textarea>
								</div>
								<#if resource??>
									<div class="form-group">
										<p>
										<#if resource_url?? && resource_url != "">
											<a href="${base_url}${resource_url}">
										</#if>
											${resource.extendableResourceName}
										<#if resource_url?? && resource_url != "">
											</a>
										</#if>
										</p>
										<#if resource.extendableResourceImageUrl?? && resource.extendableResourceImageUrl != "">
											<p>
											<#if resource_url?? && resource_url != "">
												<a href="${base_url}${resource_url}">
											</#if>
												<img style="max-width:40%;" src="${resource.extendableResourceImageUrl}" alt="${resource.extendableResourceName}" title="${resource.extendableResourceName}" >
											<#if resource_url?? && resource_url != "">
												</a>
											</#if>
											</p>
										</#if>
										<p>${resource.extendableResourceDescription}</p>
									</div>
								</#if>
								<div class="form-group"> 
									<button class="btn btn-block btn-small" name="send" value="send">
										<i class="glyphicon glyphicon-envelope">&nbsp;</i>&nbsp;#i18n{portal.site.popup_send_resource.sendResource}
									</button>
								</div>
						</form>
				</div>
			</div>
		</div>
		
		<script src="js/bootstrap.min.js"></script>
	</body>
</html>