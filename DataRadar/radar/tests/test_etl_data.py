from django.test import TestCase

from radar.etl.data import Data
from radar.constants import (
    DATA_DIRECTORY,
    DATA_FILE_NAMES,
    SETUP_DIRECTORY,
    TABLES,
    URLS_FILE,
)


class DataTestCase(TestCase):
    d = Data()

    def setUp(self):
        pass

    def test_1(self):
        pass

    # def test_load_data_in_item_type(self):
    #     # (data, item_type):
    #     self.d._Data__load_data_in_item_type("data", "item_type")
