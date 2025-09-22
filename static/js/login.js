$(document).ready(function(){
//
// Olvido clave
//
	$("#btnenviarolvidoclave").click(function (){    
		var username = $('#userlost').val();
		if (username == "") {
			enviarMsgModaloClave("Must Indicate a valid user");
			efectoTemblor($('#ModalOlvidoClave'));
			}
		else {
			ConfirmaOlvidoClave();
			}
		});

	$("#btncancelarolvidoclave").click(function (){    
		$('#ModalOlvidoClave').modal('hide');
		$('#LoginModal').modal('show'); 
		});
	
	$("#btnfinolvidoclave").click(function (){    
		$("#btnenviarolvidoclave").show();
		$("#btncancelarolvidoclave").show();
		$("#btnfinolvidoclave").hide();
		$('#ModalOlvidoClave').modal('hide');
		$('#LoginModal').modal('show'); 
		});

	$("#lnkolvidoclave").click(function (e){ 
		e.preventDefault();  
		$("#userlost").val('');
//		$("#btnenviarolvidoclave").prop('disabled', true);
		$("#btnfinolvidoclave").hide();
		limpiarMsgModaloClave(); 
		$('#LoginModal').modal('hide');
		$('#ModalOlvidoClave').modal({
			backdrop: 'static', // Impide el cierre por clic fuera del modal
			keyboard: false     // Impide el cierre por tecla Esc
			}).modal('show');
		});

	$('#claveuser').addClass('bi-eye');
	
	$('#togglePassword').click(function() {
		var passwordField = $('#claveuser');
		var passwordFieldType = passwordField.attr('type');
		
		if (passwordFieldType === 'password') {
			passwordField.attr('type', 'text');
			$(this).find('i').removeClass('bi-eye').addClass('bi-eye-slash');
			setTimeout(function() {
				passwordField.attr('type', 'password');
				$('#togglePassword').find('i').removeClass('bi-eye-slash').addClass('bi-eye');
				}, 3000);
			}
		});
//
// Login
//
	$('#formlogin').on('submit',function(event) {
		var username = $('#username').val();
		var password = allTrim($('#claveuser').val());
		event.preventDefault();
		limpiarMsgModalLogin();
		if (username == "") {
			enviarMsgModalLogin("You must enter a valid User.");
			efectoTemblor($('#LoginModal'));
			}
		else if (password == "") {
			enviarMsgModalLogin("You must enter a valid Password.");
			efectoTemblor($('#LoginModal'));
			}
		else {
			EnviarLogin(username,password);
			}
		});

	$('#LoginModal').modal({
		backdrop: 'static', // Impide el cierre por clic fuera del modal
		keyboard: false     // Impide el cierre por tecla Esc
		}).modal('show');
	
	});
//
// ********************************
//          Funciones
// ********************************
// 
// Olvido Password
//
function ValidarLogin() {
	var username = $('#useroclave').val();
	try {
		$.ajax({
			type: "POST",
			url: "validarlogin/", 
			dataType: 'json',
			data: {username: username, csrfmiddlewaretoken:  $("input[name=csrfmiddlewaretoken]").val()},
			success: function( response ) {
				if (response['status'] == 200){
					$("#btnenviarolvidoclave").prop('disabled', false);
					enviarMsgModaloClave("Confirm the sending of mail with new password to ",response['message']);
					}
				else{
					enviarMsgModaloClave('Error('+response['status']+')',response['message']);
					efectoTemblor($('#ModalOlvidoClave'));
					}
				},
			error: function(jqXHR, textStatus, errorThrown) {
				enviarMsgModaloClave(textStatus);
				}				
			});
		} 
	catch (error) {
		enviarMsgModaloClave(error);
		}
	}

function ConfirmaOlvidoClave() {
    var usuario = $('#userlost').val();

    $.ajax({
        type: "POST",
        url: "/usuarios/confirmaolvidoclave/",
        dataType: 'json',
        data: {
            username: usuario,
            csrfmiddlewaretoken: $("input[name=csrfmiddlewaretoken]").val()
        	},
        beforeSend: function() {
            $('#loader-msg-wait').show();
        	},
        success: function(response) {
            $('#loader-msg-wait').hide();
            if (response.status === 200) {
                mostrarModalOlvidoClave({
                    mensaje: "New Password Created: " + response.message,
                    botones: ["end"]
                	});
            	} 
			else {
                mostrarModalOlvidoClave({
                    mensaje: response.message,
                    botones: ["send", "cancel"],
                    temblar: true
                	});
            	}
        	},
        error: function(jqXHR, textStatus, errorThrown) {
            $('#loader-msg-wait').hide();
            let msg = jqXHR.responseJSON && jqXHR.responseJSON.message
                      ? jqXHR.responseJSON.message
                      : (errorThrown || textStatus);
            mostrarModalOlvidoClave({
                mensaje: msg,
                botones: ["send", "cancel"],
                temblar: true
            	});
        	}
    	});
	}

function mostrarModalOlvidoClave(opciones) {
    $('#ModalOlvidoClave').modal('show');
    enviarMsgModaloClave(opciones.mensaje);
    $("#btnenviarolvidoclave").toggle(opciones.botones.includes("enviar"));
    $("#btncancelarolvidoclave").toggle(opciones.botones.includes("cancelar"));
    $("#btnfinolvidoclave").toggle(opciones.botones.includes("fin"));

    if (opciones.temblar) {
        efectoTemblor($('#ModalOlvidoClave'));
    	}
	}


function limpiarMsgModaloClave() {  

	$("#divmsgoclave1").text('');
	$("#divmsgoclave2").text(''); 
	$("#divmsgoclave").hide();
	};

function enviarMsgModaloClave(msg1,msg2="") {

	$("#divmsgoclave1").text(msg1);
	$("#divmsgoclave2").text(msg2);  
	$('#divmsgoclave').show();
	}
		
function limpiarCamposModalLogin() {  

	$('#username').val('');
	$('#claveuser').val('');
	};
//
// Login
//
function EnviarLogin(username,password) {

	try {
		$.ajax({
			type: "POST",
			async: false,
			url: "/usuarios/login_general/", 
			dataType: 'json',
			data: {username: username, password: password, csrfmiddlewaretoken:  $("input[name=csrfmiddlewaretoken]").val()},
			beforeSend: function() {
				$('#cclaveusername').val(username);
				},
			success: function( response ) {
				if (response['status'] == 200){ 
					$('#LoginModal').hide();
					$('#formlogin').attr('action', response.url);
					$('#formlogin')[0].submit();
					}
				else{
					if (response['status'] == 201){
						$('#strengthMessage').html('');
						$('#LoginModal').modal('hide');
						$('#ModalcClave').modal({
							backdrop: 'static', // Impide el cierre por clic fuera del modal
							keyboard: false     // Impide el cierre por tecla Esc
							}).modal('show');
						$("#btncclavesko").click(function (){
							$('#ModalcClave').modal('hide');
							$('#LoginModal').modal('show');
							});
						}
					else {
						enviarMsgModalLogin(response['message1'],response['message2']);
						efectoTemblor($('#LoginModal'));
						}
					}
				},
			error: function(jqXHR, textStatus, errorThrown) {
				enviarMsgModalLogin('Error: ',textStatus);
				}				
			});
		} 
	catch (error) {
		enviarMsgModalLogin(error);
		}
	}

function limpiarMsgModalLogin() {  

	$("#divloginerror1").text('');
	$("#divloginerror2").text(''); 
	$("#divloginerror").hide();
	};

function enviarMsgModalLogin(msg1,msg2="") {

	$("#divloginerror1").text(msg1);
	$("#divloginerror2").text(msg2);  
	$('#divloginerror').show();
    }
