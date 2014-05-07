# -*- coding: utf-8 -*-
from django.shortcuts import render_to_response
from django.template import RequestContext
from demo.apps.ventas.models import producto,cliente
from demo.apps.home.forms import contactoForm,LoginForm,RegistrarForm
from django.core.mail import EmailMultiAlternatives #ENVIAMOS HTML
from django.contrib.auth.models import User # MODELO DE USUARIO PARA CREAR LOS MISMOS
import django
from django.contrib.auth import login,logout,authenticate
from django.http import HttpResponseRedirect
from django.http import HttpResponse
import os
#PAGINACION DJANGO
from django.core.paginator import Paginator,EmptyPage,InvalidPage
from django.contrib.auth.decorators import login_required
from demo.settings import URL_LOGIN
import simplejson

def index_view(request):
    return render_to_response('index.html', context_instance=RequestContext(request))

@login_required(login_url=URL_LOGIN)
def about_view(request):
    version = django.get_version()
    mensaje = "Esto es un mensaje desde mi vista"
    ctx = {'msj':mensaje,'version':version}
    return render_to_response('about.html',ctx,context_instance=RequestContext(request))

def productos_view(request,pagina):
    if request.method=="POST":
        if "product_id" in request.POST:
            try:
                id_producto = request.POST['product_id']
                p = producto.objects.get(pk=id_producto)
                mensaje = {"status":"True","product_id":p.id}
                p.delete() # Eliminamos objeto de la base de datos
                return HttpResponse(simplejson.dumps(mensaje),mimetype='application/json')
            except:
                mensaje = {"status":"False"}
                return HttpResponse(simplejson.dumps(mensaje),mimetype='application/json')
    listaProductos = producto.objects.filter(status=True) #=>SELECT * FROM VENTAS_PRODUCTOS WHERE STATUS = TRUE
    paginator = Paginator(listaProductos,5) #EL 3 SON CUANTOS PRODUCTOS SE VAN A MOSTRAR POR PAGINA
    try:
        page = int(pagina)
    except:
        page = 1
    try:
        productos = paginator.page(page)
    except(EmptyPage,InvalidPage):
        productos = paginator.page(paginator.num_pages)

    ctx = {'productos':productos}
    return render_to_response('productos.html',ctx,context_instance=RequestContext(request))

def singleProductos(request,idProducto):
    productos = producto.objects.get(id=idProducto)
    cats      = productos.categorias.all() # OPTENEMOS LAS CATEGORIAS
    ctx       = {'producto':productos,'categorias':cats}
    return render_to_response('productoSingle.html',ctx,context_instance=RequestContext(request))

def clientes_view(request):
    clientes = cliente.objects.filter(status=True) #=>SELECT * FROM VENTAS_PRODUCTOS WHERE STATUS = TRUE
    ctx = {'clientes':clientes}
    return render_to_response('clientes.html',ctx,context_instance=RequestContext(request))

@login_required(login_url=URL_LOGIN)
def contactos_view(request):
    infoEnviado = False #DEFINE SI SE ENVIA EL FORMULARIO
    email       = ""
    titulo      = ""
    texto       = ""
    envioCorreo = ""

    if request.method == "POST":
        formulario = contactoForm(request.POST)
        if formulario.is_valid():
            infoEnviado = True
            email = formulario.cleaned_data['Email']
            envioCorreo = formulario.cleaned_data['enviar']
            titulo = formulario.cleaned_data['Titulo']
            texto = formulario.cleaned_data['Texto']
            #CONFIGURACION DE ENVIO DE MENSAJES
            paraMsj   = envioCorreo
            contenido = "Informacion recibida de: [%s] <br><br><br>*** Mensaje ***<br><br>%s"%(email,texto)
            msj       = EmailMultiAlternatives('Correo de Contacto',contenido,'from@server.com',[paraMsj])
            msj.attach_alternative(contenido,'text/html') #DEFINIMOS EL CONTENIDO COMO HTML
            msj.attach_file('/home/david/Imágenes/che_anonymous.jpg')#PARA AGREGAR ARCHIVOS
            msj.send() #ENVIAMOS EL CORREO

    else:
        formulario = contactoForm()
    ctx = {'form':formulario,'email':email,'titulo':titulo,'texto':texto,'infoEnviado':infoEnviado}
    return render_to_response('contacto.html',ctx,context_instance=RequestContext(request))


def login_view(request):
    mensaje = ""
    if request.user.is_authenticated():
        return HttpResponseRedirect('/')
    else:
        if request.method == 'POST':
            form = LoginForm(request.POST)
            if form.is_valid():
                next = request.POST['next']
                username = form.cleaned_data['username']
                password = form.cleaned_data['password']
                usuario = authenticate(username=username,password=password)
                if usuario is not None and usuario.is_active:
                    login(request,usuario)
                    return HttpResponseRedirect(next)
                else:
                    mensaje = "usuario y/o password incorrecto"
        next = request.REQUEST.get('next')
        form = LoginForm()
        ctx = {'form':form,'mensaje':mensaje,'next':next}
        return render_to_response('home/login.html',ctx,context_instance=RequestContext(request))

def logout_view(request):
    logout(request)
    return HttpResponseRedirect('/')

def registro_view(request):
    formulario = RegistrarForm()
    if request.method == "POST":
        formulario = RegistrarForm(request.POST)
        if formulario.is_valid():
            usuario = formulario.cleaned_data['username']
            email = formulario.cleaned_data['email']
            password_one = formulario.cleaned_data['password_one']
            password_two = formulario.cleaned_data['password_two']
            u = User.objects.create_user(username=usuario,email=email,password=password_one)
            u.save() # GUARDA EL OBJETO
            return render_to_response("home/gracias_registro.html",context_instance=RequestContext(request))
        else:
            ctx = {'form':formulario}
            return render_to_response('home/registrar.html',ctx,context_instance=RequestContext(request))
    ctx  = {'form':formulario}
    return render_to_response('home/registrar.html',ctx,context_instance=RequestContext(request))