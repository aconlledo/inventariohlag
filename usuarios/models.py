""" En este modulo se definen los modelos de Usuarios (UsuariosPersonas)
"""
    
from django.db import models
from django.contrib.auth.models import User
from tablas.models import Paises, TiposActivos
from inventariohlag.models import Areas

class PerfilesUsuarios:
    USUARIO = '0'
    ADMINISTRADOR = '1'
    PERFILES_USUARIOS = [
        (USUARIO, 'NORMAL USER'),
        (ADMINISTRADOR, 'ADMINISTRADOR'),
        ]
 

class EstadosPersonas:
    BLOQUEADO = '0'
    HABILITADO = '1'
    ESTADOS_PERSONAS = [
        (BLOQUEADO, 'DISABLED'),
        (HABILITADO, 'ENABLED'),
        ]        
     
     
class UsuariosPersonas(models.Model):  
    '''
    Tabla de registro de personas, Usuarios y clientes. 
    '''
    username = models.CharField(max_length=20,blank=True,null=True) 
    nombres = models.CharField(max_length=90,blank=True,null=True)  
    apellidos = models.CharField(max_length=90,blank=True,null=True)  
    email = models.CharField(max_length=90,blank=True,null=True)
    estado = models.CharField(max_length=1,choices=EstadosPersonas.ESTADOS_PERSONAS,default=EstadosPersonas.HABILITADO)
    perfil = models.CharField(max_length=1,choices=PerfilesUsuarios.PERFILES_USUARIOS,default=PerfilesUsuarios.USUARIO) 
    tipoactivo = models.CharField(max_length=1,choices=TiposActivos.TIPOS,default=TiposActivos.TODOS) 
    cclave = models.PositiveSmallIntegerField(default=1)  
    token = models.CharField(max_length=64,blank=True,null=True)     
    pais = models.ForeignKey(Paises, on_delete=models.SET_NULL,blank=True,null=True) 
    area = models.ForeignKey(Areas, on_delete=models.SET_NULL,blank=True,null=True) 
    usuario = models.OneToOneField(User,on_delete=models.CASCADE,blank=True,null=True)
     
    class Meta:
        db_table = "usuarios_personas"        
        ordering = ['username','nombres','apellidos','email','pais','estado','perfil','cclave','pais','usuario','tipoactivo']  
        ordering = ['username','nombres','apellidos','email','estado','perfil','tipoactivo','cclave','token','pais','area','usuario']  

