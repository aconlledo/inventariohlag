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
        height:380,
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
    $('#codigo').val($('#iso'+id).val());
    };

function CamposValidos(){
    var texto = allTrim($('#nombre').val());
    if (texto == "") 	{
        mostrarMensaje("Must indicate Model Name",MSG_STOP);
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
    PrepararRegistro(id);

    $("#diagedit").dialog({
        title: "Edit Country",
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
    $('#id').val('');

    $("#diagedit").dialog({
        title: "Add Country",
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
    PrepararRegistro(id);

    $("#diagedit").dialog({
        title: "Delete Country",
        buttons: [
            {
                text: "Delete",
                click: function() {
                    $( this ).dialog("close");
                    confirmarMensaje("The Country will be removed from the Database.",EnviaPeticionAjax,ELIMINAR_REG,id);
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
    var codigo = $('#codigo').val();
    try {
        $.ajax({
            async: false,
			type: 'POST',
			dataType: "html",
            url: "/tablas/paises/",
            data: {accion: accion, id: id, nombre: nombre, codigo: codigo, csrfmiddlewaretoken: $("input[name=csrfmiddlewaretoken]").val()},
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
            { orderable: false, targets: [3] },
            { searchable: false, targets: [0,3] }
            ]
        });

    $(".tip").tooltip();
    
    };
