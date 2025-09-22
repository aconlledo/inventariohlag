$(document).ready(function(){

    var f100 = new LiveValidation('nombre');
    f100.add(Validate.Presence);     
    //
    // Dialogo para Modificar Registro.
    //	
    $("#diagedit").dialog({
        autoOpen: false,	 
        position: { my: "center", at: "center", of: window },
        height: 460,
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
            }
        });
       
    $('#pais').on("change", function(){
        Cargar_Ciudades();
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
    $('#ciudad').val($('#ciuid'+id).val());
    $('#pais').val($('#paisid'+id).val());
    };

function CamposValidos(){
    var nombre = allTrim($('#nombre').val());
    if (nombre == "") 	{
        mostrarMensaje("Must indicate Building Name",MSG_STOP);
        return false;
        }
    return true;
    }; 
    
function EditarRegistro(id){

	CampoEnReadWrite("nombre");
    CampoEnabled("ciudad");
    CampoEnabled("pais");
    PrepararRegistro(id);

    $("#diagedit").dialog({
        title: "Edit Building",
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

    $('#id').val('');
	CampoEnReadWrite("nombre");
    CampoEnabled("ciudad");
    CampoEnabled("pais");

    $("#diagedit").dialog({
        title: "Add Building",
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
    CampoDisabled("ciudad");
    CampoDisabled("pais");
    PrepararRegistro(id);

    $("#diagedit").dialog({
        title: "Delete Building",
        buttons: [
            {
                text: "Delete",
                click: function() {
                    $( this ).dialog("close");
                    confirmarMensaje("The Building will be removed from the Database.",EnviaPeticionAjax,ELIMINAR_REG,id);
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
    var ciudad = $('#ciudad').val();
    var pais = $('#pais').val();
    try {
        $.ajax({
            async: false,
			type: 'POST',
			dataType: "html",
            url: "/tablas/edificios/",
            data: {accion: accion, id: id, nombre: nombre, ciudad: ciudad, pais: pais, csrfmiddlewaretoken: $("input[name=csrfmiddlewaretoken]").val()},
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

function Cargar_Ciudades(seleccion) {
    var pais = $('#pais option:selected').val();
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
