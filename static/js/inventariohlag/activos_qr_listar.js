$(document).ready(function(){

  $(document).on('change', '.chk', updateState);
  
  $('#selectAll').on('change', function() {
    $('.chk').prop('checked', this.checked);
    updateState();
    });

  updateState();

  Crear_DataTable(); 

  $('#newFilter').on('click', function(e) {
    e.preventDefault(); 
    window.location.href = '/qr_filtrar'; 
    });

  $('#printBtn').on('click', function () {
    const selected = $('.chk:checked').closest('.qr-card');
    if (selected.length === 0) return;

    const printWindow = window.open('', '_blank');

    const htmlStart = `
    <!doctype html>
    <html>
    <head>
        <meta charset="utf-8">
        <title>Printing QR</title>
        <style>

            * {
              margin: 0 !important;
              padding: 0 !important;
              box-sizing: border-box !important;
            }

            @page { size: Letter; margin: 0; }

            body {
                margin: 0;
                padding: 0;
            }

            /* Contenedor exacto para 3×8 etiquetas */
            .grid {
              width: 220mm;       
              height: 280mm;  
              display: grid;
              grid-template-columns: 70mm 70mm 70mm;
              grid-template-rows: repeat(8, 35mm);
              column-gap: 5mm;
              row-gap: 0mm;
              margin: 0 auto;
              background: white;
            }

            .card {
              width: 70mm;
              height: 35mm;
              display: flex;
              justify-content: center;
              align-items: center;
              overflow: hidden;
              background: white;
            }

            img {
                max-width: 100%;
                max-height: 100%;
                object-fit: contain;
                display: block;
            }
        </style>
    </head>
    <body>
    <div class="grid">
    `;

    const htmlEnd = `
    </div>
    </body>
    </html>`;

    let cardsHtml = '';
    selected.each(function () {
        const img = $(this).find('img').attr('src');
        cardsHtml += `
            <div class="card">
                <img src="${img}">
            </div>
        `;
    });

    printWindow.document.write(htmlStart + cardsHtml + htmlEnd);
    printWindow.document.close();

    setTimeout(() => {
        printWindow.print();
        printWindow.close();
      }, 200);
  });

  });
    
//
// ********************************
//          Funciones
// ********************************
//

function updateState() {
    const total = $('.chk').length;
    const selected = $('.chk:checked').length;
    $('#selectedCount').text(selected + ' Selected');
    $('#printBtn').prop('disabled', selected === 0);
    $('#selectAll').prop('checked', selected === total);
    $('#selectAll').prop('indeterminate', selected > 0 && selected < total);
    };


function Crear_DataTable() {

  $('#tablaregs').DataTable ({
      destroy: true,
      paging: true,
      info: false,
      pagingType: 'full_numbers',
      bJQueryUI: true,
      ordering: false, 
      lengthChange: false,
      pageLength: 8
    });   
    
    $(".qr-img").tooltip({ html: true });
    
  };