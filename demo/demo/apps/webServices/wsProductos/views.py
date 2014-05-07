# Create your views here.
from django.http import HttpResponse
from demo.apps.ventas.models import producto
# INTEGRAMOS LA SERIALIZACION DE LOS OBJETOS
from django.core import serializers

def wsProductos_view(request):
	data = serializers.serialize("json",producto.objects.filter(status=True)) #PRIMER PARAMETRO FORMATO, SEGUNDO PARAMETRO CONSULTA BASE DE DATOS
	# RETORNA LA INFORMACION EN FORMATO JSON
	return HttpResponse(data,mimetype='application/json')
