var nToggleBp=false, cToggleBp=true;
$( function(){
	baseUrl = document.getElementsByTagName('base')[0].href;
	//display paris connect popup
    $(".btn-inscrire").click(function () {
    	displayLoginBp();
        return false;
    });
    $("#create_account_login").click(function () {
    	//displayLoginPagePopupWithBackUrl(baseUrl);
    	displayLoginBp();
        return false;
    });
  $("#btn-proposal").click(function () {
    //displayLoginPagePopupWithBackUrl(baseUrl);
    checkValidAccountForPropose($(this).attr("href"));
    return false;
  });


//  $("#comment-form").toggle();
  $("#icomment").click(function () {
	  cToggleBp = true;
			if (nToggleBp){
				$("#news-form").toggle();
				nToggleBp = false;
		}
	  	checkValidAccountForComment();
	    return false;
	  });

		//$("#news-form").toggle();
		$("#istayup").on("click", function(e){
			checkValidAccountForStayUp();
			return false;
		});

  $("a.btn-my-votes").click(function () {
    if (!checkIfUserIsAuthenticated()) {
    	//displayLoginPagePopupWithBackUrl(baseUrl +$(this).attr('href'));
    	displayLoginBp();
      return false;
    }
  });
  $("a.btn-my-infos").click(function () {
    if (!checkIfUserIsAuthenticated()) {
    	 //displayLoginPagePopupWithBackUrl(baseUrl +$(this).attr('href'));
      displayLoginBp();
      return false;
    }
  });

	$(".share").click( function(e){
			e.preventDefault();
			e.stopPropagation();
			return shareClick( $(this) );
	  });

  //check user verification
	if(urlParam('checkUserInformations')=='check'){
		console.log(urlParam('checkUserInformations'));
		checkValidAccountAfterAuthentication();
    }
});

function shareClickAjax( idExtendableResource, action, event ) {
	event.preventDefault();
	event.stopPropagation();
	var jqObj = $("a[data-doc='"+idExtendableResource+"'][data-action='"+action+"']");
	return shareClick( jqObj );
}

function shareClick( jqObj )
{
	var loc = location.href;
	var action = jqObj.attr('data-action');
	var id_doc = jqObj.attr('data-doc');
	
	if( action == 'twitter' ){
		var title  = document.title + " - " + jqObj.attr('data-title');
		window.open('http://twitter.com/share?url=' + encodeURIComponent(loc) + '&text=' + encodeURIComponent( title ) + ' - ' + encodeURIComponent( loc ) + ' - via @twitter', 'twitterwindow', 'height=255, width=550, top='+($(window).height()/2 - 225) +', left='+($(window).width()/2 - 275 ) +', toolbar=0, location=0, menubar=0, directories=0, scrollbars=0');

	} else if( action == 'twitter-idea' ){
		var title  = document.title;
		window.open('http://twitter.com/share?url=' + encodeURIComponent(loc) + '&text=' + encodeURIComponent( title ) + ' - ', 'twitterwindow', 'height=300, width=600, top='+($(window).height()/2 - 225) +', left='+($(window).width()/2 - 275 ) +', toolbar=0, location=0, menubar=0, directories=0, scrollbars=0');
	
	} else if( action == 'facebook' ) {
		var title = document.title + " - " + jqObj.attr('data-title') ;
		window.open('http://www.facebook.com/sharer.php?u=' + encodeURIComponent(loc) + '&t='+encodeURIComponent(title), 'sharer','status=0,width=626,height=436, top='+($(window).height()/2 - 225) +', left='+($(window).width()/2 - 313 ) +', toolbar=0, location=0, menubar=0, directories=0, scrollbars=0');

	} else if( action == 'facebook-action' ) {
		var title  = document.title + " - " + jqObj.attr('data-title');
		var loc = location.origin + "/bp/jsp/site/Portal.jsp?document_id=" + id_doc + "&portlet_id=158";
		window.open('http://www.facebook.com/sharer.php?u=' + encodeURIComponent(loc) + '&t='+encodeURIComponent(title), 'sharer','status=0,width=626,height=436, top='+($(window).height()/2 - 225) +', left='+($(window).width()/2 - 313 ) +', toolbar=0, location=0, menubar=0, directories=0, scrollbars=0');

	} else if( action == 'twitter-action' ) {
		var title  = document.title + " - " + jqObj.attr('data-title');
		var loc = location.origin + "/bp/jsp/site/Portal.jsp?document_id=" + id_doc + "&portlet_id=158";
		window.open('http://twitter.com/share?url=' + encodeURIComponent(loc) + '&text=' + encodeURIComponent( title ), 'twitterwindow', 'height=255, width=550, top='+($(window).height()/2 - 225) +', left='+($(window).width()/2 - 275 ) +', toolbar=0, location=0, menubar=0, directories=0, scrollbars=0');

	} else if( action == 'twitter-project-vote' ) {
		var title  = 'BP - Je vote pour : ';
		var loc = location.origin + "/bp/jsp/site/Portal.jsp?document_id=" + id_doc + "&portlet_id=158";
		window.open('http://twitter.com/share?url=' + encodeURIComponent(loc) + '&text=' + encodeURIComponent( title ), 'twitterwindow', 'height=255, width=550, top='+($(window).height()/2 - 225) +', left='+($(window).width()/2 - 275 ) +', toolbar=0, location=0, menubar=0, directories=0, scrollbars=0');

	} else if( action == 'facebook-project-vote' ) {
		var loc = location.origin + "/bp/jsp/site/Portal.jsp?document_id=" + id_doc + "&portlet_id=158";
		window.open('http://www.facebook.com/sharer.php?u=' + encodeURIComponent(loc), 'sharer','status=0,width=626,height=436, top='+($(window).height()/2 - 225) +', left='+($(window).width()/2 - 313 ) +', toolbar=0, location=0, menubar=0, directories=0, scrollbars=0');

	} else if( action == 'twitter-vote' ) {
		var loc = location.origin
		var title  = "J'ai voté pour le Budget Participatif de Paris !";
		window.open('http://twitter.com/share?url=' + encodeURIComponent(loc) + '&text=' + encodeURIComponent( title ), 'twitterwindow', 'height=255, width=550, top='+($(window).height()/2 - 225) +', left='+($(window).width()/2 - 275 ) +', toolbar=0, location=0, menubar=0, directories=0, scrollbars=0');

	} else if( action == 'facebook-vote' ) {
		var loc = location.origin
		var title  = "J'ai voté pour le Budget Participatif de Paris !";
		window.open('http://www.facebook.com/sharer.php?u=' + encodeURIComponent(loc) + '&t=' + encodeURIComponent(title), 'sharer','status=0,width=626,height=436, top='+($(window).height()/2 - 225) +', left='+($(window).width()/2 - 313 ) +', toolbar=0, location=0, menubar=0, directories=0, scrollbars=0');
	}
	return false;	
}

function checkValidAccountAfterAuthentication(){
	isUserIsValid( function(){$('#mesinfos-modal').modal('hide'); },function(){displayModalPopup(function(){checkValidAccountAfterAuthentication(); })}, function() { });
}

function checkValidAccountForPropose(backUrl){
	isUserIsValid( function(){$('#mesinfos-modal').modal('hide');window.location.href = backUrl; },function(){displayModalPopup(function(){checkValidAccountForPropose(backUrl); })}, function() {displayLoginBp(); });
}

function checkValidAccountForComment(){

	isUserIsValid( function(){

		var commentName=$('#comment-name').val();
		if(commentName.length=0||commentName=='')
		 {

			var popupNickName=$('#budget-nickname').val();
			if(popupNickName.length>0 && popupNickName!='')
			{
				$('#comment-name').val(popupNickName);
			}
		  }

		$('#mesinfos-modal').modal('hide');
		$("#comment-form").fadeToggle( "slow", "linear" );

		},function(){displayModalPopup(function(){checkValidAccountForComment(); })}, function() {displayLoginBp(); });

}


function checkValidAccountForStayUp(){

	isUserIsValid(  function(){
		if( $("#nomore").size() == 0 ){
			$("#news-form").fadeToggle( "slow", "linear" );
			nToggleBp = true;
    if (cToggleBp){
      $("#comment-form").toggle();
      cToggleBp = false;
    }
			return false;
		}
	},function(){displayModalPopup(function(){checkValidAccountForStayUp(); })}, function() {displayLoginBp(); });

}

function urlParam(name){
  var results = new RegExp('[\?&amp;]' + name + '=([^&amp;#]*)').exec(window.location.href);
  if(results!= null){
    return results[1] || 0;
  } else {
    return "";
  }
 }

$( document ).ready(function() {

    if (checkIfUserIsAuthenticated()) {
    	
      	checkValidAccountAfterAuthentication();
    }
});

//checked if the user is authenticated
function checkIfUserIsAuthenticated() {
    var result = false;
    $.ajax({
        url: baseUrl + 'jsp/site/plugins/mylutece/IsUserAuthenticatedJson.jsp',
        type: 'GET',
        dataType: "json",
        data: {},
        async: false,
    	cache:false,
        success: function (data) {
            if (data.status == 'OK') {
                result = data.result;

            }


        },
        error: function (jqXHR, textStatus, errorThrown) {

        }
    });

    return result;
}



