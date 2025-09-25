from django.db import models
from django.db.models import Q
from tablas.models import *


class Activos(models.Model):

    tipo = models.CharField(max_length=1,choices=TiposActivos.TIPOS,default=TiposActivos.IT)          
    identificador = models.CharField(max_length=45)
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
    location = models.CharField(max_length=1,choices=Locations.LOCATIONS,default=Locations.VAP)  
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

    class Meta:
        db_table = "hlag_activos"  
        ordering = ['tipo','identificador','nombre','modelo','fabricante','sku','detalle','serial','proveedor','owner','factura','fcompra','vcompra',
                    'factivacion','accounted','vactual','location','building','floor','zona','city','country','estado','festado','usuarioinv','fingreso','fmodifica']

    def __str__(self):
        return (self.nombre)  
    
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
        
        

        
'''     


class AdminPaises(models.Model):

    pais = models.ForeignKey(Paises, on_delete=models.CASCADE,blank=True,null=True,related_name="as_pais")
    paisadmin = models.ForeignKey(Paises, on_delete=models.CASCADE,blank=True,null=True,related_name="as_paisadmin")

    class Meta:
        db_table = "hlag_adminpaises"  
        ordering = ['pais','paisadmin']

    def __str__(self):
        return self.pais.nombre if self.pais else "Sin país"
    
    def get_admin_paises(self):
        """Devuelve todos los AdminPaises donde este país aparece como pais o paisadmin"""
        return AdminPaises.objects.filter(
            Q(pais=self) | Q(paisadmin=self)
        )
        
    def get_paises_admin(self):
        """Devuelve solo los paisadmin donde este país es 'pais' en AdminPaises"""
        return Paises.objects.filter(
            id__in=AdminPaises.objects.filter(pais=self).values_list("paisadmin_id", flat=True)
        )
        
           
Ejemplos de uso:

1.-
    pais = Paises.objects.get(id=1)

    # trae todos los AdminPaises asociados
    relaciones = pais.get_admin_paises()

    for relacion in relaciones:
        print(relacion.pais, relacion.paisadmin)

2.-
    pais = Paises.objects.get(id=1)
    paises_admin = pais.get_paises_admin()

    for pa in paises_admin:
        print(pa.nombre)
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