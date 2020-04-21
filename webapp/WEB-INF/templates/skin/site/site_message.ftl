<div class="container">
	
	<h1>
		<#if     message.type = 0 ><i class="fa fa-info"       ></i>
		<#elseif message.type = 1 ><i class="fa fa-question"   ></i>
		<#elseif message.type = 2 ><i class="fa fa-remove"     ></i>
		<#elseif message.type = 3 ><i class="fa fa-exclamation"></i>
		<#elseif message.type = 4 ><i class="fa fa-check"      ></i>
		</#if>
		${title}
	</h1>
	
	<!--
	<div class="alert <#if message.type != 2 >alert-info<#else>alert-danger</#if>">
	-->

	<h2>${text}<h2>

	<form method="post" action="${url!}" target="${target!}" class="form-inline pull-right">
		<#if list_parameters?exists>
			<#assign keys = list_parameters?keys>
			<#list keys as key>
				<input type="hidden" name="${key}" value="${list_parameters[key]}" />
			</#list>
		</#if>
		<#if url?has_content>
			<button type="submit"class="btn btn-18rem btn-black-on-white">
				<i class="fa fa-check"></i>&nbsp;#i18n{portal.util.labelValidate}
			</button>
		</#if>
	</form>
		
	<#if back_url?has_content>
		<form method="post" action="${back_url}" class="form-inline pull-left" >
			<#if list_parameters?exists>
				<#list keys as key>
					<input type="hidden" name="${key}" value="${list_parameters[key]}" />
				</#list>
			</#if>
			<#if cancel_button = 1>
				<button type="submit" name="cancel" class="btn btn-18rem btn-black-on-white"><i class="fa fa-remove"></i>&nbsp;#i18n{portal.util.labelBack}</button>
			<#elseif cancel_button = 2>
				<button type="submit" name="cancel" class="btn btn-18rem btn-black-on-white"><i class="fa fa-remove"></i>&nbsp;#i18n{portal.util.labelCancel}</button>
			</#if>
		</form>
		
	<#else>
		<#if cancel_button = 1>
			<button type="button" class="btn btn-18rem btn-black-on-white" onclick="javascript:window.history.back();"><i class="fa fa-remove"></i>&nbsp;#i18n{portal.util.labelBack}</button>
		<#elseif cancel_button = 2>
			<button type="button" class="btn btn-18rem btn-black-on-white" onclick="javascript:window.history.back();"><i class="fa fa-remove"></i>&nbsp;#i18n{portal.util.labelCancel}</button>
		</#if>
	</#if>
		
</div>
