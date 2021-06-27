from django.test import TestCase

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


class ValidatorsTestCase(TestCase):
    def test_validate_phone_not_numeric_error(self):
        with self.assertRaises(InvalidPhone) as ctx:
            validate_phone("NOT_PHONE")

    def test_validate_phone_start_different_6_7_98_error(self):
        with self.assertRaises(InvalidPhone) as ctx:
            validate_phone("800000000")

    def test_validate_phone_98_with_spaces_and_34_right(self):
        self.assertEqual("980000000", validate_phone("34 980 00 00 00"))

    def test_validate_phone_98_with_spaces_right(self):
        self.assertEqual("980000000", validate_phone("980 00 00 00"))

    def test_validate_phone_98_with_34_right(self):
        self.assertEqual("980000000", validate_phone("34980000000"))

    def test_validate_phone_98_right(self):
        self.assertEqual("980000000", validate_phone("980000000"))

    def test_validate_phone_6_right(self):
        self.assertEqual("600000000", validate_phone("600000000"))

    def test_validate_phone_7_right(self):
        self.assertEqual("700000000", validate_phone("700000000"))

    def test_validate_phone_6_with_spaces_and_34_right(self):
        self.assertEqual("600000000", validate_phone("34 600 00 00 00"))

    def test_validate_phone_6_with_spaces_right(self):
        self.assertEqual("600000000", validate_phone("600 00 00 00"))

    def test_validate_phone_6_with_34_right(self):
        self.assertEqual("600000000", validate_phone("34600000000"))

    def test_validate_latitude_decimal_right(self):
        self.assertEqual(45.0, validate_latitude(45.0))

    def test_validate_latitude_int_right(self):
        self.assertEqual(45.0, validate_latitude(45))

    def test_validate_latitude_string_right(self):
        self.assertEqual(45.0, validate_latitude("45"))

    def test_validate_latitude_out_of_range_error(self):
        with self.assertRaises(InvalidLatitude) as ctx:
            validate_latitude(100)

    def test_validate_longitude_decimal_right(self):
        self.assertEqual(160.0, validate_longitude(160.0))

    def test_validate_longitude_int_right(self):
        self.assertEqual(160.0, validate_longitude(160))

    def test_validate_longitude_string_right(self):
        self.assertEqual(160.0, validate_longitude("160"))

    def test_validate_longitude_out_of_range_error(self):
        with self.assertRaises(InvalidLongitude) as ctx:
            validate_longitude(200)

    def test_validate_location_right(self):
        self.assertEqual("Lon:100,Lat:45", validate_location("Lon:100,Lat:45"))

    def test_validate_location_with_spaces_right(self):
        self.assertEqual("Lon:100,Lat:45", validate_location("Lon:  100, Lat: 45"))

    def test_validate_location_without_latitude_error(self):
        with self.assertRaises(InvalidLocation) as ctx:
            validate_location("Lon:100")

    def test_validate_location_without_longitude_error(self):
        with self.assertRaises(InvalidLocation) as ctx:
            validate_location("Lat:45")

    def test_validate_location_without_latitude_longitude_error(self):
        with self.assertRaises(InvalidLocation) as ctx:
            validate_location("")
