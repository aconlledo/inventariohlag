#
################################################  START PROCESS  ################################################
#   
import os
import sys
from pathlib import Path
import shutil
from django import setup
from openpyxl import load_workbook
from django.db.models import Max
from tablas.models import *
from inventariohlag.models import *
from inventariohlag.funciones import *
from django.db import connection

BASE_DIR = Path(__file__).resolve().parent
sys.path.append(str(BASE_DIR))

# === Configurar Django ===
# sys.path.append(os.path.dirname(os.path.abspath(__file__)))
sys.path.append(str(Path(__file__).resolve().parents[1]))
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "inventariohlag.settings")
setup()

# === Ruta del archivo Excel ===
RUTA_ARCHIVO = os.path.join(".\data", "gestion_de_activos.xlsm")  

def elimina_qr():
    qr_dir = Path(BASE_DIR / "media" / "qrcodes")
    if qr_dir.exists() and qr_dir.is_dir():
        print(f"🧹 Eliminando contenido de la carpeta  {qr_dir}...")
        for archivo in qr_dir.iterdir():
            try:
                if archivo.is_file():
                    archivo.unlink()
                elif archivo.is_dir():
                    shutil.rmtree(archivo)
            except Exception as e:
                print(f"⚠️ No se pudo eliminar {archivo}: {e}")
    else:
        print(f"📁 La carpeta {qr_dir} no existe, se creará.")
        qr_dir.mkdir(parents=True, exist_ok=True)
        
        
def siguiente_identificador(tipo):
    maximo = Activos.objects.filter(tipo=tipo).aggregate(Max('newid'))['newid__max']
#    print(connection.queries[-1]['sql'])
    if maximo is None:
        return 1 
    return maximo + 1


def importar_excel():
    if not os.path.exists(RUTA_ARCHIVO):
        print(f"Archivo no encontrado: {RUTA_ARCHIVO}")
        return
    Activos.objects.all().delete()
    with connection.cursor() as cursor:
        cursor.execute("ALTER TABLE hlag_activos AUTO_INCREMENT = 1;")
    Modelos.objects.all().delete()
    with connection.cursor() as cursor:
        cursor.execute("ALTER TABLE tablas_modelos AUTO_INCREMENT = 1;")
    Fabricantes.objects.all().delete()
    with connection.cursor() as cursor:
        cursor.execute("ALTER TABLE tablas_fabricantes AUTO_INCREMENT = 1;")
    NombresActivos.objects.all().delete()
    with connection.cursor() as cursor:
        cursor.execute("ALTER TABLE tablas_nombresactivos AUTO_INCREMENT = 1;")
    Zonas.objects.all().delete()
    with connection.cursor() as cursor:
        cursor.execute("ALTER TABLE tablas_zonas AUTO_INCREMENT = 1;")
    UsuariosInventario.objects.all().delete()
    with connection.cursor() as cursor:
        cursor.execute("ALTER TABLE tablas_usuariosinventario AUTO_INCREMENT = 1;")
    Paises.objects.all().delete()
    with connection.cursor() as cursor:
        cursor.execute("ALTER TABLE tablas_paises AUTO_INCREMENT = 1;")
    Ciudades.objects.all().delete()
    with connection.cursor() as cursor:
        cursor.execute("ALTER TABLE tablas_ciudades AUTO_INCREMENT = 1;")
    Edificios.objects.all().delete()
    with connection.cursor() as cursor:
        cursor.execute("ALTER TABLE tablas_edificios AUTO_INCREMENT = 1;")   
    elimina_qr()     
    total = 0
    factual = 3
    wb = load_workbook(filename=RUTA_ARCHIVO, data_only=True)
    hoja = wb.active
    for fila in hoja.iter_rows(min_row=3, values_only=True): 
        atype,aid,specint,aname,modelo,desc1,desc2,desc3,item,serial,manufacturer,provider,owner,invoice,pdated,pvalue,adated,accounted,uvalue,location,building,floor,zone,city,country,status,sdated,userinv= fila
        if (desc1 is None):
            desc1 = ''
        else:    
            desc1 = desc1.strip()
        if (desc2 is None):   
            desc2 = ''
        else: 
            desc2 = desc2.strip()
        if (desc3 is None):   
            desc3 = ''
        else: 
            desc3 = desc3.strip()
        descrip = f'Oldid={aid}:  {desc1} {desc2} {desc3}' 
        if (manufacturer in (None, 'N/A','')):
            fabricanteid = None
        else:
            manufacturer = manufacturer.strip()
            try:
                fabricanteid = Fabricantes.objects.get(nombre=manufacturer).id
            except Fabricantes.DoesNotExist:
                fabricanteid = Fabricantes.objects.create(nombre=manufacturer).id
        if (modelo is None):
            modeloid = None
        else:
            modelo = modelo.strip()
            try:
                modeloid = Modelos.objects.get(nombre=modelo).id
            except Modelos.DoesNotExist:
                modeloid = Modelos.objects.create(nombre=modelo,fabricante_id=fabricanteid).id
        if (aname is None):  
            nomactivoid = None
        else:      
            aname = aname.strip()
            try:
                nomactivoid = NombresActivos.objects.get(nombre=aname).id
            except NombresActivos.DoesNotExist:
                nomactivoid = NombresActivos.objects.create(nombre=aname).id
        if (zone is None):     
            zonaid = None
        else:     
            zone = zone.strip()
            try:
                zonaid = Zonas.objects.get(nombre=zone).id
            except Zonas.DoesNotExist:
                zonaid = Zonas.objects.create(nombre=zone).id
        if (userinv in (None, 'N/A')):
            usuarioid = None
        else:
            try:
                usuarioid = UsuariosInventario.objects.get(nombre=userinv).id
            except UsuariosInventario.DoesNotExist:
                usuarioid = UsuariosInventario.objects.create(nombre=userinv).id 
        if (country is None):     
            countryid = None
        else:     
            country = country.strip()
            try:
                countryid = Paises.objects.get(nombre=country).id
            except Paises.DoesNotExist:
                countryid = Paises.objects.create(nombre=country).id                
        if (city is None):     
            cityid = None
        else:     
            city = city.strip()
            try:
                cityid = Ciudades.objects.get(nombre=city).id
            except Ciudades.DoesNotExist:
                cityid = Ciudades.objects.create(nombre=city,pais_id=countryid).id                  
        if (building is None):     
            buildingid = None
        else:     
            building = building.strip()
            try:
                buildingid = Edificios.objects.get(nombre=building).id
            except Edificios.DoesNotExist:
                buildingid = Edificios.objects.create(nombre=building,pais_id=countryid,ciudad_id=cityid).id                   
        accounted = '0' if accounted in (None, 'N/A') else '1'
        if (atype is None):   
            atypeid = 1
        else:
            atype = atype.strip()
            atypeid = next((i for i, (_, nombre) in enumerate(TiposActivos.TIPOS) if nombre == atype), None)
            newid = siguiente_identificador(atypeid)
        if (aid is not None):   
            aid = aid.strip()
        if (specint is None):  
            spec = None
        else:
            spec = str(specint) 
            spec = spec.strip()
        if (owner is None):  
            ownerid = None
        else: 
            owner = owner.strip()
            ownerid = next((i for i, (_, nombre) in enumerate(Owners.OWNERS) if nombre == owner), None)
##       if (location is None): Location no se usara   
##            locationid = None
##        else:
##            location = location.strip()
##            locationid = next((i for i, (_, nombre) in enumerate(Locations.LOCATIONS) if nombre == location), None)
        if (status is None):   
            statusid = None
        else:
            status = status.strip()
            statusid = next((i for i, (_, nombre) in enumerate(Estados.ESTADOS) if nombre == status), None)
        adate = fecha_str_to_sql(adated)
        pdate = fecha_str_to_sql(pdated)
        sdate = fecha_str_to_sql(sdated)
        try:
            Activos.objects.create(tipo=atypeid,newid=newid,nombre_id=nomactivoid,modelo_id=modeloid,fabricante_id=fabricanteid,detalle=descrip,
                                serial=serial,proveedor_id=provider,owner=ownerid,factura=invoice,fcompra=pdate,vcompra=pvalue,factivacion=adate,
                                accounted=accounted,vactual=uvalue,building_id=buildingid,floor=floor,zona_id=zonaid,city_id=cityid,country_id=countryid,
                                estado=statusid,festado=sdate,usuarioinv_id=usuarioid)  
            total += 1        
            print(f"Fila {factual} Ingresada. {fila}")                     
        except Exception as e:
            print(f'Error en Fila {factual} = '+str(e))   
        factual += 1                     
    print(f"Se Ingresaron {total} filas.")


if __name__ == "__main__":
    importar_excel()

