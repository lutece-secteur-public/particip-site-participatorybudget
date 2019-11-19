// displayLoginPagePopup
function displayLoginPagePopup() {
    currentUrl = window.location.href;
    returnUrl = jQuery.isEmptyObject(currentUrl) ? baseUrl : currentUrl;
    returnUrl = addParameter(returnUrl,'checkUserInformations','check');
    return displayLoginPagePopupWithBackUrl(returnUrl);
}

//displayLoginPagePopup
function displayLoginPagePopupWithBackUrl(returnUrl) {
	window.open( popupConnectLoginPageUrl + returnUrl, '_blank', 'width=720,height=812,scrollbars=yes,status=yes,resizable=yes,screenx=0,screeny=0');
    return false;
}

//displayLostPasswordPagePopup
function displayLostPasswordPagePopup() {
	urlPrefix = "https://accounts.paris.fr/account/send_password?pop=1&returnUrl=";
	currentUrl = window.location.href;
	returnUrl = jQuery.isEmptyObject(currentUrl) ? baseUrl : currentUrl;
	window.open( urlPrefix + returnUrl , '_blank', 'width=720,height=812,scrollbars=yes,status=yes,resizable=yes,screenx=0,screeny=0');
    return false;
}

$(document).ready( function(){
	
    //Ajax Login authentication
    $(".btn-connexion").click(

    function () {

        var userInfos = {
            username: $("#username").val(),
            password: $("#password").val(),
            token:$("#token").val()
        };

        var urlDoLogin = baseUrl + "jsp/site/plugins/mylutece/modules/openam/DoLoginJson.jsp";
        $.ajax({
            url: urlDoLogin,
            type: "POST",
            dataType: "json",
            data: userInfos,
            async: false,
        	cache:false,
            success: function (data) {

                if (data.status == 'OK') {
                    if (data.result) {
                        $("#login_error").hide();
 				currentUrl = window.location.href;
				if (currentUrl .toLowerCase().indexOf("page=mylutece&action=login") >= 0)
				{
					window.location.href = 'jsp/site/plugins/mylutece/DoMyLuteceLogin.jsp?auth_provider=mylutece-openam';
				}
				else
				{	
                       		location.reload();
				}
                    } else {
                        $("#login_error").show();

                    }
                }
                else if ( data.status == 'ERROR' && ( data.errorCode == 'TOKEN_NOT_VALIDATED'||data.errorCode == 'LOGIN_ERROR') )
                {
                	$("#token").val(data.token);
                	$("#login_error").show();
                	
                }

            },
            error: function (jqXHR, textStatus, errorThrown) {

            }
        });

        return false;
    });
    
    $("#lost_password").hide();
	
    $("#username").click(function(){
		$("#login_error").hide();
	});
    
   $("#password").click(function(){
		$("#login_error").hide();
	});
	
		
	$( "#password").focus(function() {
		$("#lost_password").show();
	});
	
	$("#lost_password").click( function(){
		displayLostPasswordPagePopup();
		$(this).hide();
		return false;
	});
});

//checked if the user is authenticated
function checkIfUserIsAuthenticated() {
    var result = false;
    $.ajax({
        url: baseUrl + 'jsp/site/plugins/mylutece/modules/openam/IsUserAuthenticatedJson.jsp',
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



function addParameter(uri, key, value) {
	  var re = new RegExp("([?&])" + key + "=.*?(&|$)", "i");
	  var separator = uri.indexOf('?') !== -1 ? "&" : "?";
	  if (uri.match(re)) {
	    return uri.replace(re, '$1' + key + "=" + value + '$2');
	  }
	  else {
	    return uri + separator + key + "=" + value;
	  }
	}