import graphene
from graphene_django.types import DjangoObjectType

from graphene_schema.queries_logic import (
    get_all_items,
    get_item,
    get_list_items,
    get_nearby_items,
)
from radar.models import (
    HighSchool,
    Library,
    Monument,
    Museum,
    NurserySchool,
    School,
    SecurityForce,
)


class HighSchoolType(DjangoObjectType):
    class Meta:
        model = HighSchool


class LibraryType(DjangoObjectType):
    class Meta:
        model = Library


class MonumentType(DjangoObjectType):
    class Meta:
        model = Monument


class MuseumType(DjangoObjectType):
    class Meta:
        model = Museum


class NurserySchoolType(DjangoObjectType):
    class Meta:
        model = NurserySchool


class SchoolType(DjangoObjectType):
    class Meta:
        model = School


class SecurityForceType(DjangoObjectType):
    class Meta:
        model = SecurityForce


class Query(object):
    # HighSchool inquiries
    get_high_school = graphene.Field(
        HighSchoolType, id=graphene.Int(), name=graphene.String()
    )
    get_all_high_schools = graphene.List(HighSchoolType)
    get_list_high_schools = graphene.List(
        HighSchoolType, names=graphene.List(graphene.String)
    )
    get_nearby_high_schools = graphene.List(
        HighSchoolType,
        latitude=graphene.Float(required=True),
        longitude=graphene.Float(required=True),
        radio=graphene.Int(required=True),
    )

    def resolve_get_high_school(self, info, **kwargs):
        return get_item(HighSchool, info, **kwargs)

    def resolve_get_all_high_schools(self, info, **kwargs):
        return get_all_items(HighSchool, info, **kwargs)

    def resolve_get_list_high_schools(self, info, **kwargs):
        return get_list_items(HighSchool, info, **kwargs)

    def resolve_get_nearby_high_schools(self, info, **kwargs):
        return get_nearby_items(HighSchool, info, **kwargs)

    # Library inquiries
    get_library = graphene.Field(LibraryType, id=graphene.Int(), name=graphene.String())
    get_all_libraries = graphene.List(LibraryType)
    get_list_libraries = graphene.List(
        LibraryType, names=graphene.List(graphene.String)
    )
    get_nearby_libraries = graphene.List(
        LibraryType,
        latitude=graphene.Float(required=True),
        longitude=graphene.Float(required=True),
        radio=graphene.Int(required=True),
    )

    def resolve_get_library(self, info, **kwargs):
        return get_item(Library, info, **kwargs)

    def resolve_get_all_libraries(self, info, **kwargs):
        return get_all_items(Library, info, **kwargs)

    def resolve_get_list_libraries(self, info, **kwargs):
        return get_list_items(Library, info, **kwargs)

    def resolve_get_nearby_libraries(self, info, **kwargs):
        return get_nearby_items(Library, info, **kwargs)

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
        return get_all_items(Monument, info, **kwargs)

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
        return get_all_items(Museum, info, **kwargs)

    def resolve_get_list_museums(self, info, **kwargs):
        return get_list_items(Museum, info, **kwargs)

    def resolve_get_nearby_museums(self, info, **kwargs):
        return get_nearby_items(Museum, info, **kwargs)

    # Nursery schools inquiries
    get_nursery_school = graphene.Field(
        NurserySchoolType, id=graphene.Int(), name=graphene.String()
    )
    get_all_nursery_schools = graphene.List(NurserySchoolType)
    get_list_nursery_schools = graphene.List(
        NurserySchoolType, names=graphene.List(graphene.String)
    )
    get_nearby_nursery_schools = graphene.List(
        NurserySchoolType,
        latitude=graphene.Float(required=True),
        longitude=graphene.Float(required=True),
        radio=graphene.Int(required=True),
    )

    def resolve_get_nursery_school(self, info, **kwargs):
        return get_item(NurserySchool, info, **kwargs)

    def resolve_get_all_nursery_schools(self, info, **kwargs):
        return get_all_items(NurserySchool, info, **kwargs)

    def resolve_get_list_nursery_schools(self, info, **kwargs):
        return get_list_items(NurserySchool, info, **kwargs)

    def resolve_get_nearby_nursery_schools(self, info, **kwargs):
        return get_nearby_items(NurserySchool, info, **kwargs)

    # Schools inquiries
    get_school = graphene.Field(SchoolType, id=graphene.Int(), name=graphene.String())
    get_all_schools = graphene.List(SchoolType)
    get_list_schools = graphene.List(SchoolType, names=graphene.List(graphene.String))
    get_nearby_schools = graphene.List(
        SchoolType,
        latitude=graphene.Float(required=True),
        longitude=graphene.Float(required=True),
        radio=graphene.Int(required=True),
    )

    def resolve_get_school(self, info, **kwargs):
        return get_item(School, info, **kwargs)

    def resolve_get_all_schools(self, info, **kwargs):
        return get_all_items(School, info, **kwargs)

    def resolve_get_list_schools(self, info, **kwargs):
        return get_list_items(School, info, **kwargs)

    def resolve_get_nearby_schools(self, info, **kwargs):
        return get_nearby_items(School, info, **kwargs)

    # Security forces inquiries
    get_security_forces = graphene.Field(
        SecurityForceType, id=graphene.Int(), name=graphene.String()
    )
    get_all_security_forces = graphene.List(SecurityForceType)
    get_list_security_forces = graphene.List(
        SecurityForceType, names=graphene.List(graphene.String)
    )
    get_nearby_security_forces = graphene.List(
        SecurityForceType,
        latitude=graphene.Float(required=True),
        longitude=graphene.Float(required=True),
        radio=graphene.Int(required=True),
    )

    def resolve_get_security_forces(self, info, **kwargs):
        return get_item(SecurityForce, info, **kwargs)

    def resolve_get_all_security_forces(self, info, **kwargs):
        return get_all_items(SecurityForce, info, **kwargs)

    def resolve_get_list_security_forces(self, info, **kwargs):
        return get_list_items(SecurityForce, info, **kwargs)

    def resolve_get_nearby_security_forces(self, info, **kwargs):
        return get_nearby_items(SecurityForce, info, **kwargs)
