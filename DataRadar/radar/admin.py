from django.contrib import admin

from .models import (
    HighSchool,
    Library,
    Monument,
    Museum,
    NurserySchool,
    School,
    SecurityForce,
)

admin.site.register(HighSchool)
admin.site.register(Library)
admin.site.register(Monument)
admin.site.register(Museum)
admin.site.register(NurserySchool)
admin.site.register(School)
admin.site.register(SecurityForce)
