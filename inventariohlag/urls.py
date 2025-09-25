"""
URL configuration for inventariohlag project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from . import views 

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.login, name='login'),
    path('tablas/', include ('tablas.urls')),
    path('usuarios/', include ('usuarios.urls')),
    path('salir_plataforma/', views.salir_plataforma, name='salir_plataforma'),       
    path('home_admin/', views.home_admin, name='home_admin'),  
    path('en_desarrollo/', views.en_desarrollo, name='en_desarrollo'),    
    path('activos/', views.activos, name='activos'),    
    path('leeractivo/', views.leeractivo, name='leeractivo'),  
    path('checkactiveid/', views.checkactiveid, name='checkactiveid'),  
    path('modificaractivo/', views.modificaractivo, name='modificaractivo'), 
    path('areas_listar/', views.areas_listar, name='areas_listar'), 
         
    ]
