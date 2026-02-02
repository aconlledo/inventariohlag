from django.db import models
from django.db.models import Max
from tablas.models import *
import qrcode
import os
from django.core.files import File
from io import BytesIO
from django.conf import settings
from django.core import signing
from django.core.files.base import ContentFile
from PIL import Image, ImageDraw, ImageFont



class Activos(models.Model):

    tipo = models.CharField(max_length=1,choices=TiposActivos.TIPOS,default=TiposActivos.IT)          
    newid = models.IntegerField(default=1)
    nombre = models.ForeignKey(NombresActivos, on_delete=models.SET_NULL,blank=True,null=True)
    modelo = models.ForeignKey(Modelos, on_delete=models.SET_NULL,blank=True,null=True)
    fabricante = models.ForeignKey(Fabricantes, on_delete=models.SET_NULL,blank=True,null=True)
    sku = models.CharField(max_length=45,blank=True,null=True)
    desc1 = models.CharField(max_length=250,blank=True,null=True)
    desc2 = models.CharField(max_length=250,blank=True,null=True)
    desc3 = models.CharField(max_length=250,blank=True,null=True)
    serial = models.CharField(max_length=45,blank=True,null=True)
    proveedor = models.ForeignKey(Proveedores,on_delete=models.SET_NULL,blank=True,null=True)   
    owner = models.CharField(max_length=1,choices=Owners.OWNERS,default=Owners.HLAGCL)
    factura = models.CharField(max_length=45,blank=True,null=True)
    fcompra = models.DateField(blank=True,null=True)  
    vcompra = models.DecimalField(max_digits=10, decimal_places=2,blank=True,null=True)
    factivacion = models.DateField(blank=True,null=True)
    accounted = models.CharField(max_length=1,choices=Accounted.ACCOUNTED,default=Accounted.YES)  
    vactual = models.DecimalField(max_digits=10, decimal_places=2,blank=True,null=True)
    building = models.ForeignKey(Edificios, on_delete=models.SET_NULL,blank=True,null=True)     
    floor = models.CharField(max_length=15,blank=True,null=True)
    zona = models.ForeignKey(Zonas, on_delete=models.SET_NULL,blank=True,null=True)
    city = models.ForeignKey(Ciudades, on_delete=models.SET_NULL,blank=True,null=True)  
    country = models.ForeignKey(Paises, on_delete=models.SET_NULL,blank=True,null=True)
    estado = models.CharField(max_length=1,choices=Estados.ESTADOS,default=Estados.NEW)  
    festado = models.DateField(blank=True,null=True)  
    usuarioinv = models.ForeignKey(UsuariosInventario, on_delete=models.SET_NULL,blank=True,null=True)
    fingreso = models.DateTimeField(auto_now_add=True)    
    fmodifica = models.DateTimeField(auto_now=True)
    qr = models.ImageField(upload_to='qrcodes', blank=True, null=True)
    
    class Meta:
        db_table = "hlag_activos"  
        ordering = ['tipo','newid','nombre','modelo','fabricante','sku','desc1','desc2','desc3','serial','proveedor','owner','factura','fcompra','vcompra',
                    'factivacion','accounted','vactual','building','floor','zona','city','country','estado','festado','usuarioinv','fingreso','fmodifica','qr']

    def __str__(self):
        return f"{self.tipo} - {self.newid}"
    
    
    def save(self, *args, **kwargs):
        if self._state.adding and not self.newid:
            maximo = Activos.objects.filter(tipo=self.tipo).aggregate(Max('newid'))['newid__max']
            self.newid = (maximo or 0) + 1
        super().save(*args, **kwargs)
        if not self.qr:
            self.generar_qr()
        super().save(update_fields=['qr'])
         
    @property
    def fecha_fmodifica(self):
        return self.fmodifica.strftime("%d-%m-%Y")

    @property
    def hora_fmodifica(self):
        return self.fmodifica.strftime("%H:%M")

    @property
    def fecha_hora_fmodifica(self):
        return self.fmodifica.strftime("%d-%m-%Y %H:%M")    

    @property
    def fecha_fingreso(self):
        return self.fingreso.strftime("%d-%m-%Y")

    @property
    def hora_fingreso(self):
        return self.fingreso.strftime("%H:%M")

    @property
    def fecha_hora_fingreso(self):
        return self.fingreso.strftime("%d-%m-%Y %H:%M")  

    def generar_qr(self):
        token = signing.dumps({'id': self.id})
        url = f"{settings.SITE_URL}/qr_detalle/{token}/"
        qr = qrcode.QRCode(
            version=1,
            error_correction=qrcode.constants.ERROR_CORRECT_H,
            box_size=8,
            border=2
        )
        qr.add_data(url)
        qr.make(fit=True)
        qr_img = qr.make_image(fill_color="black", back_color="white").convert("RGB")

        # fuentes (caída a default si no encuentra)
        try:
            font_bold_path = os.path.join(settings.BASE_DIR, "static/fonts/arialceb.ttf")
            font_normal_path = os.path.join(settings.BASE_DIR, "static/fonts/arialce.ttf")
            font_bold = ImageFont.truetype(font_bold_path, 26)
            font_normal = ImageFont.truetype(font_bold_path, 26)           
#            font_normal = ImageFont.truetype(font_normal_path, 26)
        except Exception:
            font_bold = ImageFont.load_default()
            font_normal = ImageFont.load_default()

        # Cargar JPG inferior (si existe)
        logo_path = os.path.join(settings.BASE_DIR, "static/imagenes/logo.jpg")
        if os.path.exists(logo_path):
            try:
                logo_img = Image.open(logo_path).convert("RGB")
            except Exception:
                logo_img = None
        else:
            logo_img = None

        # medidas y secciones
        qr_width, qr_height = qr_img.size
        padding = 2
        text_width = 380  # ancho reservado para la sección de la derecha

        # División derecha: 70% texto arriba + 30% imagen abajo
        right_section_height = qr_height
        text_height = int(right_section_height * 0.70)
        image_height = int(right_section_height * 0.30)

        # ajustar logo al ancho de la sección de texto y a su altura (si hay logo)
        if logo_img:
            logo_img = logo_img.resize((text_width, image_height))

        # tamaño total del canvas combinado
        total_width = qr_width + text_width + padding
        total_height = qr_height
        combined = Image.new("RGB", (total_width, total_height), "white")
        combined.paste(qr_img, (0, 0))
        draw = ImageDraw.Draw(combined)

        # --- PREPARAR LÍNEAS DE TEXTO (debe definirse antes de calcular alturas) ---
        tipo = TiposActivos.TIPOS[int(self.tipo)][1] if hasattr(self, 'tipo') else ''
        identificador = f'{tipo}-{self.newid}'

        # proteger posibles None en atributos relacionados
        nombre_val = getattr(self.nombre, 'nombre', '') if self.nombre else ''
        serial_val = self.serial or ''
        city_val = getattr(self.city, 'nombre', '') if self.city else ''
        building_val = getattr(self.building, 'nombre', '') if self.building else ''

        text_lines = [
            ("ID #: ", identificador),
            ("Name: ", nombre_val),
            ("Serial: ", serial_val),
            ("City: ", city_val),
            ("Building: ", building_val),
        ]

        # Posición X donde empieza el texto (a la derecha del QR)
        x_text = qr_width + padding

        # calcular altura del texto y centrar verticalmente dentro del area text_height
        # line_height se puede derivar de la fuente, pero usamos un valor decente por defecto
        # puedes ajustar si la fuente es más grande
        try:
            # calculamos una altura de línea aproximada usando la fuente normal
            ascent, descent = font_normal.getmetrics()
            line_height = ascent + descent + 4  # +4 px de padding
        except Exception:
            line_height = 20

        num_lines = len(text_lines)
        total_text_height = num_lines * line_height

        # Centrado vertical dentro del área de texto (75% de la derecha)
        y = (text_height - total_text_height) // 2
        if y < 0:
            y = 0  # por seguridad si hay más líneas que espacio

        # --- calcular ancho real del título para evitar superposición ---
        max_title_width = 0
        for title, _ in text_lines:
            bbox = font_bold.getbbox(title)
            w = bbox[2] - bbox[0]   # ancho del texto
            max_title_width = max(max_title_width, w)

        title_value_gap = max_title_width + 10  # separación segura

        # --- dibujar texto ---
        for title, value in text_lines:
            draw.text((x_text, y), title, font=font_bold, fill="black")
            draw.text((x_text + title_value_gap, y), str(value), font=font_normal, fill="black")
            y += line_height

        # Pegar JPG debajo del texto (en el 75% de altura) si existe
        if logo_img:
            combined.paste(logo_img, (x_text, text_height))

        # Guardar en buffer y asignar al ImageField
        buffer = BytesIO()
        combined.save(buffer, format="PNG", dpi=(150, 150))
        buffer.seek(0)
        filename = f"qr_{identificador}.png"
        # usar ContentFile para seguridad
        self.qr.save(filename, ContentFile(buffer.getvalue()), save=False)
        buffer.close()
 
   
    @property
    def get_qr_html_data(self):
        tipo = TiposActivos.TIPOS[int(self.tipo)][1]
        return f"""
        <div class='text8l'><strong>ID #:</strong> {tipo}-{self.newid}</div>
        <div class='text8l'><strong>Name:</strong> {self.nombre.nombre}</div>
        <div class='text8l'><strong>Serial:</strong> {self.serial}</div>
        <div class='text8l'><strong>City:</strong> {self.city.nombre}</div>
        <div class='text8l'><strong>Building:</strong> {self.building.nombre}</div>
        """
        
"""
        <div class='qr-info'>
            <div class='text8l'><strong>ID #:</strong> {tipo}-{self.newid}</div>
            <div class='text8l'><strong>Name:</strong> {self.nombre.nombre}</div>
            <div class='text8l'><strong>Serial:</strong> {self.serial}</div>
            <div class='text8l'><strong>City:</strong> {self.city.nombre}</div>
            <div class='text8l'><strong>Building:</strong> {self.building.nombre}</div>
        </div>
        """

class Areas(models.Model):

    areaname = models.ForeignKey(NombresAreas, on_delete=models.CASCADE,blank=True,null=True)   
    pais = models.ForeignKey(Paises, on_delete=models.CASCADE,blank=True,null=True)

    class Meta:
        db_table = "hlag_areas"  
        ordering = ['areaname','pais']

    def __str__(self): 
        return self.areaname.nombre if self.pais else "Sin país"
    
    def get_area_paises(self):
        return Areas.objects.filter(
            id__in=Areas.objects.filter(areaname=self).values_list("pais_id", flat=True)
        )
       
    @classmethod
    def get_paises_por_areaid(cls, areaid):
        """
        Devuelve un QuerySet de todos los países asociados a un área específica
        dado su area.id (que corresponde a areaname.id).
        """
        return Paises.objects.filter(areas__areaname_id=areaid).distinct().order_by('nombre') 

