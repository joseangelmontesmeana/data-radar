import json
import logging
import ssl
import urllib

from django.core.management.base import BaseCommand

from radar.exceptions import InvalidLatitude, InvalidLongitude, InvalidPhone
from radar.models import Pharmacy
from radar.validators import validate_latitude, validate_longitude, validate_phone

logger = logging.getLogger(__name__)


class Command(BaseCommand):
    help = "Comando load_data, permite cargar los datos desde las urls configuradas."

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

        for infrastructure, url in urls.items():
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

            i = 0
            for item in data.get("directorios", {}).get("directorio", {}):

                name = item["nombre"]["content"]

                try:
                    phone = validate_phone(item["telefono"]["content"])
                except InvalidPhone:
                    phone = default_phone
                    logger.warning("Error de formato de teléfono")

                except KeyError:
                    phone = default_phone
                    logger.warning("Teléfono no encontrado")

                try:
                    latitude = validate_latitude(
                        item["localizacion"]["content"].split(" ")[0]
                    )
                    longitude = validate_longitude(
                        item["localizacion"]["content"].split(" ")[1]
                    )

                except InvalidLatitude:
                    latitude = default_latitude
                    longitude = default_longitude
                    logger.warning("Valor de latitud erroneo")

                except InvalidLongitude:
                    latitude = default_latitude
                    longitude = default_longitude
                    logger.warning("Valor de longitud erroneo")

                except KeyError:
                    latitude = default_latitude
                    longitude = default_longitude
                    logger.warning("Latitud o longitud no encontrados")

                logger.debug(f"{name} ||| {phone} ||| {latitude} {longitude}")

                # INSERT VALUE IN DATABASE INFRASTRUCTURE TABLE
                tables = {"Pharmacy": Pharmacy}

                # tables.get(infrastructure).insert()

        logger.debug(urls)
