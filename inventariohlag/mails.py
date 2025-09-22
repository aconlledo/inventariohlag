#
#   archivo inventariohlag.mails
# 

from django.core.mail import EmailMessage, BadHeaderError
from django.contrib.auth.models import User
from smtplib import SMTPException
from .settings import EMAIL_HOST_USER
from .funciones import Constantes
import os


def mail_cambio_clave(nombre,apellido,password,mail):
    '''
    Envia mail al usuario con una nueva contraseña temporal
    Desde vista usuarios.views.confirmacambioclave
    '''
    subject = 'Password Change in Inventory Management HAPAG'
    l1 = f'Dear: {nombre} {apellido}. \n\nYou have requested to recover the key on Inventory Management HAPAG ({Constantes.URL_SERVERACTUAL})\n\n'
    l2 = f'On your next login, use your new temporary password: "{password}"\n\n(Copy and paste that is in quotes)\n\n'
    body = l1 + l2 + Constantes.FIRMA_SOPORTE + Constantes.FIRMA_CORREOS
    from_email = EMAIL_HOST_USER
    to_email = [mail]
    email = EmailMessage(subject, body, from_email, to_email) 
    try:
        email.send()
        status = 200
        mensaje = f"Confirmation email sent to {mail}. {Constantes.REVISESUMAIL}"
    except BadHeaderError:
        status = 502
        mensaje = "Email NOT sent to User: Invalid header."
    except SMTPException as e:
        status = 502
        mensaje = f"Email NOT sent to User: SMTP Error: {str(e)}"
    except Exception as e:
        status = 500
        mensaje = f"Email NOT sent to the User: UNKNOWN ERROR: {str(e)}"
    return status , mensaje  

def mail_nueva_clave(nombre,apellido,username,password,mail):
    '''
    Envia mail al usuario con una nueva contraseña temporal
    Desde vista usuarios.views.crear_persona
    '''
    subject = 'New Account on Inventory Management HAPAG'
    l1 = f'Dear: {nombre} {apellido}. \n\nA new account has been created for you on Inventory Management HAPAG ({Constantes.URL_SERVERACTUAL})\n\n'
    l2 = f'On your first login use the username: "{username}" and a temporary password: "{password}"\n\n(Copy and paste that is in quotes)\n\n'
    body = l1 + l2 + Constantes.FIRMA_SOPORTE + Constantes.FIRMA_CORREOS
    mail_admin =  User.objects.get(id=1).email
    from_email = EMAIL_HOST_USER
    to_email = [mail,mail_admin]
    email = EmailMessage(subject, body, from_email, to_email) 
    try:
        email.send()
        status = 200
        mensaje = f"Confirmation email sent to {mail}. {Constantes.REVISESUMAIL}"
    except BadHeaderError:
        status = 502
        mensaje = "Email NOT sent to User: Invalid header."
    except SMTPException as e:
        status = 502
        mensaje = f"Email NOT sent to User: SMTP Error: {str(e)}"
    except Exception as e:
        status = 500
        mensaje = f"Email NOT sent to the User: UNKNOWN ERROR: {str(e)}"
    return status , mensaje  


def mail_usuario_cambioestado(persona):

    from usuarios.models import EstadosPersonas 
    subject = f"Notice of Change of Status on Inventory Management HAPAG"
    l1 = f'Dear: {persona.nombre} {persona.apellido}\n\n'
    l2 = f'We inform you that for internal reasons your account '
    if (persona.estado == '0'):
        l3 = 'has been Locked.\n\n'
    else: 
        l3 = 'has been UnLocked; you can use Inventory Management HAPAG again.\n\n'
    body = l1 + l2 + l3 + Constantes.FIRMA_SOPORTE + Constantes.FIRMA_CORREOS
    from_email = EMAIL_HOST_USER
    to_email = [persona.email]
    email = EmailMessage(subject, body, from_email, to_email) 
    try:
        email.send()
        status = 200
    except Exception as e:
        status = 500
    return status 
