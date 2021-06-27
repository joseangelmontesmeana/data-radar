import re
from decimal import Decimal

from radar.exceptions import (
    InvalidLatitude,
    InvalidLocation,
    InvalidLongitude,
    InvalidPhone,
)


def validate_phone(phone):
    phone = phone.replace("+34", "")
    phone = phone.replace(" ", "")
    p = re.compile("98\\d\\d\\d\\d\\d\\d\\d")
    fix_phone = next(iter(p.findall(phone)), "")

    p = re.compile("[6,7]\\d\\d\\d\\d\\d\\d\\d\\d")
    mobile_phone = next(iter(p.findall(phone)), "")

    if fix_phone == "" and mobile_phone == "":
        raise InvalidPhone

    elif fix_phone == "":
        return mobile_phone

    else:
        return fix_phone


def validate_location(location):
    location = location.replace(" ", "")
    p = re.compile("Lon:.*,Lat:.*")
    location = next(iter(p.findall(location)), "")

    if location == "":
        raise InvalidLocation
    else:
        return location


def validate_latitude(latitude):  # Valid and format field latitude
    latitude = Decimal(latitude)
    if -90 <= latitude <= 90:
        return latitude
    raise InvalidLatitude


def validate_longitude(longitude):  # Valid and format field  longitude
    longitude = Decimal(longitude)
    if -180 <= longitude <= 180:
        return longitude
    raise InvalidLongitude
