/*
 * jQuery File Upload Plugin JS Example 8.9.1
 * https://github.com/blueimp/jQuery-File-Upload
 *
 * Copyright 2010, Sebastian Tschan
 * https://blueimp.net
 *
 * Licensed under the MIT license:
 * http://www.opensource.org/licenses/MIT
 */

/* global $, window */

$(function () {
    'use strict';

    var uploadButton = $('<button/>')
    .addClass('btn btn-primary')
    .prop('disabled', true)
    .text('Processing...')
    .on('click', function () {
        var $this = $(this),
            data = $this.data();
        $this
            .off('click')
            .text('Abort')
            .on('click', function () {
                $this.remove();
                data.abort();
            });
        data.submit().always(function () {
            $this.remove();
        });
    });

    // Initialize the jQuery File Upload widget:
    $('.${handler_name}${fieldname}').each( function() {
    	$(this).fileupload({
    			// Uncomment the following to send cross-domain cookies:
    			//xhrFields: {withCredentials: true},
    			dataType: 'json',
    			url: '${base_url}${upload_url}',
    			disableImageResize: /Android(?!.*Chrome)|Opera/
        		.test(window.navigator && navigator.userAgent),
    			imageMaxWidth: ${imageMaxWidth},
    			imageMaxHeight: ${imageMaxHeight},
    			previewMaxWidth: ${previewMaxWidth},
    			previewMaxHeight: ${previewMaxHeight},
    			imageCrop: false, // Force cropped images
    			dropZone: $(this),
    			maxFileSize: ${maxFileSize},
    			formData: [{name:'fieldname',value:$(this)[0].name}, {name:'asynchronousupload.handler', value:'${handler_name}'}],
    			messages: {
    		        maxFileSize: "#i18n{asynchronousupload.error.fileTooLarge}",
    		    }
    	    }).on('fileuploadprocessalways', function (e, data) {
    	        var index = data.index,
    	            file = data.files[index],
    	            fieldName = data.formData[0].value;
//    	        if (file.preview) {
//    	            node
//    	                .prepend('<br>')
//    	                .prepend(file.preview);
//    	        }
    	        if (file.error) {
    	        	updateErrorBox( file.error, fieldName )
    	        }
//    	        if (index + 1 === data.files.length) {
//    	            data.context.find('button')
//    	                .text('Upload')
//    	                .prop('disabled', !!data.files.error);
//    	        }
    	    }).on('fileuploadprogressall', function (e, data) {
    	        var progress = parseInt(data.loaded / data.total * 100, 10);
    	        var fieldName = this.name;
    	        var bar = $(' #progress-bar_' + fieldName);
    	        bar.html( progress + '%'  );
    	        bar.css( 'width', progress + '%' );

    	        $(' #progress_' + fieldName).show( );

    	        if ( progress >= 100 )
    	        {
    	        	$(' #progress_' + fieldName).hide();
    	        }
    	    }).on('fileuploaddone', function (e, data) {
    	    	formDisplayUploadedFiles${fieldname}( data.result, data.files, '${checkBoxPrefix}' );
    	    }).on('fileuploadfail', function (e, data) {
    	    	var fieldName = data.formData[0].value;
    	    	updateErrorBox( 'Une erreur est survenue lors de l\'upload du fichier', fieldName );
    	    	$(' #progress_' + fieldName).hide();
    	    }).prop('disabled', !$.support.fileInput)
    	        .parent().addClass($.support.fileInput ? undefined : 'disabled');
    	this.parentNode.className=this.parentNode.className + ' fileinput-button';

    	var jsonData = {"fieldname":this.name, "asynchronousupload.handler":"${handler_name}"};

    	$.getJSON('${base_url}jsp/site/plugins/asynchronousupload/DoRemoveFile.jsp', jsonData,
    			function(json) {
    				formDisplayUploadedFiles${fieldname}(json, null, '${checkBoxPrefix}');
    			}
    		);
    });

    $('[name^="${submitPrefix}"]').click(function(event) {
		event.preventDefault( );
	});

    // prevent user from quitting the page before his upload ended.
    $('[name^="${deletePrefix}"]').each(function() {
    	$(this).click(function(event) {
    		var fieldName = this.name.match("${deletePrefix}(.*)")[1];
    		removeFile${checkBoxPrefix}(fieldName, '${handler_name}', '${base_url}');
    		event.preventDefault( );
    	});
    });

});

/**
 * Sets the files list
 * @param jsonData data
 */
function formDisplayUploadedFiles${fieldname}( jsonData, files, cbPrefix )
{
	// create the div
	var fieldName = jsonData.field_name;

	updateErrorBox(jsonData.form_error, fieldName);

	if ( fieldName != null )
	{
		if ( jsonData.fileCount == 0 ){
			// no file uploaded, hiding content
//			$("#_file_deletion_" + fieldName ).hide(  );
			$("#_file_deletion_label_" + fieldName ).hide(  );
//			$("#_file_deletion_button_" + fieldName ).hide(  );
		} else {

			var strContent = "";
			var checkboxPrefix = cbPrefix + fieldName;

			// jsonData.uploadedFiles.length is str length when file count is 1 so using fileCount instead.
			// so if jsonData.fileCount == 1, the index should not be used
			for ( var index = 0; index < jsonData.fileCount; index++ )
			{
//				if ( jsonData.files[index].is_new )
//				{

					strContent = strContent + "<label class=\"checkbox-inline\" id=\"_file_uploaded_" + fieldName + index + "\"> \
								<input type=\"checkbox\"  \
									name=\"" + checkboxPrefix + index + "\"  \
									id=\"" + checkboxPrefix + index + "\"  \
								/>  \
								&#160;<span class=\"sr-only\">" + ( (jsonData.fileCount == 1) ? jsonData.files.name : jsonData.files[index].name ) +
							"</span><img src=\"" + ( (jsonData.fileCount == 1) ? jsonData.files.preview : jsonData.files[index].preview ) + "\" alt=\""+ ( (jsonData.fileCount == 1) ? jsonData.files.name : jsonData.files[index].name ) +"\" title=\"" + ( (jsonData.fileCount == 1) ? jsonData.files.name : jsonData.files[index].name ) + "\" height=\"${previewMaxHeight}\"></label>";
//				}
//				else if ( jsonData.files[index].is_removed )
//				{
//					$('#_file_uploaded_' + fieldName + index).remove();
//				}
			}

			$("#_file_deletion_" + fieldName ).html( strContent );
			// show the hidden div (if not already)
//			$("#_file_deletion_" + fieldName ).show(  );
			$("#_file_deletion_label_" + fieldName ).show(  );
//			$("#_file_deletion_button_" + fieldName ).show(  );
		}
	}
}

/**
 * Removes a file
 * @param action the action button name
 */
function removeFile${checkBoxPrefix}( fieldName, handlerName, baseUrl ) {
	// build indexes to remove
	var strIndexes = '';

	var indexesCount = 0;
	var checkboxPrefix = '${checkBoxPrefix}' + fieldName;
	$('[name^="' + checkboxPrefix + '"]:checked' ).each( function() {
		if (this.checked)
		{
			if ( indexesCount > 0 )
			{
				strIndexes = strIndexes + ",";
			}
			indexesCount++;
			var index = this.name.match( checkboxPrefix + "(\\d+)")[1];
			strIndexes = strIndexes + index;
		}
	});

	if ( !indexesCount )
	{
		return;
	}

	var jsonData = {"fieldname":fieldName, "asynchronousupload.handler":handlerName, "field_index": strIndexes};

	$.getJSON(baseUrl + 'jsp/site/plugins/asynchronousupload/DoRemoveFile.jsp', jsonData,
		function(json) {
			formDisplayUploadedFiles${fieldname}(json, null, '${checkBoxPrefix}');
		}
	);
}

function updateErrorBox( errorMessage, fieldName )
{
	if ( errorMessage != null && errorMessage != '' )
	{
		var strContent = '<span class="text-danger">' + errorMessage + '</span>'
		$( '#_file_error_box_' + fieldName ).html( strContent );
		$( '#_file_error_box_' + fieldName ).show( );
	}
	else
	{
		$( '#_file_error_box_' + fieldName ).hide( );
	}
}
