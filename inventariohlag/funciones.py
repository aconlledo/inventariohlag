# 
#  funciones.py
#
""" 
    En este modulo se definen alguna funciones varias
"""
import calendar
import os
import re
import string
import random
from datetime import datetime, timedelta, date, time
from django.conf import settings
from dateutil.relativedelta import relativedelta


class ErroresSYS:
    ERROR_DESCONOCIDO = 0
    ERROR_ACCESO = 1
    ERROR_LECTURA = 2
    ERROR_ESCRITURA = 3
    ERROR_DATOEXISTE = 4
    ERROR_DATONOEXISTE = 5
    ERROR_TIPODATO = 6
    ERROR_FALTAPARAM = 7
    ERROR_ERRORPARAM = 8
    ERROR_USERLOCK = 9
    ERROR_NOAUTORIZADO = 10
    ERRORESSYS = [
        (ERROR_DESCONOCIDO, 'UNKNOWN ERROR'),
        (ERROR_ACCESO, 'ERROR TIPO DE ACCESO'),
        (ERROR_LECTURA, 'ERROR LECTURA EN BD'),
        (ERROR_ESCRITURA, 'ERROR ESCRITURA EN BD'),
        (ERROR_DATOEXISTE, 'ERROR INFORMACION YA EXISTE'),
        (ERROR_DATONOEXISTE, 'ERROR INFORMACION NO EXISTE'),
        (ERROR_TIPODATO, 'ERROR TIPO DE DATO NO EXISTE'),
        (ERROR_FALTAPARAM, 'ERROR FALTAN PARAMETROS'),
        (ERROR_ERRORPARAM, 'ERROR EN PARAMETROS'),
        (ERROR_USERLOCK, 'ERROR USUARIO NO HABILITADO'),
        (ERROR_NOAUTORIZADO, 'ERROR NO AUTORIZADO'),
        ]
    
class MensajesMail:
    MAILHEADERERROR = 0
    MAILSMTPERROR = 1
    MAILERRORDESCONOCIDO = 2
    MAILENVIADO = 3
    MENSAJESMAIL = [
        (MAILHEADERERROR, 'Correo NO enviado: Encabezado inválido.'),
        (MAILSMTPERROR, 'Correo NO enviado: Error en SMTP:'),
        (MAILERRORDESCONOCIDO, 'Correo NO enviado: UNKNOWN ERROR'),
        (MAILENVIADO, 'Se ha enviado Correo '),
        ] 

class Constantes:
    ESPANOL = 0
    INGLES = 1 
    DEFAULTCOUNTRY = 1    # Viene del id de la tabla tablas_ciudades
    DEFAULTCITY = 1    # Viene del id de la tabla tablas_comunas
    TRANSFERENCIA = 1
    MAIL_ADMIN = 'aconlledo@vilco.cl'
    URL_SERVERPROD = 'http://127.0.0.1'
    URL_SERVERTEST = 'http://127.0.0.1:8000'
    URL_SERVERLOCAL = 'http://127.0.0.1:8000'
    # Dependiendo del servidor en cual se instalara la aplicacion el valor de la URL_TALLERACTUAL 
    # debe ser igual a uno de los anteriores
    URL_SERVERACTUAL = URL_SERVERLOCAL

    REVISESUMAIL = ' \nPlease check your inbox or spam folder..'
    FIRMA_SOPORTE = 'Do not hesitate to contact our Support if you have any problems..\n\n'
    FIRMA_CORREOS = 'This is an email sent automatically from Inventory Managment HAPAG. Please do not reply\n\nSincerely, Inventory Managment HAPAG\n\n'
    
   
class MesesAgno:
    ENERO = '0'
    FEBRERO = '1'
    MARZO = '2'
    ABRIL = '3'
    MAYO = '4'
    JUNIO = '5'
    JULIO = '6'
    AGOSTO = '7'
    SEPTIEMBRE = '8'
    OCTUBRE = '9'
    NOVIEMBRE = '10'
    DICIEMBRE = '11'
    MESES_AGNO = [
        (ENERO, 'Enero'),
        (FEBRERO, 'Febrero'),
        (MARZO, 'Marzo'),
        (ABRIL, 'Abril'),
        (MAYO, 'Mayo'),
        (JUNIO, 'Junio'),
        (JULIO, 'Julio'),
        (AGOSTO, 'Agosto'),
        (SEPTIEMBRE, 'Septiembre'),
        (OCTUBRE, 'Octubre'),
        (NOVIEMBRE, 'Noviembre'),
        (DICIEMBRE, 'Diciembre'),
    ] 

          
class AccionesCrud:
    ELIMINAR = '0'
    CREAR = '1'
    MODIFICAR = '2'
    VER = '3'
    BLOQUEAR = '4'
    DESBLOQUEAR = '5'
    ANULAR = '6'    
    AGENDAR = '7'  
    ERROR = '8'
    ACCIONES_CRUD = [
        (ELIMINAR, 'Elimina'),
        (CREAR, 'Ingresa'),
        (MODIFICAR, 'Modifica'),
        (VER, 'Consulta'),
        (BLOQUEAR, 'Bloquea'),
        (DESBLOQUEAR, 'Desbloquea'),
        (ANULAR, 'Anula'),
        (AGENDAR, 'Agenda'),
        (ERROR, 'ERROR'),
        ]   

    
def number_unformat(nump,formato=Constantes.ESPANOL):
    
    if nump == "":
        numx = "0"
    else:
        nums = str(nump)
        if formato == Constantes.ESPANOL:
            nums = nums.replace(".", "")
            numx = nums.replace(",", ".")
        else: 
            numx = nums.replace(",", "")
    return numx

def number_format(numero):
    if numero is None:
        return ""
    else:
        numero_formateado = "{:,}".format(int(numero)).replace(",", ".")
        return f"{numero_formateado}"

def ultima_fecha_del_mes(anio, mes):
    ultimo_dia = calendar.monthrange(anio, mes)[1]
    ultima_fecha = datetime(anio, mes, ultimo_dia)
    return ultima_fecha
 
 
def fecha_hora_actual():
    return datetime.now()


def hora_actual():
    hora = datetime.now().time()
    hora = hora.replace(second=0, microsecond=0)
    return hora

def hora_cero():
    hora = datetime.now().time()
    return hora.replace(hour=0, minute=0, second=0, microsecond=0)


def fecha_de_hoy():
    return date.today()


def fecha_de_hoy_sql():
    '''
    Retorna fecha de hoy en string con formato aaaa-mm-dd. 
    '''
    hoy = datetime.now()
    fecha_formateada = hoy.strftime('%Y-%m-%d')
    return fecha_formateada


def fecha_de_hoy_str():
    '''
    Retorna fecha de hoy en string con formato dd-mm-aaaa. 
    '''
    hoy = datetime.now()
    fecha_formateada = hoy.strftime('%d-%m-%Y')
    return fecha_formateada


def nueva_fecha_final(finicial,ffinal,finicial2):
    '''
    Recibe 3 fechas en formato string. 
    Calcula la cantidad de dias entre finicial y ffinal
    Suma esos dias a finicial2 y retorna fecha final
    '''
    f1 = datetime.strptime(finicial, '%Y-%m-%d')
    f2 = datetime.strptime(ffinal, '%Y-%m-%d')
    f3 = datetime.strptime(finicial2, '%Y-%m-%d')
    dias_entre_fechas = (f2 - f1).days              # Calculamos la cantidad de días entre f1 y f2
    f4 = f3 + timedelta(days=dias_entre_fechas)     # Sumamos la cantidad de días a f3 para obtener f4
    return f4


def fecha_str_to_sql(fecha_str):
    '''
    Recibe fecha string en formato dd-mm-aaaa
    Devuelve fecha string en formato aaaa-mm-dd 
    '''   
    if not fecha_str:
        return None
    if isinstance(fecha_str, str):
        fecha = datetime.strptime(fecha_str, '%d-%m-%Y')
        fecha_nuevo_formato = fecha.strftime('%Y-%m-%d')
    else:
        fecha_nuevo_formato = fecha_str
    return fecha_nuevo_formato

 
def fecha_sql_to_str(fecha_str):
    '''
    Recibe fecha string en formato aaaa-mm-dd 
    Devuelve fecha string en formato dd-mm-aaaa
    '''   
    try:
        fecha1 = datetime.strptime(fecha_str, '%Y-%m-%d').date()
    except:
        fecha1 = fecha_str
    try:
        fecha_nuevo_formato = fecha1.strftime('%d-%m-%Y')
    except Exception as e:
        return(f"Error: {e}")
    return fecha_nuevo_formato


def convertir_minutos_a_horas_formato24(minutos):
    '''
    Recibe minutos y devuelve hh:mm formato 24 hrs
    ''' 
    horas = minutos // 60
    minutos_restantes = minutos % 60
    return f'{horas:02d}:{minutos_restantes:02d}'

def sumar_dias_str(fecha_str,dias=1):
    # Convertir el string a un objeto datetime
    fecha_obj = datetime.strptime(fecha_str, "%Y-%m-%d")
    # Sumar día(s)
    nueva_fecha_obj = fecha_obj + timedelta(days=dias)
    # Convertir de nuevo a string en el formato "YYYY-mm-dd"
    return nueva_fecha_obj.strftime("%Y-%m-%d")


def fecha_anterior_a_hoy(fecha,hora):
    # fecha y hora en formato sql
    hoy = datetime.now()
    fecha_hora = datetime.combine(fecha,hora)
    if (fecha_hora < hoy):
        return True
    else:
        return False

def rut_formateado(rut):
    numero, digito = rut[:-1], rut[-1].upper()
    numero_formateado = "{:,}".format(int(numero)).replace(",", ".")
    return f"{numero_formateado}-{digito}"


def rut_sin_formato(rut):
    return rut.replace('.', '').replace('-', '')


def rut_a_username(rut):
    ''' 
    Elimina puntos y guion de un rut el cual se usa como username  
    Ej: Rut 7.777.777-K queda como  7777777K
    '''
    newrut = re.sub(r'[.-]', '', rut)
    return newrut


def generar_password(longitud=8):
    caracteres_permitidos = string.ascii_letters + string.digits + '()+-*._'
    password = ''.join(random.choice(caracteres_permitidos) for i in range(longitud))
    return password


def add_months_to_date(date_str, months):
    try:
        date_obj = datetime.strptime(date_str, '%Y-%m-%d').date()
        new_date = date_obj + relativedelta(months=+int(months))
    except Exception as e:
        return(f"Error: {e}")
    return str(new_date)
  
      
def mostrar_fecha_actual():
    # Obtener la fecha y hora actual
    now = datetime.now()
    dia1= now+ timedelta(days=1)
    dia2=dia1+ timedelta(days=1)
    dia3=dia2+ timedelta(days=1)
    dia4=dia3+ timedelta(days=1)

    dias_semana = {
        0: 'Lunes',
        1: 'Martes',
        2: 'Miércoles',
        3: 'Jueves',
        4: 'Viernes',
        5: 'Sábado',
        6: 'Domingo'
    }
    dia_semana = dias_semana[now.weekday()]
    mes_y_anio = now.strftime('%B %Y')  # Formato completo del mes y el año, por ejemplo "Mayo 2024"
    return dia_semana , mes_y_anio, now.strftime("%d/%m/%Y") , dia1.strftime("%d/%m/%Y"),dia2.strftime("%d/%m/%Y"),dia3.strftime("%d/%m/%Y"),dia4.strftime("%d/%m/%Y")


def enmascarar_email(email):
    usuario, dominio = email.split('@')  
    if len(usuario) > 2:
        usuario_enmascarado = usuario[0] + '*' * (len(usuario) - 2) + usuario[-1]
    else:
        usuario_enmascarado = usuario[0] + '*' * (len(usuario) - 1) 
    dominio_nombre, tld = dominio.rsplit('.', 1) 
    if len(dominio_nombre) > 2:
        dominio_enmascarado = dominio_nombre[0] + '*' * (len(dominio_nombre) - 2) + dominio_nombre[-1]
    else:
        dominio_enmascarado = dominio_nombre  
    email_enmascarado = usuario_enmascarado + '@' + dominio_enmascarado + '.' + tld
    return email_enmascarado


def obtener_ip_cliente(request):
    ip = request.META.get('HTTP_X_FORWARDED_FOR')
    if ip:
        ip = ip.split(',')[0]
    else:
        ip = request.META.get('REMOTE_ADDR')
    return ip
