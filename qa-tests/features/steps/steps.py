from behave import step
import json
import requests

query_func = {
    "high_school": {"specific": "getHighSchool", "all": "getAllHighSchools", "nearby": "getNearbyHighSchools",
                    "several": "getListHighSchools"},
    "high_schools": {"specific": "getHighSchool", "all": "getAllHighSchools", "nearby": "getNearbyHighSchools",
                     "several": "getListHighSchools"},
    "library": {"specific": "getLibrary", "all": "getAllLibraries", "nearby": "getNearbyLibraries",
                "several": "getListLibraries"},
    "libraries": {"specific": "getLibrary", "all": "getAllLibraries", "nearby": "getNearbyLibraries",
                  "several": "getListLibraries"},
    "monument": {"specific": "getMonument", "all": "getAllMonuments", "nearby": "getNearbyMonuments",
                 "several": "getListMonuments"},
    "monuments": {"specific": "getMonument", "all": "getAllMonuments", "nearby": "getNearbyMonuments",
                  "several": "getListMonuments"},
    "museum": {"specific": "getMuseum", "all": "getAllMuseums", "nearby": "getNearbyMuseums",
               "several": "getListMuseums"},
    "museums": {"specific": "getMuseum", "all": "getAllMuseums", "nearby": "getNearbyMuseums",
                "several": "getListMuseums"},
    "nursery_school": {"specific": "getNurserySchool", "all": "getAllNurserySchools",
                       "nearby": "getNearbyNurserySchools", "several": "getListNurserySchools"},
    "nursery_schools": {"specific": "getNurserySchool", "all": "getAllNurserySchools",
                        "nearby": "getNearbyNurserySchools", "several": "getListNurserySchools"},
    "school": {"specific": "getSchool", "all": "getAllSchools", "nearby": "getNearbySchools",
               "several": "getListSchools"},
    "schools": {"specific": "getSchool", "all": "getAllSchools", "nearby": "getNearbySchools",
                "several": "getListSchools"},
    "security_forces": {"specific": "getSecurityForces", "all": "getAllSecurityForces",
                        "nearby": "getNearbySecurityForces", "several": "getListSecurityForces"}
}


def build_query_with_name(infrastructure, name, fields):
    fields = "\n".join(fields.split(" "))

    return f"""{query_func.get(infrastructure)["specific"]}(name: \"{name}\") {{
        {fields}
      }} """


def build_query_all(infrastructure, fields):
    fields = "\n".join(fields.split(" "))

    return f"""{query_func.get(infrastructure)["all"]} {{
        {fields}
      }} """


def build_query_nearby(infrastructure, radio, latitude, longitude, fields):
    fields = "\n".join(fields.split(" "))

    return f"""{query_func.get(infrastructure)["nearby"]}(latitude: {latitude}, longitude: {longitude}, radio: {radio}) {{
        {fields}
      }} """


def build_query_with_names(infrastructure, names, fields):
    names = "".join(["\"" + n + "\"" for n in names.split("---")])
    fields = "\n".join(fields.split(" "))

    return f"""{query_func.get(infrastructure)["several"]}(names: [{names}]) {{
        {fields}
      }} """


def run_graphql_query(context, query, f, infrastructure=None):
    r = requests.post(context.API_URL, json={'query': query})

    assert r.status_code == 200, "Status code not 200"
    if f == "combined":
        context.response["content"] = json.loads(r.text)
    else:
        context.response["data"] = json.loads(r.text)["data"][query_func.get(infrastructure)[f]]

    if json.loads(r.text).get("errors", False):
        context.response["errors"] = json.loads(r.text)["errors"]


@step(u'I load file "{dump_name}" dump in database')
def load_dump(context, dump_name):
    pass


@step(u'I get the "{infrastructure}" with name "{name}"')
@step(u'I get the field "{fields}" from a "{infrastructure}" with name "{name}"')
@step(u'I get the fields "{fields}" from a "{infrastructure}" with name "{name}"')
def get_infrastructure_with_name(context, infrastructure, name, fields="name latitude longitude phone id"):
    query_body = build_query_with_name(infrastructure, name, fields)
    query = f"""
    {{
      {query_body}
    }} """
    run_graphql_query(context, query, "specific", infrastructure)


@step(u'I get all "{infrastructure}"')
@step(u'I get the field "{fields}" from all "{infrastructure}"')
@step(u'I get the fields "{fields}" from all "{infrastructure}"')
def get_all_infrastructures(context, infrastructure, fields="name latitude longitude phone id"):
    query_body = build_query_all(infrastructure, fields)
    query = f"""
    {{
      {query_body}
    }} """
    run_graphql_query(context, query, "all", infrastructure)


@step(u'I get "{infrastructure}" in radio "{radio}" of (latitude: "{latitude}", longitude: "{longitude}")')
@step(u'I get the field "{fields}" from nearby "{infrastructure}" in radio "{radio}" of (latitude: "{latitude}", '
      u'longitude: "{longitude}")')
@step(u'I get the fields "{fields}" from nearby "{infrastructure}" in radio "{radio}" of (latitude: "{latitude}", '
      u'longitude: "{longitude}")')
def get_infrastructures_in_radio(context, infrastructure, radio, latitude, longitude,
                                 fields="name latitude longitude phone id"):
    query_body = build_query_nearby(infrastructure, radio, latitude, longitude, fields)
    query = f"""
    {{
      {query_body}
    }} """
    run_graphql_query(context, query, "nearby", infrastructure)


@step(u'I get the "{infrastructure}" with names "{names}"')
@step(u'I get the field "{fields}" from "{infrastructure}" with names "{names}"')
@step(u'I get the fields "{fields}" from "{infrastructure}" with names "{names}"')
def get_infrastructures_with_names(context, infrastructure, names, fields="name latitude longitude phone id"):
    query_body = build_query_with_names(infrastructure, names, fields)
    query = f"""
    {{
      {query_body}
    }} """
    run_graphql_query(context, query, "several", infrastructure)


@step(u'I get combined query all "{infrastructure_1}" and all "{infrastructure_2}"')
def get_combined_all_with_all(context, infrastructure_1, infrastructure_2, fields_1="name latitude longitude phone id",
                              fields_2="name latitude longitude phone id"):
    query_body_1 = build_query_all(infrastructure_1, fields_1)
    query_body_2 = build_query_all(infrastructure_2, fields_2)
    query = f"""
    {{
      {query_body_1}
      {query_body_2}
    }} """
    run_graphql_query(context, query, "combined")


@step(u'I get combined query {infrastructure_1}: "{name_1}" with and specific {infrastructure_2}: "{name_2}"')
def get_combined_specific_with_specific(context, infrastructure_1, name_1, infrastructure_2, name_2,
                                        fields_1="name latitude longitude phone id",
                                        fields_2="name latitude longitude phone id"):
    query_body_1 = build_query_with_name(infrastructure_1, name_1, fields_1)
    query_body_2 = build_query_with_name(infrastructure_2, name_2, fields_2)
    query = f"""
    {{
      {query_body_1}
      {query_body_2}
    }} """
    run_graphql_query(context, query, "combined")


@step(
    u'I get combined query {infrastructure_1} in radio "{radio_1}" and {infrastructure_2} in radio "{radio_2}" '
    u'of (latitude: "{latitude}", longitude: "{longitude}")')
def get_combined_nearby_with_nearby(context, infrastructure_1, radio_1, infrastructure_2, radio_2, latitude, longitude,
                                    fields_1="name latitude longitude phone id",
                                    fields_2="name latitude longitude phone id"):
    query_body_1 = build_query_nearby(infrastructure_1, radio_1, latitude, longitude, fields_1)
    query_body_2 = build_query_nearby(infrastructure_2, radio_2, latitude, longitude, fields_2)
    query = f"""
    {{
      {query_body_1}
      {query_body_2}
    }} """
    run_graphql_query(context, query, "combined")


@step(u'I get combined query {infrastructure_1} with names "{names_1}" and {infrastructure_2} with names "{names_2}"')
def get_combined_several_with_several(context, infrastructure_1, names_1, infrastructure_2, names_2,
                                      fields_1="name latitude longitude phone id",
                                      fields_2="name latitude longitude phone id"):
    query_body_1 = build_query_with_names(infrastructure_1, names_1, fields_1)
    query_body_2 = build_query_with_names(infrastructure_2, names_2, fields_2)
    query = f"""
    {{
      {query_body_1}
      {query_body_2}
    }} """
    run_graphql_query(context, query, "combined")


@step(u'I check that the data response is "{info}"')
def check_data_response(context, info):
    assert context.response["data"] == json.loads(info), f"{context.response['data']} not equal to {json.loads(info)}"


@step(u'I verify that the data response is the content of the file "{file}"')
def compare_data_response_and_file(context, file):
    cmp_file = context.RESPONSE_DIR + file
    with open(cmp_file) as json_file:
        data = json.load(json_file)

    assert context.response["data"] == data, f"{context.response['data']} not equal to {data}"


@step(u'I verify that the response content is the content of the file "{file}"')
def compare_content_response_and_file(context, file):
    cmp_file = context.RESPONSE_DIR + file
    with open(cmp_file) as json_file:
        data = json.load(json_file)

    assert context.response["content"] == data, f"{context.response['content']} not equal to {data}"


@step(u'I check that the response body contains error with message "{message}"')
def check_errors_response(context, message):
    errors = context.response.get("errors", False)

    assert errors is not False, f"The response body does not contain errors"
    assert any([message in err.get("message") for err in errors]), f"message: '{message}' does not contain in errors"
