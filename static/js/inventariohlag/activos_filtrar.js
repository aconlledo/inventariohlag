$(document).ready(function(){

  $('#Modalfind').modal('show');

  $('#formqr').on('submit', function(event) {
    event.preventDefault(); 
    const form = this;
    $('#Modalfind').modal('hide');
    $('#Modalfind').on('hidden.bs.modal', function () {
        mensajeWorking();

        setTimeout(() => {
            form.submit();
        }, 50);
    });
  });
  
  if ($('#info').val() == '1') {
    $('#divfcell').show();
    } 
  else {
    $('#divfcell').hide();    
    }

  $('#area').on("change", function(){
      Cargar_Paises();
      });	

  $('#pais').on("change", function(){
      Cargar_Ciudades();
      });	

  }); 
//
// ********************************
//          Funciones
// ********************************
//
async function Cargar_Paises() { 

  await EnviarAjaxPaises()
    .then(function(data) {
        $("#divpaises").html(data); 
        Cargar_Ciudades();
        })
    .catch(function(error) {
        MensajeErrorDesconocido(error);
        });
	$('#pais').on("change", function(){
		Cargar_Ciudades();
		});	
  }

function EnviarAjaxPaises() {

  return new Promise(function(resolve, reject) {
    var area = $('#area option:selected').val();
    $.ajax({
        method: "GET",
        dataType:"html",
        url: "/tablas/selectpaises",
        data: {area: area},
        success: function(data) {
            resolve(data);
            },
        error: function(jqXHR, textStatus, errorThrown) {
            reject(errorThrown);
            }
      });
    });
  }

async function Cargar_Ciudades() {

	await EnviarAjaxCiudades()
		.then(function(data) {
      $("#divciudades").html(data); 
			})
		.catch(function(error) {
			MensajeErrorDesconocido(error);
			});
	}
	
function EnviarAjaxCiudades() {
	return new Promise(function(resolve, reject) {
    var pais = $('#pais option:selected').val();
			$.ajax({
				method: "POST",
				dataType:"html",
				url: "/tablas/selectciudades/",
				data: {pais: pais, csrfmiddlewaretoken: $("input[name=csrfmiddlewaretoken]").val()},
				success: function(data) {
					resolve(data);
					},
				error: function(jqXHR, textStatus, errorThrown) {
					reject(errorThrown);
				}
			});
		});
	}
