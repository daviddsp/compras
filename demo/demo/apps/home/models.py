from django.db import models

from django.contrib.auth.models import User

class userProfile(models.Model):

	def url(self,nombre):
		ruta = "MultimediaData/Users/%s/%s"%(self.user.username,nombre)
		return ruta

	user        = models.OneToOneField(User)#LLAVE UNICA
	foto        = models.ImageField(upload_to=url)
	telefono    = models.CharField(max_length=30)
	direccion   = models.CharField(max_length=200)
	sexo        = models.CharField(max_length=1)
	sitioWeb    = models.URLField(max_length=100)
	info        = models.TextField(max_length=300)

	def __unicode__(self):
		return self.user.username
