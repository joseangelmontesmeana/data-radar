def before_all(context):
    context.API_URL = "http://localhost:8000/graphql/"
    context.RESPONSE_DIR = "resources/response_files/"
    context.response = dict()


def before_feature(context, feature):
    pass


def after_scenario(context, scenario):
    pass
