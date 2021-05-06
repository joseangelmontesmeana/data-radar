import json
import logging
import ssl
import urllib

from radar.constants import (
    DATA_DIRECTORY,
    DATA_FILE_NAMES,
    SETUP_DIRECTORY,
    TABLES,
    URLS_FILE,
)
from radar.exceptions import (
    InvalidLatitude,
    InvalidLocation,
    InvalidLongitude,
    InvalidPhone,
)
from radar.validators import (
    validate_latitude,
    validate_location,
    validate_longitude,
    validate_phone,
)

logger = logging.getLogger(__name__)


class Data:
    def __init__(self):
        pass

    @staticmethod
    def clean_data():
        for desc, table in TABLES.items():
            logger.info(f"Borrando elementos de {desc}")
            table.objects.all().delete()

    @staticmethod
    def __load_data_in_item_type(data, item_type):
        default_phone = ""
        default_latitude = 0
        default_longitude = 0

        for item in data:
            name = item.get("titulo")
            try:
                phone = validate_phone(item.get("telefono"))

            except InvalidPhone:
                phone = default_phone
                logger.warning("Teléfono no disponible")

            try:
                location = validate_location(item.get("localizacion"))
                latitude = validate_latitude(location.split(",")[1].split("Lat:")[1])
                longitude = validate_longitude(location.split(",")[0].split("Lon:")[1])

            except InvalidLocation:
                latitude = default_latitude
                longitude = default_longitude
                logger.warning("Localización no disponible")

            except InvalidLatitude:
                latitude = default_latitude
                longitude = default_longitude
                logger.warning("Latitud no disponible")

            except InvalidLongitude:
                latitude = default_latitude
                longitude = default_longitude
                logger.warning("Longitud no disponible")

            # INSERT VALUE IN DATABASE INFRASTRUCTURE TABLE
            logger.debug(
                f"Añadir en {item_type}: nombre={name}, teléfono={phone}, latitud={latitude}, "
                f"longitud={longitude}"
            )

            try:
                it = TABLES.get(item_type)(
                    name=name, phone=phone, latitude=latitude, longitude=longitude
                )
                it.save()
                pass
            except TypeError:
                logger.warning(f"{item_type} no es una tabla válida")

    def load_data_local(self):
        logger.info("Realizando carga desde ficheros locales")
        try:
            with open(f"{SETUP_DIRECTORY}{DATA_FILE_NAMES}") as json_file:
                file_names = json.load(json_file)
        except OSError:
            logger.error(f"No existe el fichero {SETUP_DIRECTORY}{DATA_FILE_NAMES}")
            exit(1)
        except ValueError:
            logger.error(
                f"{SETUP_DIRECTORY}{DATA_FILE_NAMES} no es un fichero json válido"
            )
            exit(1)

        self.clean_data()

        for item_type, f in file_names.items():
            try:
                with open(f"{DATA_DIRECTORY}{f}") as json_file:
                    data = json.load(json_file)
            except OSError:
                logger.error(f"No existe el fichero {DATA_DIRECTORY}{f}")
                continue
            except ValueError:
                logger.error(f"{DATA_DIRECTORY}{f} no es un fichero json válido")
                continue

            self.__load_data_in_item_type(data, item_type)

    def load_data_www(self):
        logger.info("Realizando carga desde el catálogo de datos abiertos (www)")
        try:
            with open(f"{SETUP_DIRECTORY}{URLS_FILE}") as json_file:
                urls = json.load(json_file)
        except OSError:
            logger.error(f"No existe el fichero {SETUP_DIRECTORY}{URLS_FILE}")
            exit(1)
        except ValueError:
            logger.error(f"{SETUP_DIRECTORY}{URLS_FILE} no es un fichero json válido")
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

            self.__load_data_in_item_type(data, item_type)
