from django.conf.urls import *
urlpatterns = patterns('demo.apps.webServices.wsClientes.views',
	url(r'^ws/clientes/$','wsClientes_view',name="ws_clientes_url"),
)
