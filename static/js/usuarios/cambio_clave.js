$(document).ready(function(){

	$("#btncclavesfin").hide();
 
	$("#btncclavesfin").click(function (){
		$('#ModalcClave').modal('hide');
		if ($('#LoginModal').length || $('[name="LoginModal"]').length) 
			$('#LoginModal').modal('show');
		});

	$("#claveactual").blur(function (){  
		if ($('#claveactual').val() == "") {
			enviarMsgModalcClave("Falta Clave","Debe Indicar Clave Actual");
			efectoTemblor($('#ModalcClave'));
			}
		else {	
			limpiarMsgModalcClave();
			}
		});
	
	$("#nuevaclave").blur(function (){  
		if ($('#nuevaclave').val() == "") {
			enviarMsgModalcClave("Falta Clave","Debe Indicar Nueva Clave");
			efectoTemblor($('#ModalcClave'));
			}
		else {
			limpiarMsgModalcClave();
			}
		});

	$('#nuevaclave').keyup(function () {
		$('#strengthMessage').html(checkStrength($('#nuevaclave').val()));
		})

	$("#nuevaclaveconf").blur(function (){  
		if ($('#nuevaclaveconf').val() != $('#nuevaclave').val()) {
			enviarMsgModalcClave("Claves","Claves no coinciden");
			efectoTemblor($('#ModalcClave'));
			}
		else {
			limpiarMsgModalcClave();
			}
		});
	
	$("#btncclavesok").click(function (){    
		var claveactual = $('#claveactual').val();
		var nuevaclave1 = $('#nuevaclave').val();
		var nuevaclave2 = $('#nuevaclaveconf').val();
		var strength = $('#strength').val();

		if (claveactual == "") {
			enviarMsgModalcClave("Debe Indicar Clave Actual.");
			efectoTemblor($('#ModalcClave'));
			}
		else 
			if (nuevaclave1 == "") {
				enviarMsgModalcClave("Debe Indicar Nueva Clave.");
				efectoTemblor($('#ModalcClave'));
				}
			else
				if (nuevaclave1.length < 8) {
					enviarMsgModalcClave("Clave nueva debe tener al menos 8 Caracteres.");
					efectoTemblor($('#ModalcClave'));
					}
				else
					if (strength < 1) {
						enviarMsgModalcClave("Nueva Clave es Débil.");
						efectoTemblor($('#ModalcClave'));
						}
					else
						if (nuevaclave2 == "") {
							enviarMsgModalcClave("Debe Confirmar Nueva Clave");
							efectoTemblor($('#ModalcClave'));
							}
						else
							if (nuevaclave1 != nuevaclave2) {
								enviarMsgModalcClave("Claves no coinciden");
								efectoTemblor($('#ModalcClave'));
								}
							else {
								ConfirmaCambioClave();
								}
		});


	$('#ModalcClave').on('show.bs.modal', function () {
		$("#claveactual").val('');
		$("#nuevaclave").val('');
		$("#nuevaclaveconf").val('');
		limpiarMsgModalcClave();
		});
	
	$('#toggleclaveactual').click(function() {
		var passwordField = $('#claveactual');
		var passwordFieldType = passwordField.attr('type');
		
		if (passwordFieldType === 'password') {
			passwordField.attr('type', 'text');
			$(this).find('i').removeClass('fa-eye').addClass('fa-eye-slash');
			setTimeout(function() {
				passwordField.attr('type', 'password');
				$('#toggleclaveactual').find('i').removeClass('fa-eye-slash').addClass('fa-eye');
				}, 4000);
			} 
		});

	$('#toggleclavenueva').click(function() {
		var passwordField = $('#nuevaclave');
		var passwordFieldType = passwordField.attr('type');
		
		if (passwordFieldType === 'password') {
			passwordField.attr('type', 'text');
			$(this).find('i').removeClass('fa-eye').addClass('fa-eye-slash');
			setTimeout(function() {
				passwordField.attr('type', 'password');
				$('#toggleclavenueva').find('i').removeClass('fa-eye-slash').addClass('fa-eye');
				}, 4000);
			} 
		});


	});
//
// ********************************
//          Funciones
// ********************************
//
function ConfirmaCambioClave() {
	var username = $('#cclaveusername').val();
	var oldpassword = $('#claveactual').val();
	var newpassword = $('#nuevaclave').val();

	try {
		$.ajax({
			async: false,
			type: "POST",
			url: "/usuarios/confirmacambioclave/",
			dataType: 'json',
			data: {username: username,oldpassword: oldpassword, newpassword: newpassword, csrfmiddlewaretoken:  $("input[name=csrfmiddlewaretoken]").val()},
			beforeSend: function() {
				$('#loader-msg-wait').show();
				},
			complete: function() {
				$('#loader-msg-wait').hide();
				},
			success: function( response ) {
				if (response['status'] == 200){
					$("#btncclavesok").hide();
					$("#btncclavesko").hide();
					$("#btncclavesfin").show();
					enviarMsgModalcClave(response['message']);
					}
				else{
					enviarMsgModalcClave('Error('+response['status']+'):',response['message']);
					efectoTemblor($('#ModalcClave'));
					}
				},
			error: function(jqXHR, textStatus, errorThrown) {
				enviarMsgModalcClave("Error en Comunicación "+jqXHR+" "+textStatus+" "+errorThrown);
				}				
			});
		} 
	catch (error) {
		enviarMsgModalcClave(error);
		}
	}
	
function limpiarMsgModalcClave() {  

	$("#divmsgcclave1").text('');
	$("#divmsgcclave2").text(''); 
	$("#msgmodalcclave").hide();
	};
	
function enviarMsgModalcClave(msg1,msg2="") {

	$("#divmsgcclave1").text(msg1);
	$("#divmsgcclave2").text(msg2);  
	$('#msgmodalcclave').show();
	}
	
function checkStrength(password) {
	var strength = 0;

	$('#strength').val(strength);

	if (password.length < 8) {
		$('#strengthMessage').removeClass();
		$('#strengthMessage').addClass('Short');
		return 'Clave Inválida mínimo 8 Caracteres';
		}
	else {
		$('#strengthMessage').removeClass();
		$('#strengthMessage').addClass('Good');
		}

	// If it has numbers and characters, increase strength value.
	if (password.match(/([a-zA-Z])/) && password.match(/([0-9])/)) 
		strength += 1;
	// If it has one special character, increase strength value.
	if (password.match(/([!,%,&,@,#,$,^,*,?,_,~])/)) 
		strength += 1;
	// If it has two special characters, increase strength value.
	if (password.match(/(.*[!,%,&,@,#,$,^,*,?,_,~].*[!,%,&,@,#,$,^,*,?,_,~])/)) 
		strength += 1;
	// Calculated strength value, we can return messages
	// If value is less than 2
	$('#strength').val(strength);
	if (strength < 1) {
		$('#strengthMessage').removeClass();
		$('#strengthMessage').addClass('Weak');
		return 'Clave inválida. Requiere incluir números y letras.';
		} 
	else if (strength < 2) {
		$('#strengthMessage').removeClass();
		$('#strengthMessage').addClass('Good');
		return 'Clave Válida.';
		} 
	else {
		$('#strengthMessage').removeClass();
		$('#strengthMessage').addClass('Strong');
		return 'Clave Válida Fuerte.';
		}
	} 
