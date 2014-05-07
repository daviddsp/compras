# Create your views here.
from django.http import HttpResponse
from demo.apps.ventas.models import cliente
# INTEGRAMOS LA SEIALIZACION DE LOS OBJETOS
from django.core import serializers

def wsClientes_view(request):
	data = serializers.serialize("json",cliente.objects.filter(status=True)) #PRIMER PARAMETRO FORMATO, SEGUNDO PARAMETRO COSULTA BASE DE DATOS
	# RETORNA LA INFORMACION EN FORMATO JSON
	return HttpResponse(data,mimetype='application/json')
