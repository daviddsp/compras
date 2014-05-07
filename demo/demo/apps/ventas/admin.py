# -*- coding: utf-8 -*-
from django.contrib import admin
from demo.apps.ventas.models import cliente,producto,categoriaProductos

class productoAdmin(admin.ModelAdmin):
	list_display  = ('nombre','thumbnail','precio','stock','imagen') # MUESTRA NOMBRE PRECIO Y STOCK
	list_filter   = ('nombre','precio','stock') # FILTRA POR NOMBRE Y PRECIO
	search_fields = ['nombre','precio','stock']
	fields        = ('nombre','descripcion',('precio','stock','imagen'),'categorias','status') # CAMPOS A MOSTRAR EN LA VISTA DE AGREGAR

admin.site.register(cliente)
admin.site.register(producto,productoAdmin)
admin.site.register(categoriaProductos)

