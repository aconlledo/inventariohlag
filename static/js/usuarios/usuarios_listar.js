$(document).ready(function(){

	try{
		var f100 = new LiveValidation('nombres');
		f100.add(Validate.Presence);
		} catch (e) {};
	try{
		var f102 = new LiveValidation('apellidos');
		f102.add(Validate.Presence);
		} catch (e) {};	
	try{
		var f103 = new LiveValidation('email');
		f103.add(Validate.Presence);
		} catch (e) {};

//
// Dialogo para Modificar Registro.
//	
	$("#diagedit").dialog({
		autoOpen: false,	 
		position: { my: "center", at: "center", of: window },
		height:650,
		width: 600,
		resizable: false,
		modal: true,  
		show: {
			effect: "blind",
			duration: 1000
			},
		hide: {
			effect: "explode",
			duration: 1000
			},
		open: function() {
			},
		close: function() {
			$("#username").val('');
			$("#nombres").val('');
			$("#apellidos").val('');
			$("#email").val('');
			$("#perfil").val(0);
			}
	});
//
// Dialogo para Modificar Password.
//	
	$("#passwdedit").dialog({
		autoOpen: false,	 
		position: { my: "center", at: "center", of: window },
		height: 350,
		width: 450,
		resizable: false,
		modal: true,  
		show: {
			effect: "blind",
			duration: 1000
		  	},
		hide: {
			effect: "explode",
			duration: 1000
		  	},
		open: function() {
			if(ACCION == AGREGAR_REG)
				VerificarRut();
			},
		close: function() {
			$("#txtPassword").val('');
			$("#txtConfirmPassword").val('');
			}
	});	

    $('#txtPassword').keyup(function () {
        $('#strengthMessage').html(checkStrength($('#txtPassword').val()));
	    })

	Crear_DataTable(); 

	});
//
// ********************************
//          Funciones
// ********************************
//
// Valida Campos
//
function CamposValidos(){

	var txtaux = allTrim($('#username').val());
	if (txtaux == "") 	{
		mostrarMensaje("You must indicate username",MSG_STOP);
		return false;
		}
	txtaux = allTrim($('#nombres').val());
	if (txtaux == "") 	{
		mostrarMensaje("You must indicate user first name",MSG_STOP);
		return false;
		}
	txtaux = allTrim($('#apellidos').val());
	if (txtaux == "") 	{
		mostrarMensaje("You must indicate user last name",MSG_STOP);
		return false;
		}
	txtaux = allTrim($('#email').val());
	if (txtaux == "") 	{
		mostrarMensaje("You must indicate user email",MSG_STOP);
		return false;
		}
	if (!validarCorreo(txtaux)) {
		mostrarMensaje("Email invalid",MSG_STOP);
		return false;
		}

	return true;
	};
//
// Abre Modal para Agregar registro de Persona (y usuario)
//		
function AgregarRegistro(){

    $("input").prop("readonly", false);
    $("input, textarea, select").prop("disabled", false);
	$('#id').val('');
	$("#perfil").val(0);
	$("#pais").val(1);
	CampoDisabled("estado");

	$("#diagedit").dialog({
		title: "Add User",
		buttons: [
			{
				text: "Save",
				click: function() {
					if (CamposValidos()) {
						EnviaPeticionAjax(AGREGAR_REG,0);
						$( this ).dialog("close");
						}
					},
				class:"ui-corner-all", style:"color:Green" 
			},
			{
				text: "Exit",
				click: function() {
					$( this ).dialog("close");
					},
				class:"ui-corner-all", style:"color:Black" 
			}
			]
		});

	$("#username").focus();
	$("#diagedit").dialog("open");
	};
//
// Abre Modal para Editar registro de Persona
//		
function EditarRegistro(id){

    $("input").prop("readonly", false);
    $("input, textarea, select").prop("disabled", false);
	CampoEnReadOnly("id");
	CampoDisabled("estado");

	PrepararRegistro(id);

	$("#diagedit").dialog({
		title: "Edit User",
		buttons: [
			{
				text: "Save",
				click: function() {
					if (CamposValidos()) {
						EnviaPeticionAjax(EDITAR_REG,id);
						$( this ).dialog("close");	
						}
					},
				class:"ui-corner-all", style:"color:Green" 
			},
			{
				text: "Exit",
				click: function() {
					$( this ).dialog("close");
					},
				class:"ui-corner-all", style:"color:Black" 
			}
			]
	  });
	  
	$("#username").focus();
	$("#diagedit").dialog("open");
	};
//
// Abre Modal para Ver detalle registro de usuario)
//		
function VerRegistro(id){

    $("input").prop("readonly", true);
    $("input, textarea, select").prop("disabled", true);

	PrepararRegistro(id);

	$("#diagedit").dialog({
		title: "View User",
		buttons: [
			{
				text: "Close",
				click: function() {
					$( this ).dialog("close");
					},
				class:"ui-corner-all", style:"color:Green" 
			}
			]
		});	

	$("#diagedit").dialog("open");
	};	
//
// Envia datos de Persona (o usuario) via ajax para un update o create
//		
function EnviaPeticionAjax(accion,id){
	var username = allTrim($('#username').val());
	var nombres = allTrim($('#nombres').val());
    var apellidos = allTrim($('#apellidos').val());
	var email = allTrim($('#email').val());
    var perfil = $('#perfil option:selected').val();
    var pais = $('#pais option:selected').val();
	var tipoactivo = $('#tipoactivo option:selected').val();

	try {
		$.ajax({
			async: false,
			type: "POST",
			url: "/usuarios/usuarios_listar/",
			data: {accion:accion, id:id, username:username, nombres:nombres, apellidos:apellidos, email:email, perfil:perfil, pais:pais, 
					tipoactivo:tipoactivo, csrfmiddlewaretoken: $("input[name=csrfmiddlewaretoken]").val()},
			success: function( response ) {
				if (response != ""){
					$('#datatablediv').html('');
					$("#datatablediv").html(response);
					Crear_DataTable();
					mostrarMensaje("Change made successfully",MSG_SUCCESS);
					}
				else
                    mostrarMensaje("UNKNOWN ERROR<br />Change NOT made",MSG_WARNING);
				}
			});
	} catch (error) {
		MensajeErrorDesconocido(error);
		}
	};
//
// Carga datos de un registro desde tabla de Personas
//	
function PrepararRegistro(id) {

	$.ajax({
		async: false,
		type: 'POST',
		dataType: 'json',
		url: "/usuarios/ver_persona/",
		data: {id: id, csrfmiddlewaretoken: $("input[name=csrfmiddlewaretoken]").val()},
		success: function( data ) {
			$("#id").val(data.id);
			$("#username").val(data.username);
			$("#nombres").val(data.nombres);
			$("#apellidos").val(data.apellidos);
			$("#email").val(data.email);
			$("#pais").val(data.pais);
			$("#estado").val(data.estado);
			$("#perfil").val(data.perfil);
			$("#tipoactivo").val(data.tipoactivo);
			},
		error: function(jqXHR, textStatus, errorThrown) {
			reject(errorThrown);
			}
		});

	};
//
// Envia mensaje para confirmar cambio de estado a Bloqueado. Si el usuario confirma se ira a funcion CambiarEstadoPersona()
//	
function BloquearRegistro(id){
	confirmarMensaje("The user will be Blocked and will NOT be able to use the System.",CambiarEstadoPersona,id,0);
	};
//
// Envia mensaje para confirmar cambio de estado a Desbloqueado. Si el usuario confirma se ira a funcion CambiarEstadoPersona()
//	
function DesBloquearRegistro(id){
	confirmarMensaje("The user will be Unlocked and will be able to use the System.",CambiarEstadoPersona,id,1);
	};
//
// Actualiza via ajax el estado de la persona (usuario)
//	
function CambiarEstadoPersona(id,estado){
   
	try {
		$.ajax({
			type: "POST",
			url: "/usuarios/cambiar_estado/",
			dataType: 'html',			
			data: {id: id, estado: estado, csrfmiddlewaretoken: $("input[name=csrfmiddlewaretoken]").val()},
			success: function( response ) {
				if (response != ""){
					$('#datatablediv').html('');
					$("#datatablediv").html(response);
					Crear_DataTable();
					mostrarMensaje("Change made successfully",MSG_SUCCESS);
					}
				else
                    mostrarMensaje("UNKNOWN ERROR<br />Change NOT made",MSG_WARNING);
				}
			});
	} catch (error) {
		MensajeErrorDesconocido(error);
		}
	};	
//
// Valida Password nueva
//
function PasswordValida() { 
	var txtaux1 = allTrim($('#txtPassword').val());
	if (txtaux1 == "") 	{
		mostrarMensaje("You must enter Password",MSG_STOP);
		return false;
		}	
	var txtaux2 = allTrim($('#txtConfirmPassword').val());
	if (txtaux2 == "") 	{
		mostrarMensaje("You must confirm your password.",MSG_STOP);
		return false;
		}
	if (txtaux1 != txtaux2) {
		mostrarMensaje("Password Does Not Match",MSG_STOP);
		return false;
		}
	if (txtaux1.length < 8) {
		mostrarMensaje("Password must have at least 8 characters",MSG_STOP);
		return false;
		}
	return true;
	};			
//  
// Abre modal para cambio de password
//	
function CambiarClave(id){

	$('#strengthMessage').html('');
	$('#strengthMessage').removeClass();

	$("#passwdedit").dialog({
		title: "Change User Password",
		buttons: [
			{
				text: "Save",
				click: function() {
					if (PasswordValida()) {
						EnviarPassword(id);
						$( this ).dialog("close");	
						}
					},
				class:"ui-corner-all", style:"color:Green" 
			},
			{
				text: "Exit",
				click: function() {
					$( this ).dialog("close");
					},
				class:"ui-corner-all", style:"color:Black" 
			}
			]
		});
	$("#passwdedit").dialog("open");
	};
//
// Envia via ajax nueva password del usuario
//
function EnviarPassword(id){

	try {
		$.ajax({
			type: "POST",
			dataType: 'json',
			url: "/usuarios/admin_cambia_password/",
			data: {id: id, password: allTrim($('#txtPassword').val()), csrfmiddlewaretoken: $("input[name=csrfmiddlewaretoken]").val()},
			success: function( response ) {
				if (response.status == 200)
					mostrarMensaje(response.message,MSG_SUCCESS);
				else
					mostrarMensaje(response.message+"<br />UNKNOWN ERROR<br />Change NOT made",MSG_WARNING);
				}
			});
	} catch (error) {
		MensajeErrorDesconocido(error);
		}
	};
//
// Crea DataTable para una lista de registros a recibir via ajax
//
function Crear_DataTable() {

	$('#tablaregs').DataTable ({
        paging: true,
        pagingType: 'full_numbers',
        bJQueryUI: true,
//        iDisplayLength: 25,
        order: [[0, 'asc']],
        columnDefs: [
			{ orderable: false, targets: [6] },
			{ searchable: false, targets: [6] }
            ]
        });

	$(".tip").tooltip();

	};

