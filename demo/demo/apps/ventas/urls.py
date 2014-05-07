from django.conf.urls import *
urlpatterns = patterns('demo.apps.ventas.views',
	url(r'^agregar/productos/$','agregarProductos',name="vista_agregar_productos"),
	url(r'^edit/producto/(?P<id_prod>.*)/$','edit_producto_view',name="vista_editar_producto"),
)