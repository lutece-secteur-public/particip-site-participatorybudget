/*
* CNIL COMPLIANCY JS
*  / \
* / | \	 JQUERY main library needed  jquery.com -> http://code.jquery.com/jquery-1.11.2.min.js	-  Lower vestion tested = 1.3.2 // Better with last 1.X release but not tested with 2.X releases
* _ * __
*
*  Documentation : http://wiki.lutece.paris.fr/lutece/jsp/site/Portal.jsp?page=wiki&view=page&page_name=cnil_compliance
*/
/*  */
/*
* $.import_js() helper (for JavaScript importing within JavaScript code).
*/
(function($){var import_js_imported=[];$.extend(true,{import_js:function(script)
{var found=false;for(var i=0;i<import_js_imported.length;i++)
if(import_js_imported[i]==script){found=true;break;}
if(found==false){$("head").append('<script type="text/javascript" src="'+script+'"></script>');import_js_imported.push(script);}}});})(jQuery);
/*
 * SimpleModal 1.4.4 - jQuery Plugin
 * http://simplemodal.com/
 * Copyright (c) 2013 Eric Martin
 * Licensed under MIT and GPL
 * Date: Sun, Jan 20 2013 15:58:56 -0800
 */
(function(factory){if(typeof define==='function'&&define.amd){define(['jquery'],factory);}else{factory(jQuery);}}
(function($){var d=[],doc=$(document),ua=navigator.userAgent.toLowerCase(),wndw=$(window),w=[];var browser={ieQuirks:null,msie:/msie/.test(ua)&&!/opera/.test(ua),opera:/opera/.test(ua)};browser.ie6=browser.msie&&/msie 6./.test(ua)&&typeof window['XMLHttpRequest']!=='object';browser.ie7=browser.msie&&/msie 7.0/.test(ua);browser.boxModel=(document.compatMode==="CSS1Compat");$.simplemodal=function(data,options){return $.simplemodal.impl.init(data,options);};$.simplemodal.close=function(){$.simplemodal.impl.close();};$.simplemodal.focus=function(pos){$.simplemodal.impl.focus(pos);};$.simplemodal.setContainerDimensions=function(){$.simplemodal.impl.setContainerDimensions();};$.simplemodal.setPosition=function(){$.simplemodal.impl.setPosition();};$.simplemodal.update=function(height,width){$.simplemodal.impl.update(height,width);};$.fn.simplemodal=function(options){return $.simplemodal.impl.init(this,options);};$.simplemodal.defaults={appendTo:'body',focus:true,opacity:50,overlayId:'simplemodal-overlay',overlayCss:{},containerId:'simplemodal-container',containerCss:{},dataId:'simplemodal-data',dataCss:{},minHeight:null,minWidth:null,maxHeight:null,maxWidth:null,autoResize:false,autoPosition:true,zIndex:1000,close:true,closeHTML:'<a class="modalCloseImg" title="Close"></a>',closeClass:'simplemodal-close',escClose:true,overlayClose:false,fixed:true,position:null,persist:false,modal:true,onOpen:null,onShow:null,onClose:null};$.simplemodal.impl={d:{},init:function(data,options){var s=this;if(s.d.data){return false;}
browser.ieQuirks=browser.msie&&!browser.boxModel;s.o=$.extend({},$.simplemodal.defaults,options);s.zIndex=s.o.zIndex;s.occb=false;if(typeof data==='object'){data=data instanceof $?data:$(data);s.d.placeholder=false;if(data.parent().parent().size()>0){data.before($('<span></span>').attr('id','simplemodal-placeholder').css({display:'none'}));s.d.placeholder=true;s.display=data.css('display');if(!s.o.persist){s.d.orig=data.clone(true);}}}
else if(typeof data==='string'||typeof data==='number'){data=$('<div></div>').html(data);}
else{alert('SimpleModal Error: Unsupported data type: '+typeof data);return s;}
s.create(data);data=null;s.open();if($.isFunction(s.o.onShow)){s.o.onShow.apply(s,[s.d]);}
return s;},create:function(data){var s=this;s.getDimensions();if(s.o.modal&&browser.ie6){s.d.iframe=$('<iframe src="javascript:false;"></iframe>').css($.extend(s.o.iframeCss,{display:'none',opacity:0,position:'fixed',height:w[0],width:w[1],zIndex:s.o.zIndex,top:0,left:0})).appendTo(s.o.appendTo);}
s.d.overlay=$('<div></div>').attr('id',s.o.overlayId).addClass('simplemodal-overlay').css($.extend(s.o.overlayCss,{display:'none',opacity:s.o.opacity/100,height:s.o.modal?d[0]:0,width:s.o.modal?d[1]:0,position:'fixed',left:0,top:0,zIndex:s.o.zIndex+1})).appendTo(s.o.appendTo);s.d.container=$('<div></div>').attr('id',s.o.containerId).addClass('simplemodal-container').css($.extend({position:s.o.fixed?'fixed':'absolute'},s.o.containerCss,{display:'none',zIndex:s.o.zIndex+2})).append(s.o.close&&s.o.closeHTML?$(s.o.closeHTML).addClass(s.o.closeClass):'').appendTo(s.o.appendTo);s.d.wrap=$('<div></div>').attr('tabIndex',-1).addClass('simplemodal-wrap').css({height:'100%',outline:0,width:'100%'}).appendTo(s.d.container);s.d.data=data.attr('id',data.attr('id')||s.o.dataId).addClass('simplemodal-data').css($.extend(s.o.dataCss,{display:'none'})).appendTo('body');data=null;s.setContainerDimensions();s.d.data.appendTo(s.d.wrap);if(browser.ie6||browser.ieQuirks){s.fixIE();}},bindEvents:function(){var s=this;$('.'+s.o.closeClass).bind('click.simplemodal',function(e){e.preventDefault();s.close();});if(s.o.modal&&s.o.close&&s.o.overlayClose){s.d.overlay.bind('click.simplemodal',function(e){e.preventDefault();s.close();});}
doc.bind('keydown.simplemodal',function(e){if(s.o.modal&&e.keyCode===9){s.watchTab(e);}
else if((s.o.close&&s.o.escClose)&&e.keyCode===27){e.preventDefault();s.close();}});wndw.bind('resize.simplemodal orientationchange.simplemodal',function(){s.getDimensions();s.o.autoResize?s.setContainerDimensions():s.o.autoPosition&&s.setPosition();if(browser.ie6||browser.ieQuirks){s.fixIE();}
else if(s.o.modal){s.d.iframe&&s.d.iframe.css({height:w[0],width:w[1]});s.d.overlay.css({height:d[0],width:d[1]});}});},unbindEvents:function(){$('.'+this.o.closeClass).unbind('click.simplemodal');doc.unbind('keydown.simplemodal');wndw.unbind('.simplemodal');this.d.overlay.unbind('click.simplemodal');},fixIE:function(){var s=this,p=s.o.position;$.each([s.d.iframe||null,!s.o.modal?null:s.d.overlay,s.d.container.css('position')==='fixed'?s.d.container:null],function(i,el){if(el){var bch='document.body.clientHeight',bcw='document.body.clientWidth',bsh='document.body.scrollHeight',bsl='document.body.scrollLeft',bst='document.body.scrollTop',bsw='document.body.scrollWidth',ch='document.documentElement.clientHeight',cw='document.documentElement.clientWidth',sl='document.documentElement.scrollLeft',st='document.documentElement.scrollTop',s=el[0].style;s.position='absolute';if(i<2){s.removeExpression('height');s.removeExpression('width');s.setExpression('height',''+bsh+' > '+bch+' ? '+bsh+' : '+bch+' + "px"');s.setExpression('width',''+bsw+' > '+bcw+' ? '+bsw+' : '+bcw+' + "px"');}
else{var te,le;if(p&&p.constructor===Array){var top=p[0]?typeof p[0]==='number'?p[0].toString():p[0].replace(/px/,''):el.css('top').replace(/px/,'');te=top.indexOf('%')===-1?top+' + (t = '+st+' ? '+st+' : '+bst+') + "px"':parseInt(top.replace(/%/,''))+' * (('+ch+' || '+bch+') / 100) + (t = '+st+' ? '+st+' : '+bst+') + "px"';if(p[1]){var left=typeof p[1]==='number'?p[1].toString():p[1].replace(/px/,'');le=left.indexOf('%')===-1?left+' + (t = '+sl+' ? '+sl+' : '+bsl+') + "px"':parseInt(left.replace(/%/,''))+' * (('+cw+' || '+bcw+') / 100) + (t = '+sl+' ? '+sl+' : '+bsl+') + "px"';}}
else{te='('+ch+' || '+bch+') / 2 - (this.offsetHeight / 2) + (t = '+st+' ? '+st+' : '+bst+') + "px"';le='('+cw+' || '+bcw+') / 2 - (this.offsetWidth / 2) + (t = '+sl+' ? '+sl+' : '+bsl+') + "px"';}
s.removeExpression('top');s.removeExpression('left');s.setExpression('top',te);s.setExpression('left',le);}}});},focus:function(pos){var s=this,p=pos&&$.inArray(pos,['first','last'])!==-1?pos:'first';var input=$(':input:enabled:visible:'+p,s.d.wrap);setTimeout(function(){input.length>0?input.focus():s.d.wrap.focus();},10);},getDimensions:function(){var s=this,h=typeof window.innerHeight==='undefined'?wndw.height():window.innerHeight;d=[doc.height(),doc.width()];w=[h,wndw.width()];},getVal:function(v,d){return v?(typeof v==='number'?v:v==='auto'?0:v.indexOf('%')>0?((parseInt(v.replace(/%/,''))/100)*(d==='h'?w[0]:w[1])):parseInt(v.replace(/px/,''))):null;},update:function(height,width){var s=this;if(!s.d.data){return false;}
s.d.origHeight=s.getVal(height,'h');s.d.origWidth=s.getVal(width,'w');s.d.data.hide();height&&s.d.container.css('height',height);width&&s.d.container.css('width',width);s.setContainerDimensions();s.d.data.show();s.o.focus&&s.focus();s.unbindEvents();s.bindEvents();},setContainerDimensions:function(){var s=this,badIE=browser.ie6||browser.ie7;var ch=s.d.origHeight?s.d.origHeight:browser.opera?s.d.container.height():s.getVal(badIE?s.d.container[0].currentStyle['height']:s.d.container.css('height'),'h'),cw=s.d.origWidth?s.d.origWidth:browser.opera?s.d.container.width():s.getVal(badIE?s.d.container[0].currentStyle['width']:s.d.container.css('width'),'w'),dh=s.d.data.outerHeight(true),dw=s.d.data.outerWidth(true);s.d.origHeight=s.d.origHeight||ch;s.d.origWidth=s.d.origWidth||cw;var mxoh=s.o.maxHeight?s.getVal(s.o.maxHeight,'h'):null,mxow=s.o.maxWidth?s.getVal(s.o.maxWidth,'w'):null,mh=mxoh&&mxoh<w[0]?mxoh:w[0],mw=mxow&&mxow<w[1]?mxow:w[1];var moh=s.o.minHeight?s.getVal(s.o.minHeight,'h'):'auto';if(!ch){if(!dh){ch=moh;}
else{if(dh>mh){ch=mh;}
else if(s.o.minHeight&&moh!=='auto'&&dh<moh){ch=moh;}
else{ch=dh;}}}
else{ch=s.o.autoResize&&ch>mh?mh:ch<moh?moh:ch;}
var mow=s.o.minWidth?s.getVal(s.o.minWidth,'w'):'auto';if(!cw){if(!dw){cw=mow;}
else{if(dw>mw){cw=mw;}
else if(s.o.minWidth&&mow!=='auto'&&dw<mow){cw=mow;}
else{cw=dw;}}}
else{cw=s.o.autoResize&&cw>mw?mw:cw<mow?mow:cw;}
s.d.container.css({height:ch,width:cw});s.d.wrap.css({overflow:(dh>ch||dw>cw)?'auto':'visible'});s.o.autoPosition&&s.setPosition();},setPosition:function(){var s=this,top,left,hc=(w[0]/2)-(s.d.container.outerHeight(true)/2),vc=(w[1]/2)-(s.d.container.outerWidth(true)/2),st=s.d.container.css('position')!=='fixed'?wndw.scrollTop():0;if(s.o.position&&Object.prototype.toString.call(s.o.position)==='[object Array]'){top=parseFloat(st)+parseFloat(s.o.position[0]||hc);left=s.o.position[1]||vc;}else{top=st+hc;left=vc;}
s.d.container.css({left:left,top:top});},watchTab:function(e){var s=this;if($(e.target).parents('.simplemodal-container').length>0){s.inputs=$(':input:enabled:visible:first, :input:enabled:visible:last',s.d.data[0]);if((!e.shiftKey&&e.target===s.inputs[s.inputs.length-1])||(e.shiftKey&&e.target===s.inputs[0])||s.inputs.length===0){e.preventDefault();var pos=e.shiftKey?'last':'first';s.focus(pos);}}
else{e.preventDefault();s.focus();}},open:function(){var s=this;s.d.iframe&&s.d.iframe.show();if($.isFunction(s.o.onOpen)){s.o.onOpen.apply(s,[s.d]);}
else{s.d.overlay.show();s.d.container.show();s.d.data.show();}
s.o.focus&&s.focus();s.bindEvents();},close:function(){var s=this;if(!s.d.data){return false;}
s.unbindEvents();if($.isFunction(s.o.onClose)&&!s.occb){s.occb=true;s.o.onClose.apply(s,[s.d]);}
else{if(s.d.placeholder){var ph=$('#simplemodal-placeholder');if(s.o.persist){ph.replaceWith(s.d.data.removeClass('simplemodal-data').css('display',s.display));}
else{s.d.data.hide().remove();ph.replaceWith(s.d.orig);}}
else{s.d.data.hide().remove();}
s.d.container.hide().remove();s.d.overlay.hide();s.d.iframe&&s.d.iframe.hide().remove();s.d.overlay.remove();s.d={};}}};}));
/*!
 * jQuery Cookie Plugin v1.4.1
 * https://github.com/carhartl/jquery-cookie
 *
 * Copyright 2006, 2014 Klaus Hartl
 * Released under the MIT license
 */
 (function($){var pluses=/\+/g;function encode(s){return config.raw?s:encodeURIComponent(s);}
function decode(s){return config.raw?s:decodeURIComponent(s);}
function stringifyCookieValue(value){return encode(config.json?JSON.stringify(value):String(value));}
function parseCookieValue(s){if(s.indexOf('"')===0){s=s.slice(1,-1).replace(/\\"/g,'"').replace(/\\\\/g,'\\');}
try{s=decodeURIComponent(s.replace(pluses,' '));return config.json?JSON.parse(s):s;}catch(e){}}
function read(s,converter){var value=config.raw?s:parseCookieValue(s);return $.isFunction(converter)?converter(value):value;}
var config=$.cookie=function(key,value,options){if(arguments.length>1&&!$.isFunction(value)){options=$.extend({},config.defaults,options);if(typeof options.expires==='number'){var days=options.expires,t=options.expires=new Date();t.setTime(+t+days*864e+5);}
return(document.cookie=[encode(key),'=',stringifyCookieValue(value),options.expires?'; expires='+options.expires.toUTCString():'',options.path?'; path='+options.path:'',options.domain?'; domain='+options.domain:'',options.secure?'; secure':''].join(''));}
var result=key?undefined:{};var cookies=document.cookie?document.cookie.split('; '):[];for(var i=0,l=cookies.length;i<l;i++){var parts=cookies[i].split('=');var name=decode(parts.shift());var cookie=parts.join('=');if(key&&key===name){result=read(cookie,value);break;}
if(!key&&(cookie=read(cookie))!==undefined){result[name]=cookie;}}
return result;};config.defaults={};$.removeCookie=function(key,options){if($.cookie(key)===undefined){return false;}
$.cookie(key,'',$.extend({},options,{expires:-1}));return!$.cookie(key);};})(jQuery);

// Simple JavaScript Templating
// John Resig - http://ejohn.org/ - MIT Licensed
(function(){var cache={};this.tmpl=function tmpl(str,data){var fn=!/\W/.test(str)?cache[str]=cache[str]||tmpl(document.getElementById(str).innerHTML):new Function("obj","var p=[],print=function(){p.push.apply(p,arguments);};"+"with(obj){p.push('"+
str.replace(/[\r\t\n]/g," ").split("<%").join("\t").replace(/((^|%>)[^\t]*)'/g,"$1\r").replace(/\t=(.*?)%>/g,"',$1,'").split("\t").join("');").split("%>").join("p.push('").split("\r").join("\\'")
+"');}return p.join('');");return data?fn(data):fn;};})();
// eof Simple JavaScript Templating

// CookieBanner based on arte.tv script
(function($) {
    var mdpCookieBanner = function(_options) {
        //
        // Defaults
        var options = $.extend({
            lang: 'fr', // String fr de
            i18n: {}
        }, _options);

        var MDP = this,
        //
        // Template Cookie Banner
        html = ''
        + '<div id="cookie-banner" class="animated fadeInUp cookie-banner-top">'
        + ' <p class="fleft"><%= text %> <a id="cookie-banner-more" href="#" class="button"><%= more_label %></a>'
		+ ' &nbsp;&nbsp;<a id="cookie-banner-accept" href="#" class="accept"><%= accept_label %></a>'
		+ ' &nbsp;&nbsp;<a id="cookie-banner-param" href="#" class="param"><%= param_label %></a>'
        + ' &nbsp;<a id="dismiss-banner" href="#" class="dismiss fright"> X <%= dismiss_label %></a></p>'
        + '</div>',
		 // Element caching
        $this,
        //
		// == Template CNIL
		cnilHtml = ''
			+ '<div id="cnil-modal-content">'
			+ ' <div class="close"><a href="#" class="simplemodal-close">x</a></div>'
			+ '	<h2>Politique d&acute;utilisation des cookies</h2>'
			+ '	<div class="strong"><p>Afin de rendre les services plus performants, les sites de la Mairie de Paris sont susceptibles d’utiliser des «&nbsp;cookies&nbsp;». Les cookies nous fournissent des informations sur la façon dont nos sites sont utilisés, mais aussi de fluidifier la navigation et d’améliorer l’expérience utilisateur.</p></div><p>&nbsp;</p>'
			+ '	<h3>Qu’est-ce qu’un cookie ?</h3>'
			+ '	<p>Un cookie est un petit fichier texte qui est stocké par votre navigateur lors de votre première visite. Une fois installés, ils nous permettent de vous reconnaître à chaque visite, et donc de vous faire profiter de toutes les fonctionnalités de nos sites. Les cookies ne sont pas des dossiers actifs, et ne peuvent donc pas héberger de virus. Pour en savoir plus, vous pouvez vous rendre sur <a href="www.allaboutcookies.org" target="_blank">www.allaboutcookies.org</a>. Cette politique est rédigée pour vous expliquer à quoi nous servent ces cookies et ce qu’ils font.&nbsp;</p>'
			+ '	<p>&nbsp;</p>'
			+ '	<h3>Comment la Mairie de Paris utilise les cookies ?</h3>'
			+ '	<p>Nous utilisons Piwik pour recueillir les statistiques sur le trafic de nos sites web, afin que nous puissions faire les ajustements nécessaires pour répondre aux mieux aux besoins des utilisateurs. Nous recueillons par exemple des données sur le nombre de visiteurs, la durée moyenne des visites, ou encore le nombre de pages vues. Ces données sont anonymes et aucune personne n’est identifiée personnellement.</p>'
			+ '	<p>Les outils de partage : sur certains de nos sites, il est possible de partager du contenu avec d’autres utilisateurs, notamment via les réseaux sociaux mais aussi partager une vidéo Dailymotion ou un diaporama Picassa. Pour cela nous utilisons «&nbsp;AddThis&nbsp;» qui nous permet de vous rendre le partage d’informations et de contenus plus facile.<br><br></p>'
			+ '	<h3>Détail des cookies utilisés</h3>'
			+ '	<table role="presentation">'
			+ '	<tbody>'
			+ '	<tr>'
			+ '	<th scope="col">Cookie</th>'
			+ '	<th scope="col">Nom</th>'
			+ '	<th scope="col">Objectif</th>'
			+ '	</tr>'
			+ '	<tr>'
			+ '	<td scope="row">Piwik</td>'
			+ '	<td>'
			+ '	<p>_pk_id.20.92f5<br>_pk_ref.20.92f5<br>_pk_ses.20.92f5</p>'
			+ '	</td>'
			+ '	<td>Ces cookies sont installés par Piwik et sont utilisés pour collecter des informations non personnelles sur l’utilisation faîte par les visiteurs du site du Budget Participatif. <br><br>Ces cookies collectent des informations de manière anonyme, incluant le nombre de visiteurs de notre Site et les pages visitées.</td>'
			+ '	</tr>'
			+ '	<tr>'
			+ '	<td>Mon Compte</td>'
			+ '	<td>'
			+ '	<p>cookie-cnil-parisfr<br>mcpAuth</p>'
			+ '	</td>'
			+ '	<td><span>Gestion du compte utilisateur « Mon Compte ».</span></td>'
			+ '	</tr>'
			+ '	<tr>'
			+ '	<td>Facebook pixel</td>'
			+ '	<td>facebook.com</td>'
			+ '	<td><span>Interagir avec Facebook afin de vous tenir inform&eacute; des nouveaut&eacute;s du site du budget participatif.</span></td>'
			+ '	</tr>'
			+ '	<td>AppNexus</td>'
			+ '	<td>appnexus.com</td>'
			+ '	<td><span>Vous pr&eacute;senter des encarts relatifs au site du budget participatif.</span></td>'
			+ '	</tr>'
			+ '	<td>Twitter</td>'
			+ '	<td>twitter.com</td>'
			+ '	<td><span>Partager du contenu avec d’autres utilisateurs.</span></td>'
			+ '	</tr>'
			+ '	<tr>'
			+ '	<td>Dailymotion</td>'
			+ '	<td>&nbsp;d<span>ailymotion.com (dmvk et ts)</span></td>'
			+ '	<td><span>Partager des vidéos avec d’autres utilisateurs.</span></td>'
			+ '	</tr>'
			+ '	<tr>'
			+ '	<td>Picassa web</td>'
			+ '	<td>_rtok</td>'
			+ '	<td><span>Partager des diaporamas avec d’autres utilisateurs.</span></td>'
			+ '	</tr>'
			+ '	</tbody>'
			+ '	</table>'
			+ '	<p>&nbsp;</p>'
			+ '	<p>La <strong>désactivation des cookies risque de vous empêcher d’utiliser certaines fonctionnalités</strong>, notamment l’utilisation de votre compte <strong>Paris Connect</strong>, ou vous <strong>empêcher de partager une vidéo ou du contenu via les réseaux sociaux</strong>.&nbsp;</p>'
			+ '	<h3>Que faire si l&acute;on ne veut pas que des&nbsp;cookies soient install&eacute;s ?</h3>'
			+ '<p>Certaines personnes trouvent gênant qu&acute;un site garde des informations sur leur ordinateur, surtout quand ces informations sont stock&eacute;es et utilis&eacute;es par un site tiers à leur insu, bien que cela soit g&eacute;n&eacute;ralement sans cons&eacute;quence. Si c&acute;est votre cas, vous pouvez bloquer certains ou tous les cookies, voire supprimer ceux qui ont d&eacute;jà &eacute;t&eacute; install&eacute;s. Mais soyez conscients que cela pourra rendre moins agr&eacute;able votre visite sur nos pages.</p>'
			+ '<p><strong id="effacer">Comment effacer les cookies non d&eacute;sir&eacute;s&nbsp;?<br>'
			+ '</strong>Si vous ne voulez pas recevoir de cookies, vous pouvez r&eacute;gler votre navigateur de telle sorte qu&acute;il vous alerte lorsqu&acute;il en reçoit ou qu&acute;il les refuse d&acute;embl&eacute;e.&nbsp;<span style="color: #282828">Toutefois, si vous le param&eacute;trez pour qu&acute;il refuse automatiquement les cookies, vous ne pourrez plus utiliser certaines fonctions des sites web paris.fr.</span></p>'
			+ '<p>Pour savoir comment proc&eacute;der, consultez les sites en lien ci-dessous en fonction de votre type de navigateur :</p>'
			+ '<ul>'
			+ '<li><a href="https://support.mozilla.org/fr/kb/activer-desactiver-cookies">Firefox</a></li>'
			+ '<li><a href="https://support.google.com/chrome/answer/95647?hl=fr">Chrome</a></li>'
			+ '<li><a href="http://windows.microsoft.com/fr-FR/internet-explorer/delete-manage-cookies#ie=ie-9">Explorer</a></li>'
			+ '<li><a href="http://support.apple.com/kb/PH17191?viewlocale=fr_FR">Safari</a></li>'
			+ '<li><a href="http://help.opera.com/Windows/10.20/fr/cookies.html">Opera</a></li>'
			+ '<li><a href="http://support.apple.com/kb/HT1677?viewlocale=fr_FR">iOS</a></li>'
			+ '<li><a href="http://www.wikihow.com/Disable-Cookies#Android_Devices">Android</a></li>'
			+ '<li><a href="http://docs.blackberry.com/en/smartphone_users/deliverables/32004/Turn_off_cookies_in_the_browser_60_1072866_11.jsp">Blackberry</a></li>'
			+ '<li><a href="http://docs.blackberry.com/en/smartphone_users/deliverables/32004/Turn_off_cookies_in_the_browser_60_1072866_11.jsp">Windows Phone</a></li>'
			+ '</ul>'
			+ '<p>&nbsp;</p>'
			+ '<p><strong>Quatre&nbsp;conseils de la CNIL</strong></p>'
			+ '<p>Le site de la CNIL vous propose <a href="http://www.cnil.fr/vos-droits/vos-traces/les-cookies/conseils-aux-internautes/chrome">quatre conseils pour limiter la traçabilit&eacute; de votre navigation</a> web :</p>'
			+ '<ul>'
			+ '<li><strong>bloquer les cookies tiers.</strong> Les cookies tiers ne sont habituellement pas n&eacute;cessaires pour profiter des ressources disponibles sur Internet. Si vous souhaitez limiter vos traces, il est recommand&eacute; de les refuser par d&eacute;faut.</li>'
			+ '<li><strong>Empêcher l&acute;installation des traqueurs les plus r&eacute;pandus.</strong> De nombreuses extensions permettent de bloquer les diff&eacute;rents traceurs. Par exemple, pour le navigateur Chrome, DoNotTrackMe, Disconnect, Ghostery…</li>'
			+ '<li><strong>Bloquer les boutons de partage des r&eacute;seaux sociaux.</strong> Les sites de paris.fr utilisent des boutons de r&eacute;seaux sociaux qui informent Facebook, Twitter… de votre visite. Vous pouvez l&acute;empêcher avec une extension logicielle libre et gratuite, Share me not.</li>'
			+ '<li><strong>Limiter le traçage dans Adobe Flash.</strong> Il est recommand&eacute; de changer ces paramètres en se connectant au gestionnaire de paramètres accessible en ligne mais, si le site de Flash propose une d&eacute;sactivation afin d&acute;empêcher tout stockage sur les ordinateurs, elle ne fonctionne pas à 100%.<br>'
			+ 'Les cookies LSO (Flash) r&eacute;sistent à la manipulation qui consiste à effacer les cookies « traditionnels » par le biais du navigateur web. Plutôt que d&acute;effacer manuellement les cookies LSO, il est possible de t&eacute;l&eacute;charger une extension à votre navigateur qui vous permettra de les supprimer à chaque fermeture du navigateur. Par exemple, Betterprivacy pour Firefox.</li>'
			+ '</ul>'
			+ ' </div>'
			
			+ '<div id="cnil-cookie-manage">'
			+ '	<h2>Param&eacute;trer les cookies</h2>'
			+ '	<div class="strong"><p>Afin de rendre les services plus performants, les sites de la Mairie de Paris sont susceptibles d’utiliser des «&nbsp;cookies&nbsp;». Les cookies nous fournissent des informations sur la façon dont nos sites sont utilisés, mais aussi de fluidifier la navigation et d’améliorer l’expérience utilisateur.</p></div><p>&nbsp;</p>'
			+ '	<div class="ck row">'
			+ '  <div class="ckMngr col-md-3"><input id="ckMngrFonc" type="checkbox" checked="checked" disabled="disabled">&nbsp;<label for="ckMngrFonc">Cookies de fonctionnement (obligatoires)</label></div>'
			+ '  <div class="ckText col-md-9">Ces cookies sont nécessaires au bon fonctionnement du site internet et ne sont pas désactivables. Ils gèrent par exemple la connexion à votre compte Mon Paris.</div>'
			+ ' </div>'
			+ '	<div class="ck row">'
			+ '  <div class="ckMngr col-md-3"><input id="ckMngrRS" type="checkbox" checked="checked">&nbsp;<label for="ckMngrRS">Cookies sociaux</label></div>'
			+ '  <div class="ckText col-md-9">Ces cookies permettent d’interagir avec les réseaux sociaux afin de vous y tenir informés des dernières nouveautés du site du budget participatif.</div>'
			+ ' </div>'
			+ '	<div class="ck row">'
			+ '  <div class="ckMngr col-md-3"><input id="ckMngrADS" type="checkbox" checked="checked">&nbsp;<label for="ckMngrADS">Cookies de ciblage</label></div>'
			+ '  <div class="ckText col-md-9">Ces cookies nous permettent de vous proposer des encarts relatifs au site du budget participatif.</div>'
			+ ' </div>'
			+ ' <br/>'
			+ ' <a id="ckSave" href="#" class="btn">Valider</a>'
			+ ' </div>',
        // Element caching
        $this,
        //
        // Translation object
        i18n = {
            'fr': {
                'text': 'En poursuivant votre navigation sur ce site, vous acceptez l&acute;utilisation de cookies pour le fonctionnement des boutons de partage sur les r&eacute;seaux sociaux et la mesure d&acute;audience des pages du site. Pour mieux comprendre notre politique de protection de votre vie priv&eacute;e, ',
                'more_label': 'rendez-vous ici',
                'accept_label': '&gt;&gt; Accepter',
                'param_label': 'Param&eacute;trer les cookies',
                'dismiss_label': 'Fermer'
            },
            'de': {
                'text': 'Durch die fort Ihren Besuch auf dieser Website, akzeptieren Sie die Verwendung von Cookies für den Betrieb Sharing Tasten auf soziale Netzwerke und Reichweitenmessung Site-Seiten. Zu unserem Schutz Ihrer Privatsphäre Politik besser zu verstehen',
                'more_label': 'Mehr zum Thema',
                'accept_label': 'zu akzeptieren',
                'param_label': 'Manage cookies',
				'dismiss_label': 'Schließen'
            },
            'es': {
                'text': 'Al continuar su visita a este sitio, usted acepta el uso de cookies para la operaci&oacute;n de intercambio de botones en las redes sociales y las p&aacute;ginas del sitio de medici&oacute;n de audiencias. Para entender mejor nuestra protecci&oacute;n de su política de privacidad,',
                'more_label': 'M&aacute;s informacion',
                'accept_label': '&gt;&gt; Aceptar',
                'param_label': 'Manage cookies',
				'dismiss_label': 'Cercar'
            },
            'en': {
                'text': 'By continuing your visit to this site, you accept the use of cookies for the operation of sharing buttons on social networks and audience measurement site pages. To better understand our protection of your privacy policy',
                'more_label': 'Read More',
                'accept_label': '&gt;&gt; Accept',
                'param_label': 'Manage cookies',
				'dismiss_label': 'Close'
            }
        },
        getI18n = function(k) {
            return typeof i18n[options.lang] != 'undefined' && typeof i18n[options.lang][k] != 'undefined' ? i18n[options.lang][k] : false;
        };

		// Vérifie la valeur de navigator.DoNotTrack pour savoir si le signal est activé et est à   1
		var notToTrack = function notToTrack() {
			if ( (navigator.doNotTrack && (navigator.doNotTrack=='yes' || navigator.doNotTrack=='1'))
				|| ( navigator.msDoNotTrack && navigator.msDoNotTrack == '1') ) {
				var isIE = (getInternetExplorerVersion()!=-1)
				if (!isIE){
				 return true;
				}
			return false;
			}
		};

		// Si le signal est à   0 on considère que le consentement a déjà   été obtenu
		var isToTrack = function isToTrack() {
			if ( navigator.doNotTrack && (navigator.doNotTrack=='no' || navigator.doNotTrack==0 )) {
				return true;
			}
		};

        var onCloseClick = function(event, consent) {
            event.preventDefault();
            $("body").css("margin-top","0"); 
            $this.addClass('fadeOutDown');
            
            var cookieOptions = { 'path': '/', expires: 30 };
            if (-1 !== new String(window.location.host).indexOf('paris.fr')) {
                cookieOptions.domain = 'paris.fr';
            }
            
            $.cookie('cookie-cnil-parisfr', 'true', cookieOptions);

          	var cookieContentSet = {"categories":{"ads":consent,"socials":consent},"version":1,"iabVersion":10};
            $.cookie('cookie-consent', JSON.stringify( cookieContentSet ), cookieOptions);
        },

        initialize = function() {
            if ('true' == $.cookie('cookie-cnil-parisfr')) return;
            $.extend(i18n, options.i18n);
			$('body').prepend(tmpl(html, i18n[options.lang])).append(tmpl(cnilHtml, i18n[options.lang]));
            $this = $('#cookie-banner');
            $("body").css("margin-top","40px");
            
            $('#cookie-banner-accept').click( function(e) { onCloseClick(e, true ); location.reload( ); } );
            
            $('#cookie-banner-param' ).click( function(e) { 
            	onCloseClick(e, false); 
    			$('#cnil-cookie-manage').simplemodal();
    			return false;
    		} );
            
            $('#ckSave' ).click( function(e) { 
              	var cookieContentSet = {"categories":{"ads":$('#ckMngrADS').prop('checked') ,"socials":$('#ckMngrRS').prop('checked')},"version":1,"iabVersion":10};
              	console.log(cookieContentSet);
                var cookieOptions = { 'path': '/', expires: 365 };
                if (-1 !== new String(window.location.host).indexOf('paris.fr')) {
                    cookieOptions.domain = 'paris.fr';
                }
                $.cookie('cookie-consent', JSON.stringify( cookieContentSet ), cookieOptions);
                location.reload( );
    		} );

            $('#dismiss-banner').click( function(e){  e.preventDefault(); $('#cookie-banner').remove();$("body").css("margin-top","0"); } );

        };
        initialize();
    };
    
	// Load Cookie banner
    new mdpCookieBanner();

	// Load modal to show cookies and Cnil informations
	$('#cookie-banner-more').click(function (e) {
		e.preventDefault();
		$('#cnil-modal-content').simplemodal();
		return false;
	});
})(jQuery);
