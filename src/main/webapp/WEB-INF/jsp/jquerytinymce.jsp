<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>
<html>
<head>
<title>Spring Web MVC, jQuery y TinyMCE</title>
<script type="text/javascript" src="<c:url value="/resources/jquery/jquery/1.6.2/jquery.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/tinymce/tiny_mce_jquery/3.4.5/jquery.tinymce.js" />"></script>
<script type="text/javascript">
	function ajaxSAVE() {
		var message = $('#notas').tinymce().getContent();
		$(function() {
			$.post("notas", {
				notas : message
			}, function(data) {
				$("#resultado").replaceWith(
						'<span id="resultado">' + data + '</span>');
			});
		});
	}
</script>

<script type="text/javascript">
	$().ready(
					function() {
						$('textarea.tinymce')
								.tinymce(
										{
											// Location of TinyMCE script
											script_url : "<c:url value="/resources/tinymce/tiny_mce/3.4.5/tiny_mce.js" />",

											language : "es", 

											// General options
											theme : "advanced",
											plugins : "autolink,lists,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,advlist",

											// Theme options save
											theme_advanced_buttons1 : "ajaxbuttonsave,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
											theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
											theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
											theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak",
											theme_advanced_toolbar_location : "top",
											theme_advanced_toolbar_align : "left",
											theme_advanced_statusbar_location : "bottom",
											theme_advanced_resizing : true,

											save_enablewhendirty : true,

											setup : function(ed) {
												// Add a custom button
												ed.addButton(
																'ajaxbuttonsave',
																{
																	title : 'Guardar',
																	image : '<c:url value="/resources/images/smiley-tongue-out.gif" />',
																	onclick : function() {
																		ajaxSAVE();
																	}
																});
											},

											// Format date and time
											plugin_insertdate_dateFormat : "%d/%m/%Y",
											plugin_insertdate_timeFormat : "%H:%M:%S"

										});
					});

	$("#notas").tinymce().focus();
</script>
</head>
<body>
	<div>
	<textarea id="notas" name="notas" rows="30" cols="80" style="width: 100%" class="tinymce">
		${message}
	</textarea>
	</div>
	Procesado
	<span id="resultado">Sin procesar</span>
</body>
</html>
