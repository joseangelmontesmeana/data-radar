import graphene
from graphene_django.types import DjangoObjectType

from graphene_schema.queries_logic import (
    get_all_items,
    get_item,
    get_list_items,
    get_nearby_items,
)
from radar.models import Monument, Museum


class MonumentType(DjangoObjectType):
    class Meta:
        model = Monument


class MuseumType(DjangoObjectType):
    class Meta:
        model = Museum


class Query(object):

    # Monument inquiries
    get_monument = graphene.Field(
        MonumentType, id=graphene.Int(), name=graphene.String()
    )
    get_all_monuments = graphene.List(MonumentType)
    get_list_monuments = graphene.List(
        MonumentType, names=graphene.List(graphene.String)
    )
    get_nearby_monuments = graphene.List(
        MonumentType,
        latitude=graphene.Float(required=True),
        longitude=graphene.Float(required=True),
        radio=graphene.Int(required=True),
    )

    def resolve_get_monument(self, info, **kwargs):
        return get_item(Monument, info, **kwargs)

    def resolve_get_all_monuments(self, info, **kwargs):
        return get_all_items(Monument)

    def resolve_get_list_monuments(self, info, **kwargs):
        return get_list_items(Monument, info, **kwargs)

    def resolve_get_nearby_monuments(self, info, **kwargs):
        return get_nearby_items(Monument, info, **kwargs)

    # Museums inquiries
    get_museum = graphene.Field(MuseumType, id=graphene.Int(), name=graphene.String())
    get_all_museums = graphene.List(MuseumType)
    get_list_museums = graphene.List(MuseumType, names=graphene.List(graphene.String))
    get_nearby_museums = graphene.List(
        MuseumType,
        latitude=graphene.Float(required=True),
        longitude=graphene.Float(required=True),
        radio=graphene.Int(required=True),
    )

    def resolve_get_museum(self, info, **kwargs):
        return get_item(Museum, info, **kwargs)

    def resolve_get_all_museums(self, info, **kwargs):
        return get_all_items(Museum)

    def resolve_get_list_museums(self, info, **kwargs):
        return get_list_items(Museum, info, **kwargs)

    def resolve_get_nearby_museums(self, info, **kwargs):
        return get_nearby_items(Museum, info, **kwargs)
