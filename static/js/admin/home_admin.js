$(document).ready(function(){

  $('#cambiarClaveLink').on('click', function(event) {
    event.preventDefault(); // Evita que el link navegue al href
    $('#ModalcClave').modal('show');
    })

  $("#btncclavesko").click(function (){
    $('#ModalcClave').modal('hide');
    });
    
  });
//
// ********************************
//          Funciones
// ********************************
//
