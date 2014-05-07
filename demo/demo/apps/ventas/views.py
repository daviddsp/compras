from django.shortcuts import render_to_response
from django.template import RequestContext
from demo.apps.ventas.forms import agregarProductosForm
from demo.apps.ventas.models import producto
from django.http import HttpResponseRedirect

def agregarProductos(request):
	info = "Ingrese sus productos"
	if request.method == "POST":
		formulario = agregarProductosForm(request.POST,request.FILES)
		if formulario.is_valid():
			add = formulario.save(commit=False) # NO GUARDA EL FORMULARIO HASTA QUE NO REGISTRE EL STATUS TRUE
			add.status = True 
			add.save() # GUARDAMOS LA INFORMACION
			formulario.save_m2m() # GUARDA LA RELACIONES DE MANYTOMANY
			info = "Guardado sastisfactoriamente"
			return HttpResponseRedirect('/producto/%s'%add.id)
	else:
		formulario = agregarProductosForm()
	ctx  = {'form':formulario,'informacion':info}
	return render_to_response('ventas/agregarProductos.html',ctx,context_instance=RequestContext(request))

def edit_producto_view(request,id_prod):
	info = "Actualice sus datos"
	p = producto.objects.get(id=id_prod)
	if request.method == "POST":
		formulario = agregarProductosForm(request.POST,request.FILES,instance=p)
		if formulario.is_valid():
			editarProducto = formulario.save(commit=False)
			formulario.save_m2m()
			editarProducto.status = True
			editarProducto.save() # GUARDAMOS EL OBJETOS
			info = "Se han actualizado sus registros"
			return HttpResponseRedirect('/producto/%s'%editarProducto.id)
	else:
		formulario = agregarProductosForm(instance=p)
	ctx = {'form':formulario,'informacion':info}
	return render_to_response('ventas/editarProducto.html',ctx,context_instance=RequestContext(request))

"""
def agregarProductos(request):
	info = "Ingrese sus productos"
	if request.user.is_authenticated():
		if request.method == "POST":
			formulario = agregarProductosForm(request.POST,request.FILES)
			if formulario.is_valid():
				nombre = formulario.cleaned_data['nombre']
				descripcion = formulario.cleaned_data['descripcion']
				imagen = formulario.cleaned_data['imagen']#ESTO SE OBTIENE CON request.FILES
				precio = formulario.cleaned_data['precio']
				stock = formulario.cleaned_data['stock']
				p = producto()
				if imagen: #VALIDACION QUE VERIFICA SI EXITE UNA IMAGEN
					p.imagen = imagen
				p.nombre       = nombre
				p.descripcion  = descripcion
				p.precio       = precio
				p.stock        = stock
				p.status       = True
				p.save() #GUARDAR LA INFORMACION
				info           = "Se guardo sastisfactoriamente..!"
			else:
				info = "Informacion con datos incorrectos.!"
		formulario = agregarProductosForm()
		ctx  = {'form':formulario,'informacion':info}
		return render_to_response('ventas/agregarProductos.html',ctx,context_instance=RequestContext(request))
	else:
		return HttpResponseRedirect('/')


def edit_producto_view(request,id_prod):
	p = producto.objects.get(id=id_prod)
	if request.method == "POST": # EVALUA SI RECIBE ALGO POR POST
		form = agregarProductosForm(request.POST,request.FILES) # AGREGP MI VARIABLE FORMULARIO CON EL CONTENIDO DE agregarProductosForm
		if form.is_valid(): # SI ES VALIDO CAPTURO LOS DATOS
			nombre = form.cleaned_data['nombre']
			descripcion = form.cleaned_data['descripcion']
			imagen = form.cleaned_data['imagen']
			precio = form.cleaned_data['precio']
			stock = form.cleaned_data['stock']
			p.nombre = nombre
			p.descripcion = descripcion
			p.precio = precio
			p.stock = stock
			if imagen: # VERIFICAMOS QUE LA IMAGEN SEA CORRECTA
				p.imagen = imagen
			p.save() # GUARDAMOS EL OBJETO
			return HttpResponseRedirect('/producto/%s'%p.id)


	if request.method == "GET":
		form = agregarProductosForm(initial={
			'nombre':p.nombre,
			'descripcion':p.descripcion,
			'precio':p.precio,
			'stock':p.stock,
			})
	ctx = {'form':form,'producto':p}
	return render_to_response('ventas/editarProducto.html',ctx,context_instance=RequestContext(request))
"""
	# else: #GET
	# 		formulario = agregarProductosForm()
	# 		ctx = {'form':formulario}
	# 		return render_to_response('ventas/agregarProductos.html',ctx,context_instance=RequestContext(request))
		

