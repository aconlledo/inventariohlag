from django.http import HttpResponse, JsonResponse
from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.decorators import login_required
from inventariohlag.funciones import *
from inventariohlag.models import Areas
from .models import *

@login_required(login_url='/login')
def paises(request):
    
    if (request.method == 'GET'):
        paises = Paises.objects.all().order_by('nombre')
        return render(request, 'paises_listar.html', {'paises': paises})
    else:
        accion = request.POST.get('accion')
        id = request.POST.get('id')
        nombre = request.POST.get('nombre')
        codigo = request.POST.get('codigo')        
        if (accion == AccionesCrud.ELIMINAR):
            try:
                Paises.objects.filter(id=id).delete()
            except Exception as e:
                print('Accion= ' + accion + ' Error= '+str(e))
        elif (accion == AccionesCrud.CREAR):
            try:
                Paises.objects.create(nombre=nombre, codigo=codigo)
            except Exception as e:
                print('Accion= ' + accion + ' Error= '+str(e))
        else:
            try:
                Paises.objects.filter(id=id).update(nombre=nombre, codigo=codigo)
            except Exception as e:
                print('Accion= ' + accion + ' Error= '+str(e))
        paises = Paises.objects.all().order_by('nombre')
        return render(request, 'paises_ajax_listar.html', {'paises': paises})


@login_required(login_url='/login')
def selectpaises(request):
    if (request.method == 'GET'):
        area = request.GET.get('area')
        paises = Paises.objects.filter(
            id__in=Areas.objects.filter(areaname_id=area).values_list('pais_id', flat=True)
            ).order_by('nombre')
        return render(request, 'paises_select.html', {'paises': paises}) 
    else:
        return render(request, '404.html')
    
    
@login_required(login_url='/login')
def ciudades(request):
#    if not request.user.is_superuser:
#        return render(request, '404.html')
    if (request.method == 'GET'):
        ciudades = Ciudades.objects.all().order_by('nombre')
        paises = Paises.objects.all().order_by('nombre')
        return render(request, 'ciudades_listar.html', {'ciudades': ciudades, 'paises': paises})
    else:
        accion = request.POST.get('accion')
        id = request.POST.get('id')
        nombre = request.POST.get('nombre')
        codigo = request.POST.get('codigo')
        pais = request.POST.get('pais')        
        if (accion == AccionesCrud.ELIMINAR):
            try:
                Ciudades.objects.filter(id=id).delete()
            except Exception as e:
                print('Accion= ' + accion + ' Error= '+str(e))
        elif (accion == AccionesCrud.CREAR):
            try:
                Ciudades.objects.create(nombre=nombre, codigo=codigo, pais_id=pais)
            except Exception as e:
                print('Accion= ' + accion + ' Error= '+str(e))
        else:
            try:
                Ciudades.objects.filter(id=id).update(nombre=nombre, codigo=codigo, pais_id=pais)
            except Exception as e:
                print('Accion= ' + accion + ' Error= '+str(e))
        ciudades = Ciudades.objects.all().order_by('nombre')
        return render(request, 'ciudades_ajax_listar.html', {'ciudades': ciudades})
    
     
def selectciudades(request):
    if (request.method == 'POST'):
        pais = request.POST.get('pais')
        ciudades = Ciudades.objects.filter(pais_id=pais).order_by('nombre')
        return render(request, 'ciudades_select.html', {'ciudades': ciudades}) 
    else:
        return render(request, '404.html')
    

@login_required(login_url='/login')
def edificios(request):
#    if not request.user.is_superuser:
#        return render(request, '404.html')
    if (request.method == 'GET'):
        paisdefault = Constantes.DEFAULTCOUNTRY
        edificios = Edificios.objects.all().order_by('nombre')
        ciudades = Ciudades.objects.filter(pais_id=paisdefault).order_by('nombre')
        paises = Paises.objects.all().order_by('nombre')
        return render(request, 'edificios_listar.html', {'edificios': edificios,'ciudades': ciudades, 'paises': paises, 'paisdefault': paisdefault})
    else:
        accion = request.POST.get('accion')
        id = request.POST.get('id')
        nombre = request.POST.get('nombre')
        pais = request.POST.get('pais')   
        ciudad = request.POST.get('ciudad')       
        if (accion == AccionesCrud.ELIMINAR):
            try:
                Edificios.objects.filter(id=id).delete()
            except Exception as e:
                print('Accion= ' + accion + ' Error= '+str(e))
        elif (accion == AccionesCrud.CREAR):
            try:
                Edificios.objects.create(nombre=nombre, pais_id=pais, ciudad_id = ciudad)
            except Exception as e:
                print('Accion= ' + accion + ' Error= '+str(e))
        else:
            try:
                Edificios.objects.filter(id=id).update(nombre=nombre, pais_id=pais, ciudad_id = ciudad)
            except Exception as e:
                print('Accion= ' + accion + ' Error= '+str(e))
        edificios = Edificios.objects.all().order_by('nombre')
        return render(request, 'edificios_ajax_listar.html', {'edificios': edificios})

    
@login_required(login_url='/login')
def modelos(request):
#    if not request.user.is_superuser:
#        return render(request, '404.html')
    if (request.method == 'GET'):
        modelos = Modelos.objects.all().order_by('nombre')
        fabricantes = Fabricantes.objects.all().order_by('nombre')
        return render(request, 'modelos_listar.html', {'modelos': modelos, 'fabricantes': fabricantes})
    else:
        accion = request.POST.get('accion')
        id = request.POST.get('id')
        nombre = request.POST.get('nombre')
        fabricante = request.POST.get('fabricante')        
        if (accion == AccionesCrud.ELIMINAR):
            try:
                Modelos.objects.filter(id=id).delete()
            except Exception as e:
                print('Accion= ' + accion + ' Error= '+str(e))
        elif (accion == AccionesCrud.CREAR):
            try:
                Modelos.objects.create(nombre=nombre, fabricante=fabricante)
            except Exception as e:
                print('Accion= ' + accion + ' Error= '+str(e))
        else:
            try:
                Modelos.objects.filter(id=id).update(nombre=nombre, fabricante=fabricante)
            except Exception as e:
                print('Accion= ' + accion + ' Error= '+str(e))
        modelos = Modelos.objects.all().order_by('nombre')
        return render(request, 'modelos_ajax_listar.html', {'modelos': modelos})
    
     
def selectmodelos(request):
    if (request.method == 'POST'):
        fabricante = request.POST.get('fabricante')
        modelos = Modelos.objects.filter(fabricante_id=fabricante).order_by('nombre')
        return render(request, 'modelos_select.html', {'modelos': modelos}) 
    else:
        return render(request, '404.html')
     
     
@login_required(login_url='/login')
def tablasimple(request,tabla):
#    if not request.user.is_superuser:
#        return render(request, '404.html')
    if (request.method == 'GET'):
        try:
            tabla = int(tabla)
            modelo = MODELOS_TABLAS[tabla]  
        except (ValueError, KeyError):
            return render(request, '404.html') 
        registros = modelo.objects.order_by('nombre')
        nombretabla = f'{TablasSimples.TABLASSIMPLES[tabla][1]}'
        return render(request, f'tablasimples_listar.html', {'registros': registros, 'nombretabla': nombretabla, 'tabla': tabla})
    else:
        accion = request.POST.get('accion')
        id = request.POST.get('id')
        tabla = request.POST.get('tabla')
        nombre = request.POST.get('nombre')
        try:
            tabla = int(tabla)
            modelo = MODELOS_TABLAS[tabla]  
        except (ValueError, KeyError):
            return render(request, '404.html') 
        if (accion == AccionesCrud.ELIMINAR):
            try:
                modelo.objects.filter(id=id).delete()
            except Exception as e:
                print('Accion= ' + accion + ' Error= '+str(e))
        elif (accion == AccionesCrud.CREAR):
            try:
                modelo.objects.create(nombre=nombre)
            except Exception as e:
                print('Accion= ' + accion + ' Error= '+str(e))
        else:
            try:
                modelo.objects.filter(id=id).update(nombre=nombre)
            except Exception as e:
                print('Accion= ' + accion + ' Error= '+str(e))
        registros = modelo.objects.order_by('nombre')
        return render(request, 'tablasimples_ajax_listar.html', {'registros': registros, 'tabla': tabla})       

