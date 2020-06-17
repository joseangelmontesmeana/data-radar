import json
import logging
import ssl
import urllib

from django.core.management.base import BaseCommand

from radar.exceptions import (
    InvalidLatitude,
    InvalidLocation,
    InvalidLongitude,
    InvalidPhone,
)
from radar.models import Monument, Museum
from radar.validators import (
    validate_latitude,
    validate_location,
    validate_longitude,
    validate_phone,
)

logger = logging.getLogger(__name__)


class Command(BaseCommand):
    help = "Comando load_data, permite cargar los datos desde las urls configuradas."
    tables = {"Monuments": Monument, "Museums": Museum}

    def clean_data(self):
        for desc, table in self.tables.items():
            logger.info(f"Borrando elementos de {desc}")
            table.objects.all().delete()

    def handle(self, *args, **options):
        default_phone = ""
        default_latitude = 0
        default_longitude = 0

        try:
            with open("setup/data_urls.json") as json_file:
                urls = json.load(json_file)
        except OSError:
            logger.error("No existe el fichero setup/data_urls.json")
            exit(1)
        except ValueError:
            logger.error("setup/data_urls.json no es un fichero json válido")
            exit(1)

        self.clean_data()

        for item_type, url in urls.items():
            try:
                req = urllib.request.Request(url)

                # parsing response
                r = urllib.request.urlopen(
                    req, context=ssl._create_unverified_context()
                ).read()
                data = json.loads(r.decode("utf-8"))

            except urllib.error.URLError:
                logger.warning(f"Esta URL {url} no existe")
                data = {}

            except ValueError:
                logger.warning(f"{url} no tiene un formato JSON correcto")
                data = {}

            for item in data:
                name = item.get("titulo")
                try:
                    phone = validate_phone(item.get("telefono"))

                except InvalidPhone:
                    phone = default_phone
                    logger.warning("Teléfono no disponible")

                try:
                    location = validate_location(item.get("localizacion"))
                    latitude = validate_latitude(
                        location.split(",")[1].split("Lat:")[1]
                    )
                    longitude = validate_longitude(
                        location.split(",")[0].split("Lon:")[1]
                    )

                except InvalidLocation:
                    latitude = default_latitude
                    longitude = default_longitude
                    logger.warning("Localización no disponible")

                except InvalidLatitude:
                    latitude = default_latitude
                    longitude = default_longitude
                    logger.warning("Latitud no disponible")

                except InvalidLocation:
                    latitude = default_latitude
                    longitude = default_longitude
                    logger.warning("Longitud no disponible")

                # INSERT VALUE IN DATABASE INFRASTRUCTURE TABLE
                logger.debug(
                    f"Añadir en {item_type}: nombre={name}, teléfono={phone}, latitud={latitude}, "
                    f"longitud={longitude}"
                )

                try:
                    it = self.tables.get(item_type)(
                        name=name, phone=phone, latitude=latitude, longitude=longitude
                    )
                    it.save()
                    pass
                except TypeError:
                    logger.warning(f"{item_type} no es una tabla válida")
