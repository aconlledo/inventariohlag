#
#   usuarios.views.py Usuarios
#
""" 
    Este modulo premite realizar operaciones de usuarios
"""

from django.http import JsonResponse
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth import authenticate, login
from django.shortcuts import render
from .models import *
from inventariohlag.funciones import *
from tablas.models import NombresAreas

@csrf_exempt
def login_general(request):
    '''
    Realiza login del usuarios
    '''    
    context = {}
    context['status'] = 0 
    context['url'] = ''   
    context['message1'] = ''
    context['message2'] = ''   
    if (request.method == 'POST'):
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request,username=username, password=password)
        if user is None :
            context['status'] = 401 
            context['message1'] = f'Invalid Credentials.'
            context['message2'] = ''           
        elif user is not None and not user.is_active:
            context['status'] = 402
            context['message1'] = 'The account is locked.'
            context['message2'] = ''       
        elif user:
            try:
                persona = UsuariosPersonas.objects.get(usuario_id=user.id)
                if (persona.estado == EstadosPersonas.HABILITADO):
                    login(request, user)
                    userid = User.objects.get(username=username).id
                    persona = UsuariosPersonas.objects.get(usuario_id=userid)
                    if (persona.cclave == 0):
                        context['status'] = 200 
                        context['message1'] = 'Correct entry.'
                    else:
                        context['status'] = 201 
                        context['message1'] = 'You must change your password..'
                    if (persona.perfil == PerfilesUsuarios.USUARIO):
                        context['url'] = '/usuarios/login_usuario/'  
                    else:
                        if (persona.perfil == PerfilesUsuarios.ADMINISTRADOR):
                            context['url'] = '/usuarios/login_administrador/'  
                        else:                     
                            context['status'] = 403 
                            context['message1'] = f'Invalid Entry(403)'
                            context['message2'] = 'Not Enabled.'   
                else:
                    context['status'] = 404 
                    context['message1'] = f'Invalid Entry(404)'
                    context['message2'] = 'Not Enabled.'   
            except Exception as e:                           
                context['status'] = 405
                context['message1'] = f'Invalid Entry(405)'
                context['message2'] = f'{e}'   
        else:           
            context['status'] = 406
            context['message1'] = f'Invalid Entry(406)'
            context['message2'] = ''       
    else:
        context['status'] = 406
        context['message1'] = ErroresSYS.ERRORESSYS[ErroresSYS.ERROR_ACCESO][1]
#    print(context)
    return JsonResponse(context)
    
    
@csrf_exempt
@login_required(login_url='/login')
def login_administrador(request): 
    ''' 
    Envia home de administradores  
    '''
    if not request.user.is_superuser:
        return render(request, '404.html')
    if (request.method == 'POST'):
        username = request.POST.get('username')
        persona = UsuariosPersonas.objects.get(username=username)
        usuario = User.objects.get(id=persona.usuario_id) 
    else:
        usuario = User.objects.get(id=request.user.id)  
        persona = UsuariosPersonas.objects.get(usuario_id=usuario.id)
    if  (persona.perfil == PerfilesUsuarios.ADMINISTRADOR):
        return render(request, 'home_admin.html',{'usuario': usuario})
    else:
        return render(request, 'error.html', {'error_sys': ErroresSYS.ERRORESSYS[ErroresSYS.ERROR_ACCESO][9]})
    
    
@csrf_exempt
@login_required(login_url='/login')
def login_usuario(request): 
    '''
    Envia home de usuarios
    '''    
    if (request.method == 'POST'):
        username = request.POST.get('username')
        persona = UsuariosPersonas.objects.get(username=username)
        usuario = User.objects.get(id=persona.usuario_id)    
    else:
        usuario = User.objects.get(id=request.user.id) 
        persona = UsuariosPersonas.objects.get(usuario_id=usuario.id)      
    if (persona.perfil == PerfilesUsuarios.USUARIO):
        return render(request,'home_admin.html', {'usuario': usuario})
    else:
        return render(request, '404.html')
#
#   Cambio y/o olvido de clave 
#  
@csrf_exempt
def confirmacambioclave(request):
    '''
    Confirma cambio de clave del usuario.
    '''
    context = {}
    context['status'] = 0 
    context['message'] = ''
    if (request.method == 'POST'):
        username = request.POST.get('username')
        oldpassword = request.POST.get('oldpassword')
        newpassword = request.POST.get('newpassword')
        try:
            usuario = User.objects.get(username=username)
            if (oldpassword is None):
                todook = False
            else:
                if (usuario.check_password(oldpassword)):
                    todook = True
                else:
                    todook = False
            if (todook): 
                usuario.is_active= True
                usuario.set_password(newpassword)
                usuario.save()
                UsuariosPersonas.objects.filter(usuario_id=usuario.id).update(cclave=0,token='')
                context['status'] = 200 
                context['message'] = 'Password Changed.' 
            else:
                context['status'] = 404
                context['message'] = f'{ErroresSYS.ErroresSYS[ErroresSYS.ERROR_DATONOEXISTE][1]}'
        except Exception as e:
            context['status'] = 404 
            context['message'] = f'Internal Error. ERROR = {e}'
    else:
        context['status'] = 400
        context['message'] = f'{ErroresSYS.ErroresSYS[ErroresSYS.ERROR_ACCESO][1]}'
    return JsonResponse(context)
  
@csrf_exempt  
def confirmaolvidoclave(request):
    '''
    Confirma cambio de clave por olvido enviando nueva clave al mail del usuario
    '''   
    from inventariohlag.mails import mail_cambio_clave
    from django.utils.crypto import get_random_string
     
    context = {}
    context['status'] = 0 
    context['message'] = ''
    if (request.method == 'POST'):
        username = request.POST.get('username')
        try:
            usuario = User.objects.get(username=username)
            password = generar_password(longitud=16)
            usuario.set_password(password)
            usuario.save()
            nombre = usuario.first_name
            apellido = usuario.last_name
            mail = usuario.email
            persona = UsuariosPersonas.objects.get(usuario_id=usuario.id)          
#            token = get_random_string(64)
            UsuariosPersonas.objects.filter(id=persona.id).update(cclave=1)
            status , mensaje = mail_cambio_clave(nombre,apellido,password,mail)
            context['status'] = status 
            context['message'] = mensaje 
        except User.DoesNotExist:
            context['status'] = 404 
            context['message'] = 'Error: User NOT found'
        except Exception as e:
            context['status'] = 400 
            context['message'] = f'Internal Error. ERROR = {e}'
    else:
        context['status'] = 400
        context['message'] = f'Internal Error. ERROR = : {ErroresSYS.ErroresSYS[ErroresSYS.ERROR_ACCESO][1]}'
#    print (context)
    return JsonResponse(context) 

 
def validarlogin(request):
    '''
    Verifica si existe username en tabla auth_user
    Ajax desde dologin.js
    '''   
    from inventariohlag.funciones import enmascarar_email, ErroresPH
    
    context = {}
    context['status'] = 0 
    context['message'] = ''
    if (request.method == 'POST'):
        username = request.POST.get('username')
        password = request.POST.get('password')
        try:
            usuario = User.objects.get(username=username)
            if (password is not None):
                if (usuario.check_password(password)):
                    todook = True
                else:
                    todook = False
            else:
                todook = True
            if (todook):    
                context['status'] = 200 
                context['message'] = enmascarar_email(usuario.email)
            else: 
                context['status'] = 404 
                context['message'] = 'User/Password NOT found'
        except User.DoesNotExist:
            context['status'] = 404 
            context['message'] = 'User NOT found'
        except Exception as e:
            context['status'] = 404 
            context['message'] = f'Internal Error. ERROR =  {e}'
    else:
        context['status'] = 400
        context['message'] = f'{ErroresPH.ERRORESPH[ErroresPH.ERROR_ACCESO][1]}'
    return JsonResponse(context)


@login_required(login_url='/login')
def usuarios_listar(request):
    ''' 
    Si es GET Lista usuarios; Si es POST crea o modifica usuarios 
    Viene desde 1) via GET home_adm_base.html 
                2) via POST ajax personas_listar.js en personas_listar.html. Retorna html
    '''
#    if not request.user.is_superuser:
#        return render(request, '404.html')
    if (request.method == 'GET'):
        estados = EstadosPersonas.ESTADOS_PERSONAS
        perfiles = PerfilesUsuarios.PERFILES_USUARIOS
        tiposactivos = TiposActivos.TIPOS
        paises = Paises.objects.all().order_by('nombre')
        areas = NombresAreas.objects.all().order_by('nombre')
        areas = NombresAreas.objects.all().order_by('nombre')
        if request.user.is_superuser:
            personas = UsuariosPersonas.objects.all().order_by('id')
        else:
            personas = UsuariosPersonas.objects.filter(id=request.user.persona.id).order_by('id')
        return render(request, 'usuarios_listar.html', {'personas':personas,'paises':paises,'estados':estados,'perfiles':perfiles,'tiposactivos':tiposactivos,'areas':areas})
    else:
        accion = request.POST.get('accion')
        id = request.POST.get('id')
        username = request.POST.get('username')
        nombres = request.POST.get('nombres')
        apellidos = request.POST.get('apellidos')
        email = request.POST.get('email')
        perfil = request.POST.get('perfil')
        estado = request.POST.get('estado')
        pais = request.POST.get('pais')
        tipoactivo = request.POST.get('tipoactivo')
        area = request.POST.get('area')
        if (accion == AccionesCrud.CREAR):
            status, mensaje = crear_persona(username,nombres,apellidos,email,perfil,pais,tipoactivo,area,estado)
            if (status != 200):
                print(f'Status:{status}. Mensaje:{mensaje}')
        else:
            modificar_persona(id,username,nombres,apellidos,email,perfil,pais,tipoactivo,area,estado)
        personas = UsuariosPersonas.objects.all().order_by('id')
        return render(request, 'usuarios_ajax_listar.html', {'personas': personas})


def crear_persona(username,nombres,apellidos,email,perfil,pais,tipoactivo,area,estado): 
    '''
    Crea registro en tabla  usuarios_personas y en auth_user; generando un usuario registrado
    Usado solo dentro de phadmin.views.py 
    '''
    from inventariohlag.mails import mail_nueva_clave
    
    status = 200
    mensaje = "Usuario Creado"
    
    if (perfil == PerfilesUsuarios.ADMINISTRADOR):
        es_admin = True
    else:
        es_admin = False
    try:
        if (estado == EstadosPersonas.BLOQUEADO):
            esta_activo = False
        else:
            esta_activo = True
        newpassword = generar_password(longitud=16)
        nuevo_usuario = User.objects.create_user(username=username,first_name=nombres,last_name=apellidos,email=email,is_staff=True,is_active=esta_activo,is_superuser=es_admin)
        nuevo_usuario.set_password(newpassword)
        nuevo_usuario.save()
        userid = nuevo_usuario.id
        try:
            UsuariosPersonas.objects.create(username=username,nombres=nombres,apellidos=apellidos,email=email,perfil=perfil,pais_id=pais,usuario_id=userid,tipoactivo=tipoactivo,area=area,estado=estado)
            status , mensaje = mail_nueva_clave(nombres,apellidos,username,newpassword,email)
        except Exception as e:
            status = 400
            mensaje = ' Error= '+str(e)
    except Exception as e:
        status =  404
        mensaje = ' Error= '+str(e), ''
    print(f'status {status}, mensaje {mensaje}') 

    return status, mensaje


def modificar_persona(id,username,nombres,apellidos,email,perfil,pais,tipoactivo,area,estado):
    '''
    Modifica registro en tablas usuarios_personas y auth_user;
    Usado solo dentro de phadmin.views.py
    '''    
    userid = UsuariosPersonas.objects.get(id=id).usuario.id
    try:
        UsuariosPersonas.objects.filter(id=id).update(username=username,nombres=nombres,apellidos=apellidos,email=email,
                                                      perfil=perfil,pais=pais,tipoactivo=tipoactivo,area=area,estado=estado)
        try:
            if (perfil == PerfilesUsuarios.ADMINISTRADOR):
                es_admin = True
            else:
                es_admin = False
            if (estado == EstadosPersonas.BLOQUEADO):
                esta_activo = False
            else:
                esta_activo = True
            usuario = User.objects.get(id=userid)
            usuario.username = username
            usuario.first_name = nombres
            usuario.last_name = apellidos
            usuario.is_superuser = es_admin
            usuario.is_active = esta_activo
            usuario.email = email
            usuario.save()
        except Exception as e:
            print('Accion= Modificar Usuario' + ' Error(1)= '+str(e))  
    except Exception as e:
        print('Accion= Modificar Usuario' + ' Error(2)= '+str(e))
        
     
@login_required(login_url='/login')
def ver_persona(request):
    '''
    Lee usuario en tabla usuarios_personas
    '''   
#    if not request.user.is_superuser:
#        return render(request, '404.html')
    if (request.method == 'POST'):
        id = request.POST.get('id')
        if id is not None:
            try:
                persona = UsuariosPersonas.objects.get(id=id)
                data = {'id': persona.id, 'username': persona.username, 'nombres': persona.nombres,'apellidos': persona.apellidos,'email': persona.email,
                        'pais': persona.pais_id,'estado': persona.estado,'perfil': persona.perfil,'tipoactivo': persona.tipoactivo,'area': persona.area_id}
            except:
                data = {}
        else:
            data = {}
        return JsonResponse(data,safe=False )	
    else:
        return render(request, '404.html')        		


@login_required(login_url='/login')
def cambiar_estado(request):
    '''
    Lee usuario en tabla usuarios_personas
    '''   
    if not request.user.is_superuser:
        return render(request, '404.html')
    if (request.method == 'POST'):
        id = request.POST.get('id')
        estado = request.POST.get('estado')
        try:
            persona = UsuariosPersonas.objects.get(id=id)
            persona.estado=estado
            persona.save()
            usuario = User.objects.get(id=persona.usuario_id)
            try:
                if (estado == EstadosPersonas.HABILITADO):
                    usuario.is_active=True
                else:
                    usuario.is_active=False
                usuario.save()
            except Exception as e:
                mensaje = ' Error(1)= '+str(e)
                print('Accion: Cambio Estado Usuario' + mensaje) 
                return render(request, 'error.html', {'error_sys':mensaje}) 
            else:
                personas = UsuariosPersonas.objects.all().order_by('id')
                return render(request, 'usuarios_ajax_listar.html', {'personas': personas})
        except Exception as e:
            mensaje = ' Error(2)= '+str(e)
            print('Accion: Cambio Estado Usuario' + mensaje)
            return render(request, 'error.html', {'error_sys': mensaje})
    else:
        return render(request, '404.html')    
  
  
    
@login_required(login_url='/login')
def admin_cambia_password(request):  
    '''
    Administrador cambia clave del usuario.
    '''
    context = {}
    context['status'] = 0 
    context['message'] = ''
    if not request.user.is_superuser:
        return render(request, '404.html')
    if (request.method == 'POST'):
        id = request.POST.get('id')
        password = request.POST.get('password')
        try:
            usuario_id = UsuariosPersonas.objects.get(id=id)
            usuario = User.objects.get(id=usuario_id)
            usuario.set_password(password)
            usuario.save()
            context['status'] = 200 
            context['message'] = 'Password Changed.' 
        except Exception as e:
            context['status'] = 404 
            context['message'] = f'Internal Error. ERROR = {e}'
    else:
        context['status'] = 400
        context['message'] = f'{ErroresSYS.ErroresSYS[ErroresSYS.ERROR_ACCESO][1]}'
    return JsonResponse(context)


@login_required(login_url='/login')
def checkactiveusername(request):
    context = {}
    context['status'] = 0
    context['message'] = ""
    
    if (request.method == 'POST'):
        username = request.POST.get('username')
        try:
            UsuariosPersonas.objects.get(username=username)
        except UsuariosPersonas.DoesNotExist:
            context['status'] = 404 
            context['message'] = f'Username Available!!'
        except Exception as e: 
            context['status'] = 500 
            context['message'] = f'Error: {e}'
        else:
            context['status'] = 200 
            context['message'] = f'Username Not Available!!'       
    else:
        context['status'] = 500 
        context['message'] = f'Access Error'
    return JsonResponse({
        'context': context,
        })
