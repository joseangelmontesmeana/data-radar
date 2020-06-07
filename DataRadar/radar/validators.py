import re
from decimal import Decimal

from radar.exceptions import InvalidLatitude, InvalidLongitude, InvalidPhone


def validate_phone(phone):  # Valid and format field telephone
    p = re.compile("98\\d \\d\\d\\d \\d\\d\\d")
    fix_phone = next(iter(p.findall(phone)), "").replace(" ", "")

    p = re.compile("6\\d\\d \\d\\d \\d\\d \\d\\d")
    mobile_phone = next(iter(p.findall(phone)), "").replace(" ", "")

    if fix_phone == "" and mobile_phone == "":
        raise InvalidPhone

    elif fix_phone == "":
        return mobile_phone

    else:
        return fix_phone


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
