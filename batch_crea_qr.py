#
################################################  START PROCESS  ################################################
#   
import os
import sys
from pathlib import Path
import shutil
from django import setup

BASE_DIR = Path(__file__).resolve().parent
sys.path.append(str(BASE_DIR))

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "inventariohlag.settings")
setup()

from tablas.models import *
from inventariohlag.models import *  # usa el nombre real de la app donde está Activos


def elimina_qr():
    qr_dir = Path(BASE_DIR / "media" / "qrcodes")
    if qr_dir.exists() and qr_dir.is_dir():
        print(f"🧹 Eliminando contenido de la carpeta {qr_dir}...")
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
    

def crear_qr():
    total = 0
    elimina_qr()
    print("⚙️  Generando nuevos códigos QR...")
    for a in Activos.objects.all():
        a.generar_qr()
        a.save()
        total += 1

    print(f"✅ Se generaron {total} códigos QR correctamente.")


if __name__ == "__main__":
    crear_qr()
