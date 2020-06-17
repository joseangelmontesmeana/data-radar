import logging

from django.core.management.base import BaseCommand

from radar.data.load_data import Data

logger = logging.getLogger(__name__)


class Command(BaseCommand):
    help = "Comando load_data, permite cargar los datos desde las urls configuradas."

    def handle(self, *args, **options):
        logger.info("Ejecutando comando load_data")
        data = Data()
        data.load_data()
