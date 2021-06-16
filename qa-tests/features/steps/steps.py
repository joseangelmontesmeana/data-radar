from behave import step
import json


@step(u'Pruebame')
def prueba(context):
    print("hola")
    assert True


@step(u'I load file "{dump_name}" dump in database')
def load_dump(context, dump_name):
    pass


@step(u'I get the "{element}" with name "{name}"')
def get_element_with_name(context, element, name):
    context.response = {"kk1": "kk1"}


@step(u'I check that the response body is')
def check_response_body(context):
    print(context.response)
    print(json.loads(context.text))
    assert context.response == json.loads(context.text)





