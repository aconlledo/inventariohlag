$(document).ready(function(){

    var f100 = new LiveValidation('nombre');
    f100.add(Validate.Presence);     
    var f101 = new LiveValidation('codigo');
    f101.add(Validate.Presence); 
    //
    // Dialogo para Modificar Registro.
    //	
    $("#diagedit").dialog({
        autoOpen: false,	 
        position: { my: "center", at: "center", of: window },
        height:450,
        width: 500,
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
            $('#nombre').focus();
            },
        close: function() {
            $("#id").val('');
            $("#nombre").val('');
            $("#codigo").val('');
            }
        });
        
    CampoEnReadOnly("id");    
         
    Crear_DataTable(); 

    });
//
// ********************************
//          Funciones
// ********************************
//
function PrepararRegistro(id){
    $('#id').val(allTrim($('#id'+id).html()));
    $('#nombre').val(allTrim($('#nom'+id).html()));
    $('#codigo').val($('#iso'+id).html());
    $('#pais').val($('#paisid'+id).val());
    }; 

function CamposValidos(){
    var nombre = allTrim($('#nombre').val());
    if (nombre == "") 	{
        mostrarMensaje("Must indicate City Name",MSG_STOP);
        return false;
        }
    texto = allTrim($('#codigo').val());
    if (texto == "") 	{
        mostrarMensaje("Must indicate ISO Code",MSG_STOP);
        return false;
        }
    return true;
    }; 
    
function EditarRegistro(id){

	CampoEnReadWrite("nombre");
    CampoEnReadWrite("codigo");
    CampoEnabled("pais");
    PrepararRegistro(id);

    $("#diagedit").dialog({
        title: "Edit City",
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

	CampoEnReadWrite("nombre");
    CampoEnReadWrite("codigo");
    CampoEnabled("pais");
    $('#id').val('');

    $("#diagedit").dialog({
        title: "Add City",
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
    
    CampoEnReadOnly("nombre");
    CampoEnReadOnly("codigo");
    CampoDisabled("pais");
    PrepararRegistro(id);

    $("#diagedit").dialog({
        title: "Delete City",
        buttons: [
            {
                text: "Delete",
                click: function() {
                    $( this ).dialog("close");
                    confirmarMensaje("The City will be removed from the Database.",EnviaPeticionAjax,ELIMINAR_REG,id);
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

function EnviaPeticionAjax(accion,id){
    var nombre = allTrim($('#nombre').val());
    var codigo = allTrim($('#codigo').val());
    var pais = $('#pais').val();

    try {
        $.ajax({
            async: false,
			type: 'POST',
			dataType: "html",
            url: "/tablas/ciudades/",
            data: {accion: accion, id: id, nombre: nombre, codigo: codigo, pais: pais, csrfmiddlewaretoken: $("input[name=csrfmiddlewaretoken]").val()},
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
            { orderable: false, targets: [4] },
            { searchable: false, targets: [0,4] }
            ]
        });

    $(".tip").tooltip();
    
    };
