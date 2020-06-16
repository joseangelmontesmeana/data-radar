import geopy.distance
import graphene
from graphene_django.types import DjangoObjectType

from radar.models import Monument


class MonumentType(DjangoObjectType):
    class Meta:
        model = Monument


class Query(object):
    monument = graphene.Field(MonumentType, id=graphene.Int(), name=graphene.String())

    nearby_monuments = graphene.List(
        MonumentType,
        latitude=graphene.Float(required=True),
        longitude=graphene.Float(required=True),
        radio=graphene.Int(required=True),
    )
    list_monuments = graphene.List(
        MonumentType, list_name=graphene.List(graphene.String)
    )
    all_monuments = graphene.List(MonumentType)

    def resolve_monumenty(self, info, **kwargs):
        id = kwargs.get("id")
        name = kwargs.get("name")
        if id is not None:
            return Monument.objects.get(pk=id)
        if name is not None:
            return Monument.objects.get(name=name)
        return None

    def resolve_nearby_monuments(self, info, **kwargs):
        latitude = kwargs.get("latitude")
        longitude = kwargs.get("longitude")
        radio = kwargs.get("radio")

        # Validate coordinates  "coords1" and "coords2"

        coords1 = (latitude, longitude)
        list_monuments = []
        monuments = Monument.objects.all()

        for monument in monuments:
            coords2 = (monument.latitude, monument.longitude)
            try:
                if abs(geopy.distance.geodesic(coords1, coords2).m) <= radio:
                    list_monuments.append(monument)
            except ValueError:
                pass

        return list_monuments

    def resolve_list_monuments(self, info, **kwargs):
        list_name = kwargs.get("list_name")
        if list_name is not None:
            monuments = []
            for name in list_name:
                monument = Monument.objects.get(name=name)
                if monument is not None:
                    monuments.append(monument)
            return monuments
        return None

    def resolve_all_monuments(self, info, **kwargs):
        return Monument.objects.all()
