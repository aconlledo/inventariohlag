from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import render, redirect
from django.contrib.auth import logout
from django.http import JsonResponse
from django.contrib.auth.decorators import login_required
from inventariohlag.funciones import *
from .models import *
from tablas.models import *


def login(request):
    return render(request, 'login.html')

@csrf_exempt
def salir_plataforma(request):
    '''
    Realiza logout y envia home 
    '''
    logout(request)
    return redirect('login')

def home_admin(request):
    if not request.user.is_superuser:
        return render(request, '404.html')
    return render(request, 'home_admin.html')

def home(request):
    return render(request,'home.html')

def about(request):
    return render(request,'about.html')

def ayuda(request):
    return render(request,'ayuda.html')

def test(request):
    return render(request, 'test.html')



@login_required(login_url='/login')
def activos(request):
#    if not request.user.is_superuser:
#        return render(request, '404.html')
    if (request.method == 'GET'):
        owners = Owners.OWNERS
        locations = Locations.LOCATIONS
        tiposactivos = TiposActivos.TIPOS
        contabilizados = Accounted.ACCOUNTED
        estados = Estados.ESTADOS
        edificios =  Edificios.objects.all().order_by('nombre')
        ciudades = Ciudades.objects.all().order_by('nombre')
        paises = Paises.objects.all().order_by('nombre')
        proveedores = Proveedores.objects.all().order_by('nombre')
        modelos = Modelos.objects.all().order_by('nombre')
        fabricantes = Fabricantes.objects.all().order_by('nombre')
        nombresactivos = NombresActivos.objects.all().order_by('nombre')
        zonas = Zonas.objects.all().order_by('nombre')
        usuariosinv = UsuariosInventario.objects.all().order_by('nombre')
        activos = Activos.objects.order_by('identificador')
        return render(request, f'activos_listar.html', {'activos': activos,'owners': owners,'edificios': edificios,'ciudades': ciudades,'paises': paises,
                                                        'locations': locations,'tiposactivos': tiposactivos,'estados': estados,'modelos': modelos,
                                                        'fabricantes': fabricantes,'nombresactivos': nombresactivos,'proveedores': proveedores,'zonas': zonas,
                                                        'usuariosinv': usuariosinv,'contabilizados': contabilizados})
    else:
        return render(request, '404.html')    


@login_required(login_url='/login')
def leeractivo(request):
    context = {}
    context['status'] = 200
    context['message'] = ""
    registro = {}
    if (request.method == 'POST'):
        id = request.POST.get('id')
        try:
            activo = Activos.objects.get(id=id)
        except Activos.DoesNotExist:
            context['status'] = 404 
            context['message'] = f'Error: Asset Not Available'
        except Exception as e: 
            context['status'] = 404 
            context['message'] = f'Error: {e}'
        else:
            registro['id'] = activo.id
            registro['tipo'] = activo.tipo
            registro['identificador'] = activo.identificador            
            registro['nombre'] = activo.nombre_id
            registro['modelo'] = activo.modelo_id
            registro['fabricante'] = activo.fabricante_id
            registro['detalle'] = activo.detalle
            registro['serial'] = activo.serial
            registro['proveedor'] = activo.proveedor_id
            registro['owner'] = activo.owner
            registro['factura'] = activo.factura
            registro['fcompra'] = fecha_sql_to_str(activo.fcompra)            
            registro['vcompra'] = activo.vcompra
            registro['factivacion'] = fecha_sql_to_str(activo.factivacion)
            registro['accounted'] = activo.accounted
            registro['vactual'] = activo.vactual
            registro['location'] = activo.location
            registro['building'] = activo.building_id
            registro['floor'] = activo.floor
            registro['zona'] = activo.zona_id
            registro['city'] = activo.city_id
            registro['country'] = activo.country_id
            registro['estado'] = activo.estado
            registro['festado'] = fecha_sql_to_str(activo.festado)
            registro['usuarioinv'] = activo.usuarioinv_id
            registro['fingreso'] = activo.fecha_hora_fingreso
            registro['fmodifica'] = activo.fecha_hora_fmodifica                  
    else:
        context['status'] = 404 
        context['message'] = f'Access Error'
#    print(registro,context) 
    return JsonResponse({
        'context': context,
        'registro': registro,
        })


@login_required(login_url='/login')
def modificaractivo(request):
    if not request.user.is_superuser:
        return render(request, '404.html')
    if (request.method == 'POST'):
        accion = request.POST.get('accion')
        id = request.POST.get('id')
        tipo = request.POST.get('tipo')
        identificador = request.POST.get('identificador')            
        nombre = request.POST.get('nombre')
        modelo = request.POST.get('modelo')
        fabricante = request.POST.get('fabricante')
        detalle = request.POST.get('detalle')
        serial = request.POST.get('serial')
        proveedor = request.POST.get('proveedor')
        owner = request.POST.get('owner')
        factura = request.POST.get('factura')
        fcompra = fecha_str_to_sql(request.POST.get('fcompra'))           
        vcompra = request.POST.get('vcompra')
        factivacion = fecha_str_to_sql(request.POST.get('factivacion'))
        accounted = request.POST.get('accounted')
        vactual = request.POST.get('vactual')
        location = request.POST.get('location')
        building = request.POST.get('building')
        floor = request.POST.get('floor')
        zona = request.POST.get('zona')
        city = request.POST.get('city')
        country = request.POST.get('country')
        estado = request.POST.get('estado')
        festado = fecha_str_to_sql(request.POST.get('festado'))
        usuarioinv = request.POST.get('usuarioinv')
        if (accion == AccionesCrud.ELIMINAR):
            try:
                Activos.objects.filter(id=id).delete()
            except Exception as e:
                print('Accion= ' + accion + ' Error= '+str(e))
        elif (accion == AccionesCrud.CREAR):
            try:
                Activos.objects.create(tipo=tipo,identificador=identificador,nombre_id=nombre,modelo_id=modelo,fabricante_id=fabricante,
                                       detalle=detalle,serial=serial,proveedor_id=proveedor,owner=owner,factura=factura,fcompra=fcompra,
                                       vcompra=vcompra,factivacion=factivacion,accounted=accounted,vactual=vactual,location=location,
                                       building_id=building,floor=floor,zona_id=zona,city_id=city,country_id=country,
                                       estado=estado,festado=festado,usuarioinv_id=usuarioinv)
            except Exception as e:
                print('Accion= ' + accion + ' Error= '+str(e))
        else:
            try:
                Activos.objects.filter(id=id).update(tipo=tipo,identificador=identificador,nombre_id=nombre,modelo_id=modelo,fabricante_id=fabricante,
                                       detalle=detalle,serial=serial,proveedor_id=proveedor,owner=owner,factura=factura,fcompra=fcompra,
                                       vcompra=vcompra,factivacion=factivacion,accounted=accounted,vactual=vactual,location=location,
                                       building_id=building,floor=floor,zona_id=zona,city_id=city,country_id=country,
                                       estado=estado,festado=festado,usuarioinv_id=usuarioinv)
            except Exception as e:
                print('Accion= ' + accion + ' Error= '+str(e))                

        activos = Activos.objects.order_by('identificador')
        return render(request, f'activos_listar_ajax.html', {'activos': activos})
    else:
        return render(request, '404.html')    


@login_required(login_url='/login')
def areas_listar(request):
#    if not request.user.is_superuser:
#        return render(request, '404.html')
    if (request.method == 'GET'):
        areasnombres = NombresAreas.objects.all().order_by('nombre')
        areas = Areas.objects.all().order_by('areaname_id')
        paises = Paises.objects.all().order_by('nombre')
        return render(request, 'areas_listar.html', {'areas': areas, 'paises': paises, 'areasnombres': areasnombres})
    else:
        accion = request.POST.get('accion')
        id = request.POST.get('id')
        pais = request.POST.get('pais')
        areaname = request.POST.get('areaname')        
        if (accion == AccionesCrud.ELIMINAR):
            try:
                Areas.objects.filter(id=id).delete()
            except Exception as e:
                print('Accion= ' + accion + ' Error= '+str(e))
        elif (accion == AccionesCrud.CREAR):
            try:
                Areas.objects.create(pais_id=pais, areaname_id=areaname)
            except Exception as e:
                print('Accion= ' + accion + ' Error= '+str(e))
        else:
            try:
                Areas.objects.filter(id=id).update(pais_id=pais, areaname_id=areaname)
            except Exception as e:
                print('Accion= ' + accion + ' Error= '+str(e))
        areas = Areas.objects.all().order_by('areaname_id')
        return render(request, 'areas_ajax_listar.html', {'areas': areas})
    
    