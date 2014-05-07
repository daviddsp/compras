from demo.apps.home.models import userProfile
import django

def user_imagen(request):
	try:
		imagen = None
		user   = request.user
		up     = userProfile.objects.get(user=user)
		imagen = "/media/%s"%up.foto
	except:
		imagen = "/media/images/user.jpg"
	return imagen

def my_processor(request):
	context = {"django_version":django.get_version(),
			   "get_image_profile":user_imagen(request),
	}
	return context
