from django.db import models

class cliente(models.Model):
    nombre    = models.CharField(max_length=200)
    apellidos = models.CharField(max_length=200)
    status    = models.BooleanField(default=True)

    def __unicode__(self):
        nombreCompleto = "%s %s"%(self.nombre,self.apellidos)
        return nombreCompleto

class categoriaProductos(models.Model):
    nombre      = models.CharField(max_length=200)
    descripcion = models.TextField(max_length=400)

    def __unicode__(self):
        return self.nombre


class producto(models.Model):

    def url(self,filename):
        ruta = "MultimediaData/Producto/%s/%s"%(self.nombre,str(filename))
        return ruta

    def thumbnail(self):
        return '<a href="/media/%s"><img src="/media/%s" width=50px height=59px/></a>'%(self.imagen,self.imagen)

    thumbnail.allow_tags = True #PARA PERMITIR ESTIQUETAS HTML


    nombre      = models.CharField(max_length=200)
    descripcion = models.TextField(max_length=300)
    status      = models.BooleanField(default=True)
    imagen      = models.ImageField(upload_to=url,null=True,blank=True)
    precio      = models.DecimalField(max_digits=6, decimal_places=2)
    stock       = models.IntegerField()
    categorias  = models.ManyToManyField(categoriaProductos,null=True,blank=True)

    def __unicode__(self):
        return self.nombre




