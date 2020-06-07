import geopy.distance
import graphene
from graphene_django.types import DjangoObjectType

from radar.models import Pharmacy


class PharmacyType(DjangoObjectType):
    class Meta:
        model = Pharmacy


class Query(object):
    pharmacy = graphene.Field(PharmacyType, id=graphene.Int(), name=graphene.String())

    nearby_pharmacies = graphene.List(
        PharmacyType,
        latitude=graphene.Float(required=True),
        longitude=graphene.Float(required=True),
        radio=graphene.Int(required=True),
    )
    list_pharmacies = graphene.List(
        PharmacyType, list_name=graphene.List(graphene.String)
    )
    all_pharmacies = graphene.List(PharmacyType)

    def resolve_pharmacy(self, info, **kwargs):
        id = kwargs.get("id")
        name = kwargs.get("name")
        if id is not None:
            return Pharmacy.objects.get(pk=id)
        if name is not None:
            return Pharmacy.objects.get(name=name)
        return None

    def resolve_nearby_pharmacies(self, info, **kwargs):
        latitude = kwargs.get("latitude")
        longitude = kwargs.get("longitude")
        radio = kwargs.get("radio")

        # Validate coordinates  "coords1" and "coords2"

        coords1 = (latitude, longitude)
        list_pharmacies = []
        pharmacies = Pharmacy.objects.all()

        for pharmacy in pharmacies:
            coords2 = (pharmacy.latitude, pharmacy.longitude)
            try:
                if abs(geopy.distance.geodesic(coords1, coords2).m) <= radio:
                    list_pharmacies.append(pharmacy)
            except ValueError:
                pass

        return list_pharmacies

    def resolve_list_pharmacies(self, info, **kwargs):
        list_name = kwargs.get("list_name")
        if list_name is not None:
            pharmacies = []
            for name in list_name:
                pharmacy = Pharmacy.objects.get(name=name)
                if pharmacy is not None:
                    pharmacies.append(pharmacy)
            return pharmacies
        return None

    def resolve_all_pharmacies(self, info, **kwargs):
        return Pharmacy.objects.all()
