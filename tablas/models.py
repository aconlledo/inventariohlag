from django.db import models

class Owners:
    OWN = '0'
    LEASE = '1'
    HLAGCL = '2'
    OWNERS = [
        (OWN, 'OWN'),
        (LEASE, 'LEASE'),
        (HLAGCL, 'HAPAG-LLOYD CHILE SPA'),
        ]  

class Locations:
    SCL = '0'
    VAP = '1'
    LOCATIONS = [
        (SCL, 'SCL'),
        (VAP, 'VAP'),
        ] 
    
class TiposActivos:
    TODOS = '0'
    IT = '1'
    MO = '2'
    TIPOS = [
        (TODOS, 'ALL'),
        (IT, 'IT'),
        (MO, 'MO'),
        ] 
    
    @classmethod
    def get_choices(cls, include=None, exclude=None):
        """
        include: valor (str) o lista de valores a incluir (si se pasa, se ignoran los demás).
        exclude: valor (str) o lista de valores a excluir.
        """
        choices = cls.TIPOS
        if include is not None:
            if not isinstance(include, (list, tuple)):
                include = [include]
            choices = [t for t in choices if t[0] in include]
        if exclude is not None:
            if not isinstance(exclude, (list, tuple)):
                exclude = [exclude]
            choices = [t for t in choices if t[0] not in exclude]
        return choices
 
 
class Accounted:
    NO = '0'
    YES = '1'
    ACCOUNTED = [
        (NO, 'NO'),
        (YES, 'YES'),
        ] 
    
class Estados:
    ASSIG = '0'
    DECOM = '1'
    INUSE = '2'
    NEW = '3'
    SPARE = '4'
    USED = '5'
    ESTADOS = [
        (ASSIG, 'ASSIGNED'),
        (DECOM, 'DECOMMISSIONED'),
        (INUSE, 'IN USE'),
        (NEW, 'NEW'),
        (SPARE, 'SPARE'),
        (USED, 'USED'),
        ]  

    
class TablasSimples:
    FABRICANTES = '0'
    NOMBRESACTIVOS = '1'
    PROVEEDORES = '2'
    USUARIOSINVENTARIO = '3'
    ZONAS = '4'
    NOMBREAREAS = '4'
    TABLASSIMPLES = [
        (FABRICANTES, 'Manufacturers'),
        (NOMBRESACTIVOS, 'Assets Names'),
        (PROVEEDORES, 'Providers'),
        (USUARIOSINVENTARIO, 'Assets Users'),
        (ZONAS, 'Zones'),
        (NOMBREAREAS, 'Areas Names'),
        ]  
    
 
class NombresAreas(models.Model):

    nombre = models.CharField(max_length=45)
    
    class Meta:
        db_table = "tablas_nombresareas"  
        ordering = ['nombre']

    def __str__(self):
        return (self.nombre)    
     
     
class Proveedores(models.Model):

    nombre = models.CharField(max_length=45)
    
    class Meta:
        db_table = "tablas_proveedores"  
        ordering = ['nombre']

    def __str__(self):
        return (self.nombre)  
        
        
class Fabricantes(models.Model):

    nombre = models.CharField(max_length=45)
    
    class Meta:
        db_table = "tablas_fabricantes"  
        ordering = ['nombre']

    def __str__(self):
        return (self.nombre)  
       
    
class NombresActivos(models.Model):

    nombre = models.CharField(max_length=45)
    
    class Meta:
        db_table = "tablas_nombresactivos"  
        ordering = ['nombre']

    def __str__(self):
        return (self.nombre)          

        
class Zonas(models.Model):

    nombre = models.CharField(max_length=45)
    
    class Meta:
        db_table = "tablas_zonas"  
        ordering = ['nombre']

    def __str__(self):
        return (self.nombre)          

class UsuariosInventario(models.Model):

    nombre = models.CharField(max_length=45)
    
    class Meta:
        db_table = "tablas_usuariosinventario"  
        ordering = ['nombre']

    def __str__(self):
        return (self.nombre)     

       
MODELOS_TABLAS = {
    0: Fabricantes,
    1: NombresActivos,
    2: Proveedores,
    3: UsuariosInventario,
    4: Zonas,
    5: NombresAreas,    
    }


class Paises(models.Model):

    nombre = models.CharField(max_length=45)
    codigo = models.CharField(max_length=4,blank=True,null=True)   
     
    class Meta:
        db_table = "tablas_paises"  
        ordering = ['nombre','codigo']

    def __str__(self):
        return (self.nombre)  
    
    
class Ciudades(models.Model):

    nombre = models.CharField(max_length=45)
    codigo = models.CharField(max_length=4,blank=True,null=True)
    pais = models.ForeignKey(Paises, on_delete=models.SET_NULL,blank=True,null=True) 
        
    class Meta:
        db_table = "tablas_ciudades"  
        ordering = ['nombre','codigo','pais']

    def __str__(self):
        return (self.nombre)  
    
    
class Edificios(models.Model):

    nombre = models.CharField(max_length=45)
    ciudad = models.ForeignKey(Ciudades, on_delete=models.SET_NULL,blank=True,null=True)   
    pais = models.ForeignKey(Paises, on_delete=models.SET_NULL,blank=True,null=True) 
        
    class Meta:
        db_table = "tablas_edificios"  
        ordering = ['nombre','ciudad','pais']

    def __str__(self):
        return (self.nombre)  
    
class Modelos(models.Model):

    nombre = models.CharField(max_length=120)
    fabricante = models.ForeignKey(Fabricantes,on_delete=models.SET_NULL,blank=True,null=True)
    
    class Meta:
        db_table = "tablas_modelos"  
        ordering = ['nombre','fabricante']

    def __str__(self):
        return (self.nombre)  
