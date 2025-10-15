#
# urls.py tablas
#
from django.urls import path
from . import views

urlpatterns = [

    path('tablasimple/<int:tabla>/', views.tablasimple, name='tablasimple'),
    path('modelos/', views.modelos, name='modelos'),
    path('selectmodelos/', views.selectmodelos, name='selectmodelos'),
    path('paises/', views.paises, name='paises'),     
    path('selectpaises/', views.selectpaises, name='selectpaises'),    
    path('ciudades/', views.ciudades, name='ciudades'),   
    path('selectciudades/', views.selectciudades, name='selectciudades'),      
    path('edificios/', views.edificios, name='edificios'),        
         
    ]
 