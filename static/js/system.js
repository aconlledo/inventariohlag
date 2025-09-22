//
// ********************************
// Funciones jquery Generales
// ********************************
//

const MaxNum = 999999999999;   	// 999.999.999.999
const MaxMon = 9999999999; 		// 9.999.999.999
const IVA = 0.19;  				// Tasa IVA

const DIGITOSVENTAS = 2;
const DIGITOSCOSTOS = 4;
const DIGITOSCANTIDAD = 4;
const DIGITOSPORCENTAJE = 2;

const MSG_SUCCESS = 0;
const MSG_WARNING = 1;
const MSG_STOP = 2;

const ELIMINAR_REG = 0;
const AGREGAR_REG = 1;
const EDITAR_REG = 2;
const VER_REG = 3;
const BLOQUEAR_REG = 4;
const DESBLOQUEAR_REG = 5;


var ACCION = EDITAR_REG;

var idGlobal1 = 0;
var idGlobal2 = 0;
var idGlobal3 = 0;
var idGlobal4 = 0;

// proximahora.funciones  class Constantes
const REGIONMETRO = 13

$(document).ready(function(){

	$(window).resize(function () {
		fluidDialog();
		});

	$(document).on("dialogopen", ".ui-dialog", function (event, ui) {
		fluidDialog();
		}); 

	$(".tip").tooltip();

	$('input').addClass("ui-corner-all");
	
	$(".uppcase").blur(function(){
		if ($('#chk_upper').length) {
			if ($("#chk_upper").is(':checked'))
				$(this).val($(this).val().toUpperCase());
			}
		else
			$(this).val($(this).val().toUpperCase());
		});

	$(".lowcase").blur(function(){
		$(this).val($(this).val().toLowerCase());
		});
	
	$(".ucword").blur(function(){
		$(this).val($(this).val().ucwords());
		});	
	
	});
//
// ********************************
//          Funciones
// ********************************
//
// Funciones relacionadas con lista de telefonos
//

function CrearListaFono(campofono) { 
	const fono = document.querySelector(campofono);

	const iti = window.intlTelInput(fono, {
		initialCountry: "auto", 
		geoIpLookup: function (callback) {
		fetch('https://ipinfo.io/json?token=184b70b2b3b7b5') 
			.then(response => response.json())
			.then(data => {
				const countryCode = data.country || "cl";
				callback(countryCode);
				})
			.catch(() => callback("cl"));
		},
		preferredCountries: ["cl", "ar", "pe", "co", "br"], 
		utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/utils.js"
		});
		
	$(campofono).on('input', function () {
		limpiarInputTelefono(this);
	});
	
	$(campofono).on('blur', function () {
		validarTelefono(this,campofono,iti); 	
		});
	}

function limpiarInputTelefono(campo) {
	campo.value = campo.value.replace(/[^\d+]/g, '');
	if (campo.value.indexOf('+') > 0) {
		campo.value = campo.value.replace(/\+/g, '');
		}
	};

function validarTelefono(campo,nombrecampo,iti) {
    const numero = iti.getNumber(); // ejemplo: +56912345678
	const pais = iti.getSelectedCountryData().iso2;
	const inputRef = campo;
    let valido = iti.isValidNumber();
	const $errorDiv = $(nombrecampo+'-error');
	
	if (pais === "cl") {
		const soloNumeros = numero.replace('+56', '');
		if (!/^\d{9}$/.test(soloNumeros)) {
			valido = false;
			}
	  	}
	if (valido) 
		$errorDiv.hide();
	else {
		$errorDiv.show();
		setTimeout(() => inputRef.focus(), 10); // Volver a enfocar
		}
	$(campo).val(iti.getNumber());
	};
//
//
function limpiarPesos(valor) {
	return valor.replace(/\$/g, '').replace(/\./g, '').trim();
	}
//
//
function horaEnServidor() {

	$.ajax({
		url: "/usuarios/hora_servidor",
		data: {},
		type: 'GET',
		dataType: 'JSON',
		success: function(data) {
			let horaServidor = data.hora_servidor;
			let horaServidorFormato = horaServidor.split(" ")[1].substring(0,5); 
			return (horaServidorFormato);
			},
		error: function(jqXHR, textStatus, errorThrown) {
			MensajeErrorDesconocido('There was a problem with the request: ERROR(1)', textStatus, errorThrown);
			}
		});

	} 

function fluidDialog() {
    var $visible = $(".ui-dialog:visible");
    $visible.each(function () {
        var $this = $(this);
        var dialog = $this.find(".ui-dialog-content").data("ui-dialog"); // asegúrate que sea "ui-dialog"

        if (!dialog || !dialog.options) return;

        // if fluid option == true
        if (dialog.options.fluid) {
            var wWidth = $(window).width();

            // check window width against dialog maxWidth
            if (wWidth < dialog.options.maxWidth + 50) {
                $this.css("max-width", "90%");
            } else {
                $this.css("max-width", dialog.options.maxWidth);
            }

            // reposition dialog
            dialog.option("position", dialog.options.position);
        	}	
    	});
	}

function limpiarNombreArchivo(nombreArchivo) {
	return nombreArchivo.replace(/[^a-zA-Z0-9.]/g, ''); // Mantiene letras, números y puntos
	}


function CampoEnReadOnly(id) {
	$("#"+id).css({'background-color' : '#F0EAE9'});
//    $("#"+id).css({'background-color' : '#A7DFFF'});
    $("#"+id).attr("readonly","readonly");
	}

function CampoEnReadWrite(id) {
    $("#"+id).css({'background-color' : '#FFFFFF'});
    $("#"+id).removeAttr("readonly");
	}

function CampoDisabled(id) { 
	$("#"+id).css({'background-color' : '#F0EAE9'});
	$("#"+id).attr("disabled","disabled");
	}

function CampoEnabled(id) {
	$("#"+id).css({'background-color' : '#FFFFFF'});
	$("#"+id).removeAttr("disabled");
	}

function PintarClaseReadOnly() {
	$(".inronly1").css({'background-color' : '#F0EAE9'});
	$(".inronly1").attr("readonly","readonly");
	}

function PintarClaseDisabled() {
	$(".inronly2").css({'background-color' : '#F0EAE9'});
	$(".inronly2").attr("disabled","disabled");
	}

function validarFechas(finicio,ffin) {
	var f1 = finicio.split("-");
    var faux = f1[2] + "-" + f1[1] + "-" + f1[0];
	var fechaInicio = new Date(faux);
	f1 = ffin.split("-");
  	faux = f1[2] + "-" + f1[1] + "-" + f1[0];
	var fechaFin = new Date(faux);

	if (fechaInicio >= fechaFin)
		return false;
	
	return true;
	}

function fechaEnCastellano(fecha) {
	var partes = fecha.split('-'); // Dividimos la fecha en partes
	return `${partes[2]}-${partes[1]}-${partes[0]}`; // Reorganizamos a dd-mm-YYYY
	}

function sumaDiasFecha(pfecha,pdias) {
	let fecha = new Date(pfecha);
	fecha.setDate(fecha.getDate() + pdias);
	let anio = fecha.getFullYear();
	let mes = ("0" + (fecha.getMonth() + 1)).slice(-2); // El mes es 0-indexado, por eso sumamos 1
	let dia = ("0" + fecha.getDate()).slice(-2);
	let nuevaFecha = `${anio}-${mes}-${dia}`;
	return nuevaFecha
	}

function fechaHoySql() {
	var today = new Date();
	var formattedDate = today.getFullYear() + '-' + 
                    ('0' + (today.getMonth() + 1)).slice(-2) + '-' + 
                    ('0' + today.getDate()).slice(-2);
	return formattedDate
	}

function getMonday(d) {
	d = new Date(d);
	let day = d.getDay(),
		diff = d.getDate() - day + (day == 0 ? -6 : 1); // Ajusta cuando es domingo
	return new Date(d.setDate(diff));
	}
//
// Función para formatear la fecha (YYYY-MM-DD)
//
function formatDate(date) {
	let d = new Date(date),
		month = '' + (d.getMonth() + 1),
		day = '' + d.getDate(),
		year = d.getFullYear();

	if (month.length < 2) month = '0' + month;
	if (day.length < 2) day = '0' + day;

	return [year, month, day].join('-');
	}

	var fechaOriginal = "17-12-2024";

function fecha_str_to_sql(fecha) {
	var partes = fecha.split("-");
	var dia = partes[0];
	var mes = partes[1];
	var año = partes[2];
	var fechaConvertida = `${año}-${mes}-${dia}`;
	return fechaConvertida;
} 

String.prototype.ucwords = function() {
    str = this.toLowerCase();
    return str.replace(/(^([a-zA-Z\p{M}]))|([ -][a-zA-Z\p{M}])/g,
        function($1){
            return $1.toUpperCase();
        });
	}

function allTrim(texto=""){
	return texto.trim();
	}

function lTrim(texto=""){
	return texto.trimStart();
	}

function rTrim(texto=""){
	return texto.trimEnd();
	}

function Trim(sStr="") {
	return sStr.replace(/^\s+/g,'').replace(/\s+$/g,'');
	}

function validarNumero(inputSelector, inputNombre, tipo = 'int') {
    const valorOriginal = $(inputSelector).val().trim();
	if (valorOriginal == "")
		return true;

    // 1. Limpiar separadores de miles
    let valor = valorOriginal.replace(/\./g, '');

    // 2. Reemplazar coma decimal por punto
    valor = valor.replace(',', '.');

    // 3. Validar
    if (tipo === 'int') {
        if (/^-?\d+$/.test(valor)) {
            return true;
        } else {
			mostrarMensaje("The value indicated in" + inputNombre + " is not a valid integer!",MSG_STOP);
            return false;
        }
    } else if (tipo === 'float') {
        if (!isNaN(valor) && valor !== '') {
            return true;
        } else {
			mostrarMensaje("The value indicated in " + inputNombre + " is not a valid decimal number!",MSG_STOP);
            return false;
        }
    } else {
		mostrarMensaje("Validation type not recognized: " + tipo,MSG_STOP);
        return false;
    }
}


function number_format(number,decimals=0,dec_point=',',thousands_sep='.') {
	number = number_unformat(number,thousands_sep);
	number = (number + '').replace(/[^0-9+\-Ee.]/g, '');
	var n = !isFinite(+number) ? 0 : +number,
		prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
		sep = (typeof thousands_sep === 'undefined') ? '.' : thousands_sep,
		dec = (typeof dec_point === 'undefined') ? ',' : dec_point,
		s = '',
		toFixedFix = function (n, prec) {
			var k = Math.pow(10, prec);
			return '' + Math.round(n * k) / k;
			};
	s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
	if (s[0].length > 3) {
		s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
		}
	if ((s[1] || '').length < prec) {
		s[1] = s[1] || '';
		s[1] += new Array(prec - s[1].length + 1).join('0');
		}
	if (prec === 0) 
		return s[0];
	else
		return s.join(dec);
	}

function number_unformat(number,thousands_sep='.') {
	var aux=String(number);

	if (number != '') {
		aux = $.trim(number);
		if (thousands_sep == ".") {
			aux = aux.replace(/[.]/g,'');
			aux = aux.replace(',',".");
			}
		else
			aux = aux.replace(/[,]/g,'');
		}
	return Number(aux);
	}

function number_puntoxcoma(par) {
	var	tmp = String(par);
	return tmp.replace(/[.]/g,',');
	}

function formatNumber(num,dec=0) {
	return num.toLocaleString('es-CL', { minimumFractionDigits: dec, maximumFractionDigits: dec });
	}
	
function textvalida(e,obj) {
	tecla = (document.all) ? e.keyCode : e.which;
	if (tecla != 13) 
		return;
	filas = obj.rows;
	txt = obj.value.split('\n');
	return (txt.length < filas);
	}

function validarCorreo(correo) {
	var expresion = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
	
	if (expresion.test(correo)) {
		return true;
		} 
	else {
		return false;
		}
	}

function MensajeErrorDesconocido(p) {
	mostrarMensaje("UNKNOWN ERROR. Please communicate Error=("+p+") to Administrator",MSG_STOP);
	}

function mostrarMensaje(texto,aviso=0) {  
	var msg;

	switch (aviso) {
		case 0: // MSG_SUCCESS
			msg = "<button class='btn btn-sm btn-success'><i class='fa-regular fa-thumbs-up'></i>&nbsp&nbspW A R N i N G:";
			break;
		case 1: // MSG_WARNING
			msg = "<button class='btn btn-sm btn-warning'><i class='fa-regular fa-bell'></i>&nbsp&nbspA T T E N T I O N:";
			break;
		default: // MSG_STOP
			msg = "<button class='btn btn-sm btn-danger'><i class='fa-regular fa-hand'></i>&nbsp&nbspS T O P:";
			break;
			}
	var msg1  = "<div id='msg' title='Mensaje del Sistema'><span style='float: left; margin: 0 7px 50px 0;'><p class='tit10lb'>"+
			     msg+"</button><p>"+texto+"</p></span></div>";
	enviarmostrarMensaje(msg1);
	}
	
function enviarmostrarMensaje(mensaje) {

	var msg = $(mensaje);
	msg.dialog({
		modal: true,
		show: 'puff',
		hide: 'scale',
		width: 450,
		minWidth: 200,
		maxWidth: 400,
		minHeight: 100,
		resizable: false,
		position: { my: "center", at: "center center", of: window },
        buttons: [
            {
                text: "Ok",
                click: function() {
					$(this).dialog("close");
                    },
                class:"ui-corner-all", style:"color:Green" 
                }
            ]
		});
	}
	
function confirmarMensaje(texto,callback1,par1,par2) {
	var msg1  = "<div id='msg' title='System Message'><span style='float: left; margin: 0 7px 50px 0;'><p class='tit10lb'>"+
				"<button class='btn btn-sm btn-warning'><i class='fa-solid fa-circle-question'></i></button>"+
			    "&nbsp&nbsp&nbspA T T E N T I O N:</p><p>"+texto+"</p> Are you Sure?</span></div>";
	enviarconfirmarMensaje(msg1,callback1,par1,par2);
	}

function enviarconfirmarMensaje(mensaje,callback1,par1,par2) {
	var msg = $(mensaje);
	msg.dialog({
		modal: true,
		show: 'puff',
		hide: 'scale',
		height:300,
		width: 450,
		resizable: false,
		position: { my: "center", at: "center center", of: window },
        buttons: [
			{
                text: "Confirm",
                click: function() {
					try {
						callback1(par1,par2);
						}
					catch(err){};
					$(this).dialog("close");
                    },
                class:"ui-corner-all", style:"color:Green" 
			},
			{
                text: "Cancel",
                click: function() {
                    $( this ).dialog("close");
                    },
                class:"ui-corner-all", style:"color:Red" 
			},
            ]
		});
	}
	
function ConfirmarySubmit(texto) {
	var msg1  = "<div id='msg' title='System Message'><span style='float: left; margin: 0 7px 50px 0;'><p class='tit10lb'><img src='./imagenes/notice.png' border='0' width='24' height='24' />"+
			   "&nbsp&nbsp&nbspA T T E N T I O N:</p><p>"+texto+"</p> Are you Sure?</span></div>";
	_confirmarySubmit(msg1);
	}
	
function _confirmarySubmit(texto) {
	var msg = $(texto);
	msg.dialog({
		modal: true,
		show: 'puff',
//		hide: 'scale',
		height:250,
		width: 400,
		resizable: false,
		position: { my: "center", at: "center bottom", of: window },
		buttons: {
			"Confirm": function() {
				$('form').submit();
				$(this).dialog("close");
				},
			"Cancel": function() {
				$(this).dialog("close");
				}
			}
		});
	}
	
function sumaFecha(d, fecha) {
	var Fecha = new Date();
	var sFecha = fecha || (Fecha.getDate() + "/" + (Fecha.getMonth() +1) + "/" + Fecha.getFullYear());
	var sep = sFecha.indexOf('/') != -1 ? '/' : '-'; 
	var aFecha = sFecha.split(sep);
	var fecha = aFecha[2]+'/'+aFecha[1]+'/'+aFecha[0];

	fecha= new Date(fecha);
	fecha.setDate(fecha.getDate()+parseInt(d));
	var anno=fecha.getFullYear();
	var mes= fecha.getMonth()+1;
	var dia= fecha.getDate();
	mes = (mes < 10) ? ("0" + mes) : mes;
	dia = (dia < 10) ? ("0" + dia) : dia;
	var fechaFinal = dia+sep+mes+sep+anno;
 	return (fechaFinal);
 	}

// Convertir las horas a minutos para cálculos
function timeToMinutes(time) {
	let [hours, minutes] = time.split(':').map(Number);
	return parseInt(hours * 60 + minutes);
	}
	
// Convertir minutos a formato de tiempo hh:mm
function minutesToTime(minutes) {
	let hours = Math.floor(minutes / 60).toString().padStart(2, '0');
	let mins = (minutes % 60).toString().padStart(2, '0');
	return `${hours}:${mins}`;
	}
	
function efectoTemblor(paramdiv) {
	const $div = paramdiv;
	const interval = 80;  // Duración de cada movimiento (en milisegundos)
	const distance = 10;   // Distancia que se mueve el div
	const times = 4;       // Número de veces que se mueve el div (izquierda y derecha)

	for (let i = 0; i < times; i++) {
		$div.animate({ left: -distance }, interval)
			.animate({ left: distance }, interval);
		}
	$div.animate({ left: 0 }, interval);  // Devolver el div a su posición original
	}
