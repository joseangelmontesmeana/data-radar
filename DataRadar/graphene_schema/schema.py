import graphene
from .types import Query as SchemeQuery


class Query(SchemeQuery, graphene.ObjectType):
    pass


schema = graphene.Schema(query=Query)
