$(document).ready(function(){

    var f100 = new LiveValidation('newid');
    f100.add(Validate.Presence);   
    var f101 = new LiveValidation('nombre');
    f101.add(Validate.Presence);   
    //
    // Dialogo para Modificar Registro.
    //	

    $("#fcompra").flatpickr({
		enableTime: false,
		dateFormat: "d-m-Y",
//		maxDate: new Date(new Date().setFullYear(new Date().getFullYear() - 18)),
//		defaultDate: new Date(new Date().setFullYear(new Date().getFullYear() - 18)),
        defaultDate: "today",
		locale: "es",
    	});

    $("#factivacion").flatpickr({
		enableTime: false,
		dateFormat: "d-m-Y",
        defaultDate: "today",
		locale: "es",
    	});

    $("#festado").flatpickr({
		enableTime: false,
		dateFormat: "d-m-Y",
        defaultDate: "today",
		locale: "es",
    	});

    $('#fabricante').on("change", function(){
        Cargar_Modelos();
        });

    $("#diagedit").dialog({
        autoOpen: false,	 
        position: { my: "center", at: "center", of: window },
        height: 750,
        width: 1300,
        resizable: false,
        modal: true,  
        show: {
            effect: "blind",
            duration: 10
                },
        hide: {
            effect: "blind",
            duration: 5
                },
        open: function() {

            },
        close: function() {
            $("#id").val('');
            $('#newid').val('')
            $('#activeidMessage').removeClass();
		    $('#activeidMessage').html('');
            }
        });  

    $("#viewqr").dialog({ 
        autoOpen: false,	 
        position: { my: "center", at: "center", of: window },
        height: 550,
        width: 750,
        resizable: false,
        modal: true,  
        show: {
            effect: "blind",
            duration: 10
                },
        hide: {
            effect: "blind",
            duration: 10
                },
        open: function() {

            },
        close: function() {
            $('#qrimg').attr('src', "#");
            }
        });  


    $('#newid').keyup(function () {
        $('#activeidMessage').removeClass();
		$('#activeidMessage').html('');
		}) 

    $('#country').on("change", function() {
        CargarCiudades();
		});	

    $('#tipo').on('blur', function() {
        tipoBlurHandler();
		});	

    Crear_DataTable(); 

    });
//
// ********************************
//          Funciones
// ********************************
//
   
function BloquearInputs() {
    $(".inputdata").prop("readonly", true).css("background-color", "#F0EAE9");
    $(".inputtextarea, .inputselect").prop("disabled", true).css("background-color", "#F0EAE9");
    }

function VerQR(id) {

    $("#viewqr").dialog({
        title: "Asset QR Code",
        buttons: [
            {
                text: "Exit",
                click: function() {
                    $( this ).dialog("close");
                    },
                class:"ui-corner-all", style:"color:Black" 
            }
            ]
        });
    $("#viewqr").dialog("open");

    $.ajax({
        async: false,
        type: 'POST',
        dataType: "json",
        url: "/ver_qr/",
        data: {id: id, csrfmiddlewaretoken: $("input[name=csrfmiddlewaretoken]").val()},
        success: function(response) {
            var context = response.context;
            if  (context.status == 200) { 
                $('#qrimg').attr('src', context.qr_url);
            } else {
                mostrarMensaje(context.message,2)
            }
        },
        error: function() {
            MensajeErrorDesconocido(context.status);
        }
    });
}


function tipoBlurHandler() {
    var tipo = $('#tipo').val();
    $('#activeidMessage').removeClass();
    $('#activeidMessage').html('');

    $.ajax({
        async: false,
        type: 'POST',
        dataType: "json",
        url: "/checklastid/",
        data: {tipo: tipo, csrfmiddlewaretoken: $("input[name=csrfmiddlewaretoken]").val()},
        success: function( response ) {
            var context = response.context;
            if  (context.status == 200) { 
                $('#newid').val(context.newid);
                }
            else{ 
		        MensajeErrorDesconocido(context.status);
                }
            }
        });
    };

function PrepararRegistro(id){

    try {
        $.ajax({
            async: false,
			type: 'POST',
			dataType: "json",
            url: "/leeractivo/",
            data: {id: id, csrfmiddlewaretoken: $("input[name=csrfmiddlewaretoken]").val()},
            success: function( response ) {
                var context = response.context
                if  (context.status == 200) {
                    var activo = response.registro;
                    $('#id').val(activo.id);
                    $('#tipo').val(activo.tipo);
                    $('#newid').val(activo.newid);
                    $('#nombre').val(activo.nombre);
                    $('#modelo').val(activo.modelo);
                    $('#fabricante').val(activo.fabricante);
                    $('#sku').val(activo.sku);
                    $('#detalle').val(activo.detalle);
                    $('#serial').val(activo.serial);
                    $('#proveedor').val(activo.proveedor);
                    $('#owner').val(activo.owner);
                    $('#factura').val(activo.factura);
                    $('#fcompra').val(activo.fcompra);
                    $('#vcompra').val(activo.vcompra);
                    $('#factivacion').val(activo.factivacion);
                    $('#accounted').val(activo.accounted);
                    $('#vactual').val(activo.vactual);
                    $('#building').val(activo.building);
                    $('#floor').val(activo.floor);
                    $('#zona').val(activo.zona);
                    $('#city').val(activo.city);
                    $('#country').val(activo.country);
                    $('#estado').val(activo.estado);
                    $('#festado').val(activo.festado);
                    $('#usuarioinv').val(activo.usuarioinv);
                    $('#fingreso').val(activo.fingreso);
                    $('#fmodifica').val(activo.fmodifica);
                    }
                else
                    mostrarMensaje(context.message,MSG_WARNING);
                }
            });
    } catch (error) {
		MensajeErrorDesconocido(error);
        }

    };

function CamposValidos(){
    var newid = allTrim($('#newid').val());
    if (newid == "") 	{
        mostrarMensaje("Must Indicate Active Identifier!!!",MSG_STOP);
        return false;
        }
    return true;
    }; 
    

function VerRegistro(id){
    BloquearInputs();
    PrepararRegistro(id);
//    $('#newid').off('blur', newid);
    $("#diagedit").dialog({
        title: "View Asset",
        buttons: [
            {
                text: "Exit",
                click: function() {
                    $( this ).dialog("close");
                    },
                class:"ui-corner-all", style:"color:Black" 
            }
            ]
        });
    $("#diagedit").dialog("open");
    };

function EditarRegistro(id){

    $("input").prop("readonly", false).css("background-color", "#FFFFFF");
    $("textarea, select").prop("disabled", false).css("background-color", "#FFFFFF");;
    CampoEnReadOnly('id');
    CampoEnReadOnly('tipo');
    CampoEnReadOnly('newid');
    CampoEnReadOnly('fingreso');
    CampoEnReadOnly('fmodifica');
    PrepararRegistro(id);

    $("#diagedit").dialog({
        title: "Edit Asset",
        buttons: [
            {
                text: "Save",
                click: function() {
                    if (CamposValidos()) {
                        $( this ).dialog("close");	
                        mensajeWorking();
                        setTimeout(function() {
                            EnviaPeticionAjax(EDITAR_REG, id);
                            }, 100); 
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
    $("#diagedit").on("dialogopen", function() {
        $('#nombre').focus();
        });
    $("#diagedit").dialog("open");

    };

function AgregarRegistro(){
    var fcompra = $("#fcompra")[0]._flatpickr;
    fcompra.setDate(new Date(), true);
    var factivacion = $("#factivacion")[0]._flatpickr;
    factivacion.setDate(new Date(), true);
    var festado = $("#festado")[0]._flatpickr;
    festado.setDate(new Date(), true);

//    $('#newid').on('blur', newid);
    BloquearInputs();
    $("#nombre").prop("readonly", false).css("background-color", "#FFFFFF");
    $("#tipo").prop("disabled", false).css("background-color", "#FFFFFF");
    $('#tipo').prop('selectedIndex', 0);

    $('#id').val('');
    $('#newid').val('');
    $('#nombre').val('');
    $('#modelo').val('');
    $('#fabricante').val('');
    $('#sku').val('');
    $('#detalle').val('');
    $('#item').val('');
    $('#serial').val('');
    $('#proveedor').val('');
    $('#owner').val('0');
    $('#factura').val('');
    $('#vcompra').val('');
    $('#accounted').val('1');
    $('#vactual').val('');
    $('#building').val('1');
    $('#floor').val('');
    $('#zona').val('1');
    $('#city').val('1');
    $('#country').val('1');
    $('#estado').val('0');
    $('#festado').val(fechadehoy());
    $('#usuarioinv').val('23');
    $('#fingreso').val('');
    $('#fmodifica').val('');

    $("#diagedit").dialog({
        title: "Add Asset",
        buttons: [
            {
                text: "Save",
                click: function() {
                    if (CamposValidos()) {
                        $( this ).dialog("close");	
                        mensajeWorking();
                        setTimeout(function() {
                            EnviaPeticionAjax(AGREGAR_REG, 0);
                            }, 100);
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
            },
        ]
        });
    $("#diagedit").on("dialogopen", function() {
        $('#tipo').focus();
    });
    $("#diagedit").dialog("open");

    };
    
function BorrarRegistro(id){
    
    BloquearInputs();
    PrepararRegistro(id);

    $("#diagedit").dialog({
        title: "Delete Asset",
        buttons: [
            {
                text: "Delete",
                click: function() {
                    $( this ).dialog("close");
                    confirmarMensaje("Asset wil be Deleted from Data Base.",EnviaPeticionAjax,ELIMINAR_REG,id);
                    },
                class:"ui-corner-all", style:"color:Red" 
            },
            {
                text: "Exit",
                click: function() {
                    $( this ).dialog("close");
                    },
                class:"ui-corner-all", style:"color:Green" 
            }
            ]
        });	
    $("#diagedit").dialog("open");
    };

function EnviaPeticionAjax(accion, id) {

    let data = $("#diagedit :input").map(function () {    // toma todos los inputs/select/textarea dentro de #diagedit
        let valor = $(this).val();
        if (typeof valor === "string") {
            valor = valor.trim();   // aplica trim automático
            }
        return { name: this.name || this.id, value: valor };  // usa name si existe, si no el id
        }).get();
//    data = data.filter(item => item.name !== "id");
    data.push({ name: "id", value: id });  // agrega el campo id manualmente   
    data.push({ name: "accion", value: accion });  // agrega el campo accion manualmente   
    data.push({ name: "csrfmiddlewaretoken", value: $("input[name=csrfmiddlewaretoken]").val() }); // agrega el token CSRF

    try {
        $.ajax({
            async: false,
            type: "POST",
            dataType: "html",
            url: "/modificaractivo/",
            data: $.param(data),  // convierte a querystring
            beforeSend: function() {
        	    },
            success: function (response) {
                $.LoadingOverlay("hide");
                if (response) {
                    Crear_DataTable();
                    mostrarMensaje("Change made successfully", MSG_SUCCESS);
                } else 
                    mostrarMensaje("UNKNOWN ERROR<br />Change NOT made", MSG_WARNING);
                },
            error: function(jqXHR, textStatus, errorThrown) {
                $.LoadingOverlay("hide");
                let msg = jqXHR.responseJSON && jqXHR.responseJSON.message
                        ? jqXHR.responseJSON.message
                        : (errorThrown || textStatus);
                mostrarMensaje("UNKNOWN ERROR"+msg, MSG_WARNING);;
                }            
        });
    } catch (error) {
        MensajeErrorDesconocido(error);
        }
}

function Cargar_Modelos() {
    var fabricante = $('#fabricante option:selected').val();

    try {
        $.ajax({
            method: "POST",
            dataType:"html",
            url: "/tablas/selectmodelos/",
            data: {fabricante: fabricante, csrfmiddlewaretoken: $("input[name=csrfmiddlewaretoken]").val()},
            success: function( response ) {
                if (response != ""){
                    $('#divmodelos').html('');
                    $("#divmodelos").html(response);
                    }
                else
                    mostrarMensaje("UNKNOW ERROR",MSG_WARNING);
                }
            });
    } catch (error) {
        MensajeErrorDesconocido(error);
        }
    };

function Cargar_Ciudades(seleccion) {
    var pais = $('#country option:selected').val();
    try {
        $.ajax({
            method: "POST",
            dataType:"html",
            url: "/tablas/selectciudades/",
            data: {pais: pais, csrfmiddlewaretoken: $("input[name=csrfmiddlewaretoken]").val()},
            success: function( response ) {
                if (response != ""){
                    $('#divciudades').html('');
                    $("#divciudades").html(response);
                    $('#ciudad').attr({id: 'city',name: 'city'});
                    }
                else
                    mostrarMensaje("UNKNOWN ERROR<br />Change NOT made",MSG_WARNING);
                }
            });
    } catch (error) {
        MensajeErrorDesconocido(error);
        }
    };

function Crear_DataTable() {

    $('#tablaregs').DataTable ({
        destroy: true,
        paging: true,
        pagingType: 'full_numbers',
        bJQueryUI: true,
        iDisplayLength: 25,
        columnDefs: [
            { orderable: false, targets: [7] },
            { searchable: false, targets: [0,7] }
            ]
        });

    $(".tip").tooltip();
    
    };
