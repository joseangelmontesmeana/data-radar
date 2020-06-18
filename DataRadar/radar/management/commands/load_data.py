import logging

from django.conf import settings
from django.core.management.base import BaseCommand

from radar.etl.data import Data

logger = logging.getLogger(__name__)


class Command(BaseCommand):
    help = "Comando load_data, permite cargar los datos desde las urls configuradas."

    def handle(self, *args, **options):
        logger.info("Ejecutando comando load_data")

        data = Data()
        if settings.LOCAL_DATA:
            data.load_data_local()
        else:
            data.load_data_www()
