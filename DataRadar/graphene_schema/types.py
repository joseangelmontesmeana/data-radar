import graphene
from graphene_django.types import DjangoObjectType
from radar.models import Pharmacy


class PharmacyType(DjangoObjectType):
    class Meta:
        model = Pharmacy


class Query(object):
    pharmacy = graphene.Field(PharmacyType, id=graphene.Int(), name=graphene.String())
    all_pharmacies = graphene.List(PharmacyType)

    def resolve_all_pharmacies(self, info, **kwargs):
        return Pharmacy.objects.all()

    def resolve_pharmacy(self, info, **kwargs):
        id = kwargs.get('id')
        name = kwargs.get('name')
        if id is not None:
            return Pharmacy.objects.get(pk=id)
        if name is not None:
            return Pharmacy.objects.get(name=name)
        return None
