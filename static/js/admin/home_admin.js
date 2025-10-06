$(document).ready(function(){

  $('#cambiarClaveLink').on('click', function(event) {
    event.preventDefault(); 
    $('#ModalcClave').modal('show');
    })

  $("#btncclavesko").click(function (){
    $('#ModalcClave').modal('hide');
    });

  $('#viewassets').on('click', function(event) {
    event.preventDefault(); 
    mensajeWorking();
    setTimeout(() => {
        window.location.href = $(this).attr('href');
        }, 50);
      })
    
  });
//
// ********************************
//          Funciones
// ********************************
//
