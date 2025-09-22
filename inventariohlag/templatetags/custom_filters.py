from django import template

register = template.Library()

@register.filter
def format_float(value):
    if value is None or str(value).strip() == '':
        return ''
    try:
        # Asegurar que sea float con 2 decimales
        formatted = f"{float(value):,.2f}"
        # Cambiar ',' (de miles) a punto, y '.' (decimal) a coma
        formatted = formatted.replace(",", "X").replace(".", ",").replace("X", ".")
        return formatted
    except (ValueError, TypeError):
        return value
    
@register.filter
def format_integer(value):
    if value is None or str(value).strip() == '':
        return ''
    try:
        # Asegura que sea un entero y formatea con separador de miles
        formatted = f"{int(value):,}"
        # Reemplaza ',' con '.' para estilo europeo
        return formatted.replace(",", ".")
    except (ValueError, TypeError):
        return value

@register.filter
def format_pesos(value):
    if value is None or str(value).strip() == '':
        return ''
    try:
        formatted = f"{int(value):,}".replace(",", ".")
        return f"$ {formatted}"
    except (ValueError, TypeError):
        return value    
    