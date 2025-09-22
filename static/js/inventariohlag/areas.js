$(document).ready(function(){

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
            $('#areaname').focus();
            },
        close: function() {
            $("#id").val('');
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
    $('#areaname').val($('#nom'+id).val());
    $('#pais').val($('#pai'+id).val());
    };
    
function EditarRegistro(id){

	CampoEnabled("areaname");
    CampoEnabled("pais");
    PrepararRegistro(id);

    $("#diagedit").dialog({
        title: "Edit Area",
        buttons: [
            {
                text: "Save",
                click: function() {
                    EnviaPeticionAjax(EDITAR_REG,id);
                    $( this ).dialog("close");	
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

	CampoEnabled("areaname");
    CampoEnabled("pais");
    $('#id').val('');

    $("#diagedit").dialog({
        title: "Add Area",
        buttons: [
            {
                text: "Save",
                click: function() {
                    EnviaPeticionAjax(AGREGAR_REG,0);
                    $( this ).dialog("close");
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
    
    CampoDisabled("areaname");
    CampoDisabled("pais");
    PrepararRegistro(id);

    $("#diagedit").dialog({
        title: "Delete Area",
        buttons: [
            {
                text: "Delete",
                click: function() {
                    $( this ).dialog("close");
                    confirmarMensaje("The Area/Country will be removed from the Database.",EnviaPeticionAjax,ELIMINAR_REG,id);
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
    var areaname = $('#areaname option:selected').val();
    var pais = $('#pais option:selected').val();

    try {
        $.ajax({
            async: false,
			type: 'POST',
			dataType: "html",
            url: "/areas_listar/",
            data: {accion: accion, id: id, pais: pais, areaname: areaname, csrfmiddlewaretoken: $("input[name=csrfmiddlewaretoken]").val()},
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
