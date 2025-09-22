$(document).ready(function(){

    var f100 = new LiveValidation('rut');
    f100.add(Validate.Presence);
    var f101 = new LiveValidation('ppu');
    f101.add(Validate.Presence);
    var f102 = new LiveValidation('agno');
    f102.add(Validate.Presence);
    f102.add(Validate.Numericality);

    $('#rut').blur(function(){
        if ($('#rut').val().trim() != "") {
            if (validarRUT('rut',false)) {
                TraerInfoDueno();
                $('#ppu').focus();
                }
            else {
                $('#rut2').val('');
                mostrarMensaje("Debe indicar R.U.T. Válido",MSG_WARNING);
                }
        }
    });

    $('#ppu').blur(function(){
        var ppu = $('#ppu').val().trim();
        if (ppu != "") {
            ppu = ppu.substring(0, 6);
            if (ppuValidar(ppu)) {
                dig = ppuDigito(ppu);
                $('#ppu').val(ppu+'-'+dig);
                verificarExistePPU();
                }
            else
                mostrarMensaje("Formato Planca Patente Inválido",MSG_WARNING);
            }
        });

    $('#marca').on("change", function(){
        if ($('#marca option:selected').val() == "0")
//            $('#modelo option').not('[value="0"]').remove();
            $('#modelo').val('0');
        else
    		Cargar_Modelos();
		});	
    //
    // Dialogo para Modificar Registro.
    //	
    $("#diagedit").dialog({
        autoOpen: false,	 
        position: { my: "center", at: "center", of: window },
        height:650,
        width: 550,
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
            $('#rut').focus();
            $("#diagedit").parent().find("button:contains('Grabar')").prop("disabled", true);
            },
        close: function() {
            $("#id").val('');
            $("#rut").val('');            
            $("#rut2").val('');
            $("#iddueno").val('');
            $("#dueno").val('');
            $("#ppu").val('');
            $("#agno").val('');
            $("#nummotor").val('');
            $("#numchasis").val('');
            $("#numserie").val('');
            $("#vin").val('');
            $("#marca").val('0');
            $('#modelo').val('0');
//            $('#modelo option').not('[value="0"]').remove();
            $("#color option:selected").each(function(){
                $(this).removeAttr("selected");
                });

            }
        });
        
    CampoEnReadOnly("id");  
    CampoEnReadOnly("dueno");    

    Crear_DataTable(); 
    
    });
//
// ********************************
//          Funciones
// ********************************
//

function CamposValidos(){
	var txtaux = allTrim($('#rut').val());

	if (txtaux == "") 	{
		mostrarMensaje("Debe indicar R.U.T.",MSG_WARNING);
		$('#rut2').val('');
		return false; 
		}
	txtaux = $('#rut2').val();
	if (txtaux == "") 	{
		mostrarMensaje("Verifique el R.U.T por favor",MSG_WARNING);
		return false;
		}

    if ($('#ppu').val() == "") 	{
		mostrarMensaje("Debe indicar Placa Patente",MSG_WARNING);
		return false; 
		}

    if ($('#marca option:selected').val() == "0"){
		mostrarMensaje("Debe Seleccionar Marca",MSG_WARNING);
		return false;   
        }

    if ($('#modelo option:selected').val() == "0"){
		mostrarMensaje("Debe Seleccionar Modelo",MSG_WARNING);
		return false;   
        }

    return true;
    };
    
function EditarRegistro(id){

    TraerRegistro(id);
    CampoEnReadWrite("rut");
	CampoEnReadWrite("ppu");
    CampoEnReadWrite("agno");
    CampoEnReadWrite("nummotor");
    CampoEnReadWrite("numchasis");
    CampoEnReadWrite("numserie");
    CampoEnReadWrite("vin");
    CampoEnabled("marca");
    CampoEnabled("modelo");
    CampoEnabled("color");

    $("#diagedit").dialog({
        title: "Editar Vehículo",
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
//	$("#diagedit").dialog( "option", "classes.ui-dialog", "highlight" );
    $("#diagedit").dialog("open");
    };

function AgregarRegistro(){

	CampoEnReadWrite("rut");
	CampoEnReadWrite("ppu");
    CampoEnReadWrite("agno");
    CampoEnReadWrite("nummotor");
    CampoEnReadWrite("numchasis");
    CampoEnReadWrite("numserie");
    CampoEnReadWrite("vin");
    CampoEnabled("marca");
    CampoEnabled("modelo");
    CampoEnabled("color");
    
    $('#id').val('');

    $("#diagedit").dialog({
        title: "Agregar Vehículo",
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
        
    TraerRegistro(id);
    CampoEnReadOnly("rut");
	CampoEnReadOnly("ppu");
    CampoEnReadOnly("agno");
    CampoEnReadOnly("nummotor");
    CampoEnReadOnly("numchasis");
    CampoEnReadOnly("numserie");
    CampoEnReadOnly("vin");
    CampoDisabled("marca");
    CampoDisabled("modelo");
    CampoDisabled("color");
    
    $("#diagedit").dialog({
        title: "Eliminar Vehículo",
        buttons: [
            {
                text: "Eliminar",
                click: function() {
                    $( this ).dialog("close");
                    confirmarMensaje("El Registro será eliminado de la Base de Datos.",EnviaPeticionAjax,ELIMINAR_REG,id);
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
     $("#diagedit").parent().find("button:contains('Eliminar')").prop("disabled", false);
    };


function EnviaPeticionAjax(accion,id){

    var iddueno = $('#iddueno').val();
    var ppu = allTrim($('#ppu').val());
    var agno = allTrim($('#agno').val());
    var nummotor = allTrim($('#nummotor').val());
    var numchasis = allTrim($('#numchasis').val());
    var numserie = allTrim($('#numserie').val());
    var vin = allTrim($('#vin').val());
    var modelo = $('#modelo option:selected').val();
    var color = $('#color option:selected').val();

    try {
        $.ajax({
            type: "POST",
            async: false,
            url: "/admintaller/vehiculos_modificar/",
            data: {accion:accion,id:id,ppu:ppu,agno:agno,nummotor:nummotor,numchasis:numchasis,numserie:numserie,vin:vin, 
                    iddueno:iddueno,modelo:modelo,color:color, csrfmiddlewaretoken: $("input[name=csrfmiddlewaretoken]").val()},
            success: function(response) {
                if (response.substring(0,5) == "ERROR")
                    mostrarMensaje(response,MSG_WARNING); 
                else {
                    $('#datatablediv').html('');
                    $("#datatablediv").html(response);
                    Crear_DataTable();
                    mostrarMensaje("Change made successfully",MSG_SUCCESS);                       
                    }
                }
            });
    } catch (error) {
		MensajeErrorDesconocido(error);
        }
    };

    
function TraerRegistro(id){

    try {
        $.ajax({
            type: "POST",
            async: false,
            dataType: "json",
            url: "/admintaller/vehiculo_leer/",
            data: {id: id, csrfmiddlewaretoken: $("input[name=csrfmiddlewaretoken]").val()},
            success: function( response ) {
                if (response.context['status'] == 200){
                    $('#id').val(id);
                    $('#rut').val(response.vehiculo['rut']);
                    $('#iddueno').val(response.vehiculo['iddueno']);
                    $('#dueno').val(response.vehiculo['dueno']);
                    $('#ppu').val(response.vehiculo['ppu']);
                    $('#agno').val(response.vehiculo['agno']);
                    $('#nummotor').val(response.vehiculo['nummotor']); 
                    $('#numchasis').val(response.vehiculo['numchasis']);
                    $('#numserie').val(response.vehiculo['numserie']);
                    $('#vin').val(response.vehiculo['vin']);
                    $('#marca').val(response.vehiculo['marca']);
                    $('#modelo').val(response.vehiculo['modelo']);
                    $('#color').val(response.vehiculo['color']);
                    }
                else
                    mostrarMensaje("ERROR("+response.context['status']+") "+response.context['message'],MSG_WARNING);
                }
            });
    } catch (error) {
		MensajeErrorDesconocido(error);
        }
    };


function TraerInfoDueno(){
    var rut = $('#rut').val();
    $('#rut2').val(rut);

    try {
        $.ajax({
            type: "POST",
            async: false,
            dataType: "json",
            url: "/admintaller/persona_id_rut/",
            data: {rut: rut, csrfmiddlewaretoken: $("input[name=csrfmiddlewaretoken]").val()},
            success: function( response ) {
                if (response.context['status'] == 200){
                    $('#iddueno').val(response.persona['id']);
                    $('#dueno').val(response.persona['dueno']);
                    }
                else {
                    if (response.context['status'] == 404){
                        mostrarMensaje(response.context['message'],MSG_WARNING);
                        }
                    else
                        mostrarMensaje("ERROR("+response.context['status']+") "+response.context['message'],MSG_WARNING);
                    }
                }
            });
    } catch (error) {
		MensajeErrorDesconocido(error);
        }
    };

function verificarExistePPU(){
    var ppu = $('#ppu').val();

    try {
        $.ajax({
            type: "POST",
            async: false,
            dataType: "json",
            url: "/admintaller/vehiculo_verifica_ppu/",
            data: {ppu: ppu, csrfmiddlewaretoken: $("input[name=csrfmiddlewaretoken]").val()},
            success: function( response ) {
                if (response.context['status'] == 200) {
                    mostrarMensaje(response.context['message'],MSG_WARNING);
                    $("#diagedit").parent().find("button:contains('Grabar')").prop("disabled", true);
                    }
                else {
                    if (response.context['status'] == 400) {
                        $("#diagedit").parent().find("button:contains('Grabar')").prop("disabled", false);
                        }
                    else 
                        mostrarMensaje("ERROR("+response.context['status']+") "+response.context['message'],MSG_WARNING);
                    }
                }
            });
    } catch (error) {
		MensajeErrorDesconocido(error);
        }
    };


function Crear_DataTable() {

    $('#tablaregs').DataTable ({
        language: {url: '/static/js/datatables/datatables.es-CL.json'},
        destroy: true,
        paging: true,
        pagingType: 'full_numbers',
        bJQueryUI: true,
        iDisplayLength: 25,
        order: [[1, 'asc']],
        columnDefs: [
            { orderable: false, targets: [0,2,6] },
            { searchable: false, targets: [0,6] }
            ]
        });

    $(".tip").tooltip();

    }

function Cargar_Modelos() { 
	var marca = $('#marca option:selected').val();

	$.ajax({
		url: "/tablas/selectmodelos/",
		data: {marca: marca},
		type: 'GET',
		dataType: 'html',
		success: function(response) {
			$('#divmodelos').html(response);
			},
		error: function(jqXHR, textStatus, errorThrown) {
			MensajeErrorDesconocido('Hubo un problema(2) con la solicitud:', textStatus, errorThrown);
			}
		}); 
	};
