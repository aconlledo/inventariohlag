#
# urls.py usuarios
#
from django.urls import path
from . import views

urlpatterns = [

    path('confirmacambioclave/', views.confirmacambioclave, name='confirmacambioclave'),  
    path('confirmaolvidoclave/', views.confirmaolvidoclave, name='confirmaolvidoclave'),     
    path('login_general/', views.login_general, name='login_general'),  
    path('login_administrador/', views.login_administrador, name='login_administrador'), 
    path('login_usuario/', views.login_usuario, name='login_usuario'),        
    path('usuarios_listar/', views.usuarios_listar, name='usuarios_listar'),    
    path('ver_persona/', views.ver_persona, name='ver_persona'),            
    path('cambiar_estado/', views.cambiar_estado, name='cambiar_estado'),      
    path('admin_cambia_password/', views.admin_cambia_password, name='admin_cambia_password'),    
    path('checkactiveusername/', views.checkactiveusername, name='checkactiveusername'),    
            
    ]
