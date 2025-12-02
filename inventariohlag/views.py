from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import get_object_or_404, render,redirect
from django.http import HttpResponse
from django.core import signing, exceptions
from django.contrib.auth import logout
from django.http import JsonResponse
from django.contrib.auth.decorators import login_required
from inventariohlag.funciones import *
from .models import *
from tablas.models import *
from django.db.models import Q


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

def en_desarrollo(request):
    return render(request, '204.html')

@login_required(login_url='/login')
def activos(request):
#    if not request.user.is_superuser:
#        return render(request, '404.html')
    if (request.method == 'GET'):
        persona = request.user.persona
        owners = Owners.OWNERS
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
        if (request.user.is_superuser):
            if (persona.tipoactivo == TiposActivos.TODOS):
                tiposactivos = TiposActivos.get_choices(exclude=TiposActivos.TODOS)
                tipos_activos = [t[0] for t in TiposActivos.get_choices(exclude=TiposActivos.TODOS)]
            else:
                tiposactivos = TiposActivos.get_choices(include=persona.tipoactivo)
                tipos_activos = [t[0] for t in TiposActivos.get_choices(include=persona.tipoactivo)]
            filtro = Q(tipo__in=tipos_activos)
            activos = Activos.objects.filter(filtro).order_by('tipo','newid')
        else:
            tiposactivos = TiposActivos.get_choices(include=persona.tipoactivo)
            paises_areas = Paises.objects.filter(areas__id=persona.area_id)
            filtro = Q(country__in=paises_areas)
            activos = Activos.objects.filter(filtro,tipo=persona.tipoactivo).order_by('tipo','newid')
#        print(str(activos.query))
        return render(request,'activos_listar.html', {'activos': activos,'owners': owners,'edificios': edificios,'ciudades': ciudades,'paises': paises,
                                                    'tiposactivos': tiposactivos,'estados': estados,'modelos': modelos,
                                                    'fabricantes': fabricantes,'nombresactivos': nombresactivos,'proveedores': proveedores,'zonas': zonas,
                                                    'usuariosinv': usuariosinv,'contabilizados': contabilizados})
    else:
        return render(request, '404.html')    


@login_required(login_url='/login')
def checklastid(request):
    context = {}
    context['status'] = 500
    context['newid'] = 0
    
    if (request.method == 'POST'):
        tipo = request.POST.get('tipo')
        context['status'] = 200
        context['newid'] = siguiente_identificador(tipo)
    return JsonResponse({
        'context': context,
        })


def siguiente_identificador(tipo):
    from django.db.models import Max
    maximo = Activos.objects.filter(tipo=tipo).aggregate(Max('newid'))['newid__max']
    if maximo is None:
        return 1   # si no hay registros, empezar en 1
    return maximo + 1


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
            registro['newid'] = activo.newid            
            registro['nombre'] = activo.nombre_id
            registro['modelo'] = activo.modelo_id
            registro['fabricante'] = activo.fabricante_id
            registro['sku'] = activo.sku
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
        nombre = request.POST.get('nombre')
        modelo = request.POST.get('modelo')
        fabricante = request.POST.get('fabricante')
        sku = request.POST.get('sku')
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
                Activos.objects.create(tipo=tipo,nombre_id=nombre,modelo_id=modelo,fabricante_id=fabricante,
                                       detalle=detalle,serial=serial,proveedor_id=proveedor,owner=owner,factura=factura,fcompra=fcompra,
                                       vcompra=vcompra,factivacion=factivacion,accounted=accounted,vactual=vactual,
                                       building_id=building,floor=floor,zona_id=zona,city_id=city,country_id=country,sku=sku,
                                       estado=estado,festado=festado,usuarioinv_id=usuarioinv)
            except Exception as e:
                print('Accion= ' + accion + ' Error= '+str(e))
        else:
            try:
                Activos.objects.filter(id=id).update(tipo=tipo,nombre_id=nombre,modelo_id=modelo,fabricante_id=fabricante,
                                       detalle=detalle,serial=serial,proveedor_id=proveedor,owner=owner,factura=factura,fcompra=fcompra,
                                       vcompra=vcompra,factivacion=factivacion,accounted=accounted,vactual=vactual,
                                       building_id=building,floor=floor,zona_id=zona,city_id=city,country_id=country,sku=sku,
                                       estado=estado,festado=festado,usuarioinv_id=usuarioinv)
            except Exception as e:
                print('Accion= ' + accion + ' Error= '+str(e))                
        persona = request.user.persona
        if (request.user.is_superuser):
            if (persona.tipoactivo == TiposActivos.TODOS):
                tipos_activos = [t[0] for t in TiposActivos.get_choices(exclude=TiposActivos.TODOS)]
            else:
                tipos_activos = [t[0] for t in TiposActivos.get_choices(include=persona.tipoactivo)]
            filtro = Q(tipo__in=tipos_activos)
            activos = Activos.objects.filter(filtro).order_by('tipo','newid')
        else:
            paises_areas = Paises.objects.filter(areas__id=persona.area_id)
            filtro = Q(country__in=paises_areas)
            activos = Activos.objects.filter(filtro,tipo=persona.tipoactivo).order_by('tipo','newid')           
        return render(request, 'activos_ajax_listar.html', {'activos': activos})
    else:
        return render(request, '404.html')    


@login_required
def detalle_activo_qr(request, token):
    try:
        # Decodifica el token (expira a los 10 minutos = 600 segundos)
        data = signing.loads(token, max_age=600)
        id = data['id']
        activo = get_object_or_404(Activos, codigo=id)
    except exceptions.SignatureExpired:
        return HttpResponse("QR Code Expired. Please try scanning a new code.", status=403)
    except exceptions.BadSignature:
        return HttpResponse("Invalid QR Code.", status=403)
    owners = Owners.OWNERS
    contabilizados = Accounted.ACCOUNTED
    estados = Estados.ESTADOS
    tiposactivos = TiposActivos.get_choices(exclude=TiposActivos.TODOS)
    return render(request, 'activos_detalle.html', {'activo': activo,'owners': owners,'tiposactivos': tiposactivos,'contabilizados': contabilizados,'estados': estados})


@login_required(login_url='/login')
def ver_qr(request):
    context = {}
    context['status'] = 500
    context['qr_url'] = ""
    context['message'] = ""
    
    if (request.method == 'POST'):
        id = request.POST.get('id')
        try:
            activo = Activos.objects.get(id=id)
        except Exception as e:
            context['message'] = f"{e}"
        else:
            tipo = TiposActivos.TIPOS[int(activo.tipo)][1]
            context['status'] = 200
            context['qr_url'] = f"{settings.SITE_URL}{settings.MEDIA_URL}{activo.qr}"
#        print(context)
    return JsonResponse({
        'context': context,
        })


@login_required(login_url='/login')
def activos_qr_filtrar(request):
    
    if (request.method == 'GET'):
        persona = request.user.persona
        areas = NombresAreas.objects.all().order_by('nombre')
        paises = Paises.objects.filter(
            id__in=Areas.objects.filter(areaname_id=persona.area_id).values_list('pais_id', flat=True)
            ).order_by('nombre')
        ciudades =  Ciudades.objects.filter(pais_id=persona.pais_id).order_by('nombre')
        if (request.user.is_superuser):
            if (persona.tipoactivo == TiposActivos.TODOS):
                tiposactivos = TiposActivos.get_choices(exclude=TiposActivos.TODOS)
            else:
                tiposactivos = TiposActivos.get_choices(include=persona.tipoactivo)
        else:
            tiposactivos = TiposActivos.get_choices(include=persona.tipoactivo)
#        print(str(activos.query))
        return render(request,'activos_qr_filtrar.html', {'persona': persona, 'tiposactivos': tiposactivos, 'areas': areas, 'paises': paises, 'ciudades': ciudades})
    else:
        return render(request, '404.html')    


@login_required(login_url='/login')
def activos_qr_listar(request):
    
    if (request.method == 'POST'):
        tipo = request.POST.get('tipo')
        pais = request.POST.get('pais')
        ciudad = request.POST.get('ciudad')
        filters = {}
        if is_valid(tipo):
            filters['tipo'] = tipo
        if is_valid(pais):
            filters['country_id'] = pais
        if is_valid(ciudad):
            filters['city_id'] = ciudad
        activos = Activos.objects.filter(**filters).order_by('tipo','newid')
#        print(str(activos.query))
        return render(request,'activos_qr_listar.html', {'activos': activos})
    else:
        return render(request, '404.html')    


@login_required(login_url='/login')

def areas_listar(request):
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
    
    