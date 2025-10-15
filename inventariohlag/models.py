from django.db import models
from django.db.models import Max
from tablas.models import *
import qrcode, os
from django.core.files import File
from io import BytesIO
from django.conf import settings
from django.core import signing
from PIL import Image, ImageDraw, ImageFont



class Activos(models.Model):

    tipo = models.CharField(max_length=1,choices=TiposActivos.TIPOS,default=TiposActivos.IT)          
    newid = models.IntegerField(default=1)
    nombre = models.ForeignKey(NombresActivos, on_delete=models.SET_NULL,blank=True,null=True)
    modelo = models.ForeignKey(Modelos, on_delete=models.SET_NULL,blank=True,null=True)
    fabricante = models.ForeignKey(Fabricantes, on_delete=models.SET_NULL,blank=True,null=True)
    sku = models.CharField(max_length=45,blank=True,null=True)
    detalle = models.CharField(max_length=250,blank=True,null=True)
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
        ordering = ['tipo','newid','nombre','modelo','fabricante','sku','detalle','serial','proveedor','owner','factura','fcompra','vcompra',
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
        url = f"{settings.SITE_URL}/activos/qr/{token}/" 
        qr = qrcode.QRCode(
            version=1,
            error_correction=qrcode.constants.ERROR_CORRECT_H,
            box_size=8,
            border=4
            )
        qr.add_data(url)
        qr.make(fit=True)
        qr_img = qr.make_image(fill_color="black", back_color="white").convert("RGB")
        try:
#            font_bold_path = os.path.join(settings.BASE_DIR,"static/fonts/dejavu-sans-nold.ttf")
#            font_normal_path = os.path.join(settings.BASE_DIR,"static/fonts/dejavu-sans-regular.ttf")
            font_bold_path = os.path.join(settings.BASE_DIR,"static/fonts/arialceb.ttf")
            font_normal_path = os.path.join(settings.BASE_DIR,"static/fonts/arialce.ttf")
            font_bold = ImageFont.truetype(font_bold_path, 16)
            font_normal = ImageFont.truetype(font_normal_path, 16)
        except:
            font_bold = ImageFont.load_default()
            font_normal = ImageFont.load_default()
        qr_width, qr_height = qr_img.size
        padding = 2
        text_width = 380
        total_width = qr_width + text_width + padding
        total_height = max(qr_height, 220)
        combined = Image.new("RGB", (total_width, total_height), "white")
        combined.paste(qr_img, (0, 0))
        draw = ImageDraw.Draw(combined)
        x_text = qr_width + padding
        y = 180
        line_height = 20  # Espaciado entre líneas 
        title_value_gap = 80  # Separación entre título y valor
        tipo = TiposActivos.TIPOS[int(self.tipo)][1]
        identificador = f'{tipo}-{self.newid}'
        text_lines = [
            ("Type: ", tipo),
            ("ID #: ", identificador),
            ("Name: ", self.nombre.nombre),
            ("Serial: ", self.serial),
            ("City: ", self.city.nombre),
            ("Building: ", self.building.nombre),
            ]
        for title, value in text_lines:
            draw.text((x_text, y), title, font=font_bold, fill="black")
            draw.text((x_text + title_value_gap, y), value, font=font_normal, fill="black")
            y += line_height
        buffer = BytesIO()
        combined.save(buffer, format="PNG", dpi=(150, 150))
        filename = f"qr_{identificador}.png"
        self.qr.save(filename, File(buffer), save=False)
    
    @property
    def get_qr_html_data(self):
        tipo = TiposActivos.TIPOS[int(self.tipo)][1]
        return f"""
        <div class='qr-info'>
            <div class='text8l'><strong>ID #:</strong> {tipo}-{self.newid}</div>
            <div class='text8l'><strong>Name:</strong> {self.nombre.nombre}</div>
            <div class='text8l'><strong>Serial:</strong> {self.serial}</div>
            <div class='text8l'><strong>City:</strong> {self.city.nombre}</div>
            <div class='text8l'><strong>Building:</strong> {self.building.nombre}</div>
        </div>
        """
        
'''
    def generar_qr(self):
        # Genera un token firmado que incluye el código del activo
        token = signing.dumps({'id': self.id})
        # Construye la URL segura (ajústala según tu dominio)
        url = f"{settings.SITE_URL}/activos/qr/{token}/"
        # Crea el código QR con la URL
        qr_img = qrcode.make(url)
        # Guarda la imagen en memoria y luego en el campo
        buffer = BytesIO()
        qr_img.save(buffer, format='PNG')
        tipo = TiposActivos.TIPOS[int(self.tipo)][1]
        filename = f"qr-{tipo}-{self.newid}.png"
        self.qr.save(filename, File(buffer), save=False)
'''



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

