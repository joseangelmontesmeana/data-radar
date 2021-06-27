from django.test import TestCase

from radar.etl.data import Data
from radar.models import (
    HighSchool,
    Library,
    Monument,
    Museum,
    NurserySchool,
    School,
    SecurityForce,
)


class DataTestCase(TestCase):
    d = Data()

    def tearDown(self):
        HighSchool.objects.all().delete()
        Library.objects.all().delete()
        Monument.objects.all().delete()
        Museum.objects.all().delete()
        NurserySchool.objects.all().delete()
        School.objects.all().delete()
        SecurityForce.objects.all().delete()

    def test_clean_data(self):
        HighSchool.objects.create(
            name="I.E.S. test_unit_001",
            phone="985000011",
            latitude=43.533349,
            longitude=-5.63369,
        )
        Library.objects.create(
            name="Biblioteca test_unit_001",
            phone="985000021",
            latitude=43.5409683,
            longitude=-5.661986,
        )
        Monument.objects.create(
            name="Monumento test_unit_001",
            phone="985000031",
            latitude=43.5352342,
            longitude=-5.6839832,
        )
        Museum.objects.create(
            name="Museo test_unit_001",
            phone="985000041",
            latitude=43.544187,
            longitude=-5.663812,
        )
        NurserySchool.objects.create(
            name="Escuela infantil test_unit_001",
            phone="985000051",
            latitude=43.528987,
            longitude=-5.640641,
        )
        School.objects.create(
            name="Colegio test_unit_001",
            phone="985000061",
            latitude=43.528448,
            longitude=-5.671051,
        )
        SecurityForce.objects.create(
            name="Bomberos test_unit_001",
            phone="985000071",
            latitude=43.515687,
            longitude=-5.679437,
        )

        self.d.clean_data()

        self.assertListEqual(list(HighSchool.objects.all()), [])
        self.assertListEqual(list(Library.objects.all()), [])
        self.assertListEqual(list(Monument.objects.all()), [])
        self.assertListEqual(list(Museum.objects.all()), [])
        self.assertListEqual(list(NurserySchool.objects.all()), [])
        self.assertListEqual(list(School.objects.all()), [])
        self.assertListEqual(list(SecurityForce.objects.all()), [])

    def test_load_data_in_item_type_high_school(self):
        data = [
            {
                "titulo": "I.E.S. test_unit_001",
                "telefono": "985000011",
                "localizacion": "Lon:-5.63369, Lat:43.533349",
            }
        ]
        self.d._Data__load_data_in_item_type(data, "HighSchools")
        self.assertEqual(HighSchool.objects.first().name, "I.E.S. test_unit_001")
        self.assertEqual(HighSchool.objects.first().phone, "985000011")
        self.assertEqual(float(HighSchool.objects.first().latitude), 43.533349)
        self.assertEqual(float(HighSchool.objects.first().longitude), -5.63369)

    def test_load_data_in_item_type_library(self):
        data = [
            {
                "titulo": "Biblioteca test_unit_001",
                "telefono": "985000021",
                "localizacion": "Lon:-5.63369, Lat:43.533349",
            }
        ]
        self.d._Data__load_data_in_item_type(data, "Libraries")
        self.assertEqual(Library.objects.first().name, "Biblioteca test_unit_001")
        self.assertEqual(Library.objects.first().phone, "985000021")
        self.assertEqual(float(Library.objects.first().latitude), 43.533349)
        self.assertEqual(float(Library.objects.first().longitude), -5.63369)

    def test_load_data_in_item_type_monument(self):
        data = [
            {
                "titulo": "Monumento test_unit_001",
                "telefono": "985000031",
                "localizacion": "Lon:-5.63369, Lat:43.533349",
            }
        ]
        self.d._Data__load_data_in_item_type(data, "Monuments")
        self.assertEqual(Monument.objects.first().name, "Monumento test_unit_001")
        self.assertEqual(Monument.objects.first().phone, "985000031")
        self.assertEqual(float(Monument.objects.first().latitude), 43.533349)
        self.assertEqual(float(Monument.objects.first().longitude), -5.63369)

    def test_load_data_in_item_type_museum(self):
        data = [
            {
                "titulo": "Museo test_unit_001",
                "telefono": "985000041",
                "localizacion": "Lon:-5.63369, Lat:43.533349",
            }
        ]
        self.d._Data__load_data_in_item_type(data, "Museums")
        self.assertEqual(Museum.objects.first().name, "Museo test_unit_001")
        self.assertEqual(Museum.objects.first().phone, "985000041")
        self.assertEqual(float(Museum.objects.first().latitude), 43.533349)
        self.assertEqual(float(Museum.objects.first().longitude), -5.63369)

    def test_load_data_in_item_type_nursery_school(self):
        data = [
            {
                "titulo": "Escuela infantil test_unit_001",
                "telefono": "985000051",
                "localizacion": "Lon:-5.63369, Lat:43.533349",
            }
        ]
        self.d._Data__load_data_in_item_type(data, "NurserySchools")
        self.assertEqual(
            NurserySchool.objects.first().name, "Escuela infantil test_unit_001"
        )
        self.assertEqual(NurserySchool.objects.first().phone, "985000051")
        self.assertEqual(float(NurserySchool.objects.first().latitude), 43.533349)
        self.assertEqual(float(NurserySchool.objects.first().longitude), -5.63369)

    def test_load_data_in_item_type_school(self):
        data = [
            {
                "titulo": "Colegio test_unit_001",
                "telefono": "985000061",
                "localizacion": "Lon:-5.63369, Lat:43.533349",
            }
        ]
        self.d._Data__load_data_in_item_type(data, "Schools")
        self.assertEqual(School.objects.first().name, "Colegio test_unit_001")
        self.assertEqual(School.objects.first().phone, "985000061")
        self.assertEqual(float(School.objects.first().latitude), 43.533349)
        self.assertEqual(float(School.objects.first().longitude), -5.63369)

    def test_load_data_in_item_type_security_force(self):
        data = [
            {
                "titulo": "Bomberos test_unit_001",
                "telefono": "985000071",
                "localizacion": "Lon:-5.63369, Lat:43.533349",
            }
        ]
        self.d._Data__load_data_in_item_type(data, "SecurityForces")
        self.assertEqual(SecurityForce.objects.first().name, "Bomberos test_unit_001")
        self.assertEqual(SecurityForce.objects.first().phone, "985000071")
        self.assertEqual(float(SecurityForce.objects.first().latitude), 43.533349)
        self.assertEqual(float(SecurityForce.objects.first().longitude), -5.63369)
