$(document).ready(function(){

  $(document).on('change', '.chk', updateState);
  
  $('#selectAll').on('change', function() {
    $('.chk').prop('checked', this.checked);
    updateState();
    });

  $('#printBtn').on('click', function() {
    const selected = $('.chk:checked').closest('.qr-card');
    if (selected.length === 0) return;

    const printWindow = window.open('', '_blank');
    const htmlStart = `
      <!doctype html><html><head><meta charset='utf-8'>
      <title>QR Codes Print</title>
      <style>
        @page { size: A4; margin: 10mm; }
        body{font-family:Arial,Helvetica,sans-serif;padding:10px}
        .page{display:grid;grid-template-columns:repeat(3,1fr);gap:10mm;justify-items:center}
        .card{
          width:6cm; height:6cm; 
          text-align:center; border:1px solid #ddd;
          border-radius:6px; padding:6px;
          display:flex; flex-direction:column;
          justify-content:center; align-items:center;
        }
        img{width:4cm;height:4cm;object-fit:contain}
        .info{font-size:10pt;line-height:1.2;text-align:left;width:100%;margin-top:4px}
        .info strong{font-size:10pt}
      </style>
      </head><body>`;
    const htmlEnd = '</body></html>';

    let cardsHtml = '';
    selected.each(function() {
      const img = $(this).find('img').attr('src');
      const nombre = $(this).find('.qr-label').text();
      cardsHtml += `
        <div class='card'>
          <img src='${img}' alt='${nombre}'>
        </div>`;
      });

    printWindow.document.write(htmlStart + '<div class=\"page\">' + cardsHtml + '</div>' + htmlEnd);
    printWindow.document.close();
    printWindow.focus();
    setTimeout(() => { printWindow.print(); printWindow.close(); }, 400);
  });

  updateState();

  $('#newFilter').on('click', function(e) {
    e.preventDefault(); 
    window.location.href = '/qr_filtrar'; 
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
