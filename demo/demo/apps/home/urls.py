from django.conf.urls import *

urlpatterns = patterns('demo.apps.home.views',
    url(r'^$','index_view', name='vista_pricipal'),
    url(r'^about/$','about_view', name='vista_about'),
    url(r'^clientes/$','clientes_view',name='vista_clientes'),
    url(r'^productos/page/(?P<pagina>.*)$','productos_view',name='vista_productos'),
    url(r'^producto/(?P<idProducto>.*)/$','singleProductos',name='vista_single_producto'),
    #url(r'^producto/(?P<idProducto>.')/$','singleProductos',name='vista_single_producto'),
    url(r'^contacto/$','contactos_view',name='vista_contactos'),
    url(r'^login/$','login_view',name='vista_login'),
    url(r'^registro/$','registro_view',name='vista_registro'),
    url(r'^logout/$','logout_view',name='vista_logout'),
)