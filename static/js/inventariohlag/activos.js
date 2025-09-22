$(document).ready(function(){

   var f100 = new LiveValidation('identificador');
   f100.add(Validate.Presence);   
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
        height: 600,
        width: 1300,
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
            $("#id").val('');
            }
        });  
         
    Crear_DataTable(); 

    });
//
// ********************************
//          Funciones
// ********************************
//
function Cargar_Modelos() {
    var fabricante = $('#fabricante option:selected').val();
//    alert("Fabricante="+fabricante)
    try {
        $.ajax({
            method: "POST",
            dataType:"html",
            url: "/tablas/selectmodelos/",
            data: {fabricante: fabricante, csrfmiddlewaretoken: $("input[name=csrfmiddlewaretoken]").val()},
            success: function( response ) {
//                alert(response)
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
                $('#identificador').val(activo.identificador);
                $('#nombre').val(activo.nombre);
                $('#modelo').val(activo.modelo);
                $('#fabricante').val(activo.fabricante);
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
                $('#location').val(activo.location);
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
    var identificador = allTrim($('#identificador').val());
    if (identificador == "") 	{
        mostrarMensaje("Debe indicar Identificador",MSG_STOP);
        return false;
        }
    return true;
    }; 
    
function VerRegistro(id){

    $("input").prop("readonly", true);
    $("input, textarea, select").prop("disabled", true)

    PrepararRegistro(id);

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

    $("input").prop("readonly", false);
    $("input, textarea, select").prop("disabled", false)
    CampoEnReadOnly("id");
    CampoEnReadOnly("fingreso");
    CampoEnReadOnly("fmodifica");
    PrepararRegistro(id);

    $("#diagedit").dialog({
        title: "Edit Asset",
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
    $("#diagedit").dialog("open");
    };

function AgregarRegistro(){
    var fcompra = $("#fcompra")[0]._flatpickr;
    fcompra.setDate(new Date(), true);
    var factivacion = $("#factivacion")[0]._flatpickr;
    factivacion.setDate(new Date(), true);
    var festado = $("#festado")[0]._flatpickr;
    festado.setDate(new Date(), true);

    $("input").prop("readonly", false);
    $("input, textarea, select").prop("disabled", false)
    CampoEnReadOnly("id");
    CampoEnReadOnly("fingreso");
    CampoEnReadOnly("fmodifica");
    $('#id').val('');
    $('#tipo').val('0');
    $('#identificador').val('');
    $('#nombre').val('');
    $('#modelo').val('');
    $('#fabricante').val('');
    $('#detalle').val('');
    $('#item').val('');
    $('#serial').val('');
    $('#proveedor').val('');
    $('#owner').val('0');
    $('#factura').val('');
    $('#vcompra').val('');
    $('#accounted').val('1');
    $('#vactual').val('');
    $('#location').val('1');
    $('#building').val('1');
    $('#floor').val('');
    $('#zona').val('1');
    $('#city').val('1');
    $('#country').val('0');
    $('#estado').val('0');
    $('#festado').val('');
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
            },
        ]
        });

    $("#diagedit").dialog("open");
    };
    
function BorrarRegistro(id){
    
    $("input").prop("readonly", true);
    $("input, textarea, select").prop("disabled", true)
    PrepararRegistro(id);

    $("#diagedit").dialog({
        title: "Delete Asset",
        buttons: [
            {
                text: "Delete",
                click: function() {
                    $( this ).dialog("close");
                    confirmarMensaje("El Activo será eliminado de la Base de Datos.",EnviaPeticionAjax,ELIMINAR_REG,id);
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
//    data.push({ name: "id", value: id });  // agrega el campo id manualmente   
    data.push({ name: "accion", value: accion });  // agrega el campo accion manualmente   
    data.push({ name: "csrfmiddlewaretoken", value: $("input[name=csrfmiddlewaretoken]").val() }); // agrega el token CSRF
    alert("id="+id);
    try {
        $.ajax({
            async: false,
            type: "POST",
            dataType: "html",
            url: "/modificaractivo/",
            data: $.param(data),  // convierte a querystring
            beforeSend: function() {
                $('#loader-msg-wait').show();
        	    },
            success: function (response) {
                $('#loader-msg-wait').hide();
                if (response) {
                    $("#datatablediv").html(response);
                    Crear_DataTable();
                    mostrarMensaje("Change made successfully", MSG_SUCCESS);
                } else 
                    mostrarMensaje("UNKNOWN ERROR<br />Change NOT made", MSG_WARNING);
                },
            error: function(jqXHR, textStatus, errorThrown) {
                $('#loader-msg-wait').hide();
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


function Crear_DataTable() {

    $('#tablaregs').DataTable ({
//        language: {url: '/static/js/datatables/datatables.es-CL.json'},
        destroy: true,
        paging: true,
        pagingType: 'full_numbers',
        bJQueryUI: true,
        iDisplayLength: 25,
        order: [[1, 'asc']],
        columnDefs: [
            { orderable: false, targets: [7] },
            { searchable: false, targets: [0,7] }
            ]
        });

    $(".tip").tooltip();
    
    };
