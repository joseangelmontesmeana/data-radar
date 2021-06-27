from django.test import TestCase

from graphene_schema.queries_logic import (
    get_all_items,
    get_item,
    get_list_items,
    get_nearby_items,
)
from radar.models import (
    HighSchool,
    Library,
    Monument,
    Museum,
    NurserySchool,
    School,
    SecurityForce,
)


class QueriesLogicTestCase(TestCase):
    def _get_item(self, model_type, name, phone, latitude, longitude):
        it = get_item(model_type, info=None, name=name)
        self.assertIsInstance(it, model_type)
        self.assertEqual(it.name, name)
        self.assertEqual(it.phone, phone)
        self.assertEqual(float(it.latitude), latitude)
        self.assertEqual(float(it.longitude), longitude)

    def _get_all_items(self, model_type, names, phones):
        it = get_all_items(model_type, info=None)
        self.assertListEqual(names, [i.name for i in it])
        self.assertListEqual(phones, [i.phone for i in it])

    def _get_list_items(self, model_type, names, phones):
        it = get_list_items(model_type, info=None, names=names)
        self.assertListEqual(names, [i.name for i in it])
        self.assertListEqual(phones, [i.phone for i in it])

    def _get_nearby_items(self, model_type, radio, latitude, longitude, names, phones):
        it = get_nearby_items(
            model_type, info=None, radio=radio, latitude=latitude, longitude=longitude
        )
        self.assertListEqual(names, [i.name for i in it])
        self.assertListEqual(phones, [i.phone for i in it])

    def setUp(self):
        HighSchool.objects.create(
            name="I.E.S. test_unit_001",
            phone="985000011",
            latitude=43.533349,
            longitude=-5.63369,
        )
        HighSchool.objects.create(
            name="I.E.S. test_unit_002",
            phone="985000012",
            latitude=43.532827,
            longitude=-5.670317,
        )
        HighSchool.objects.create(
            name="I.E.S. test_unit_003",
            phone="985000013",
            latitude=43.53516,
            longitude=-5.63369,
        )
        Library.objects.create(
            name="Biblioteca test_unit_001",
            phone="985000021",
            latitude=43.5409683,
            longitude=-5.661986,
        )
        Library.objects.create(
            name="Biblioteca test_unit_002",
            phone="985000022",
            latitude=43.539022,
            longitude=-5.650375,
        )
        Library.objects.create(
            name="Biblioteca test_unit_003",
            phone="985000023",
            latitude=43.521188,
            longitude=-5.746938,
        )
        Monument.objects.create(
            name="Monumento test_unit_001",
            phone="985000031",
            latitude=43.5352342,
            longitude=-5.6839832,
        )
        Monument.objects.create(
            name="Monumento test_unit_002",
            phone="985000032",
            latitude=43.5480321,
            longitude=-5.6386973,
        )
        Monument.objects.create(
            name="Monumento test_unit_003",
            phone="985000033",
            latitude=43.5322015,
            longitude=-5.6611195,
        )
        Museum.objects.create(
            name="Museo test_unit_001",
            phone="985000041",
            latitude=43.544187,
            longitude=-5.663812,
        )
        Museum.objects.create(
            name="Museo test_unit_002",
            phone="985000042",
            latitude=43.5453,
            longitude=-5.663616,
        )
        Museum.objects.create(
            name="Museo test_unit_003",
            phone="985000043",
            latitude=43.537007,
            longitude=-5.634747,
        )
        NurserySchool.objects.create(
            name="Escuela infantil test_unit_001",
            phone="985000051",
            latitude=43.528987,
            longitude=-5.640641,
        )
        NurserySchool.objects.create(
            name="Escuela infantil test_unit_002",
            phone="985000052",
            latitude=43.491355,
            longitude=-5.652119,
        )
        NurserySchool.objects.create(
            name="Escuela infantil test_unit_003",
            phone="985000053",
            latitude=43.512529,
            longitude=-5.668848,
        )
        School.objects.create(
            name="Colegio test_unit_001",
            phone="985000061",
            latitude=43.528448,
            longitude=-5.671051,
        )
        School.objects.create(
            name="Colegio test_unit_002",
            phone="985000062",
            latitude=43.530002,
            longitude=-5.643543,
        )
        School.objects.create(
            name="Colegio test_unit_003",
            phone="985000063",
            latitude=43.527188,
            longitude=-5.654062,
        )
        SecurityForce.objects.create(
            name="Bomberos test_unit_001",
            phone="985000071",
            latitude=43.515687,
            longitude=-5.679437,
        )
        SecurityForce.objects.create(
            name="Bomberos test_unit_002",
            phone="985000072",
            latitude=43.535219,
            longitude=-5.658845,
        )
        SecurityForce.objects.create(
            name="Guardia Civil test_unit_003",
            phone="985000073",
            latitude=43.531938,
            longitude=-5.650687,
        )

    def test_get_item_high_school_1(self):
        self._get_item(
            HighSchool, "I.E.S. test_unit_001", "985000011", 43.5333490, -5.6336900
        )

    def test_get_item_high_school_2(self):
        self._get_item(
            HighSchool, "I.E.S. test_unit_002", "985000012", 43.532827, -5.670317
        )

    def test_get_item_library_1(self):
        self._get_item(
            Library, "Biblioteca test_unit_001", "985000021", 43.5409683, -5.661986
        )

    def test_get_item_library_2(self):
        self._get_item(
            Library, "Biblioteca test_unit_002", "985000022", 43.539022, -5.650375
        )

    def test_get_item_monument_1(self):
        self._get_item(
            Monument, "Monumento test_unit_001", "985000031", 43.5352342, -5.6839832
        )

    def test_get_item_monument_2(self):
        self._get_item(
            Monument, "Monumento test_unit_002", "985000032", 43.5480321, -5.6386973
        )

    def test_get_item_museum_1(self):
        self._get_item(Museum, "Museo test_unit_001", "985000041", 43.544187, -5.663812)

    def test_get_item_museum_2(self):
        self._get_item(Museum, "Museo test_unit_002", "985000042", 43.5453, -5.663616)

    def test_get_item_nursery_school_1(self):
        self._get_item(
            NurserySchool,
            "Escuela infantil test_unit_001",
            "985000051",
            43.528987,
            -5.640641,
        )

    def test_get_item_nursery_school_2(self):
        self._get_item(
            NurserySchool,
            "Escuela infantil test_unit_002",
            "985000052",
            43.491355,
            -5.652119,
        )

    def test_get_item_school_1(self):
        self._get_item(
            School, "Colegio test_unit_001", "985000061", 43.528448, -5.671051
        )

    def test_get_item_school_2(self):
        self._get_item(
            School, "Colegio test_unit_002", "985000062", 43.530002, -5.643543
        )

    def test_get_item_security_force_1(self):
        self._get_item(
            SecurityForce, "Bomberos test_unit_001", "985000071", 43.515687, -5.679437
        )

    def test_get_item_security_force_2(self):
        self._get_item(
            SecurityForce, "Bomberos test_unit_002", "985000072", 43.535219, -5.658845
        )

    def test_get_all_high_school(self):
        self._get_all_items(
            HighSchool,
            ["I.E.S. test_unit_001", "I.E.S. test_unit_002", "I.E.S. test_unit_003"],
            ["985000011", "985000012", "985000013"],
        )

    def test_get_all_library(self):
        self._get_all_items(
            Library,
            [
                "Biblioteca test_unit_001",
                "Biblioteca test_unit_002",
                "Biblioteca test_unit_003",
            ],
            ["985000021", "985000022", "985000023"],
        )

    def test_get_all_monument(self):
        self._get_all_items(
            Monument,
            [
                "Monumento test_unit_001",
                "Monumento test_unit_002",
                "Monumento test_unit_003",
            ],
            ["985000031", "985000032", "985000033"],
        )

    def test_get_all_museum(self):
        self._get_all_items(
            Museum,
            ["Museo test_unit_001", "Museo test_unit_002", "Museo test_unit_003"],
            ["985000041", "985000042", "985000043"],
        )

    def test_get_all_nursery_school(self):
        self._get_all_items(
            NurserySchool,
            [
                "Escuela infantil test_unit_001",
                "Escuela infantil test_unit_002",
                "Escuela infantil test_unit_003",
            ],
            ["985000051", "985000052", "985000053"],
        )

    def test_get_all_school(self):
        self._get_all_items(
            School,
            ["Colegio test_unit_001", "Colegio test_unit_002", "Colegio test_unit_003"],
            ["985000061", "985000062", "985000063"],
        )

    def test_get_all_security_force(self):
        self._get_all_items(
            SecurityForce,
            [
                "Bomberos test_unit_001",
                "Bomberos test_unit_002",
                "Guardia Civil test_unit_003",
            ],
            ["985000071", "985000072", "985000073"],
        )

    def test_get_list_high_school(self):
        self._get_list_items(
            HighSchool,
            ["I.E.S. test_unit_001", "I.E.S. test_unit_003"],
            ["985000011", "985000013"],
        )

    def test_get_list_high_library(self):
        self._get_list_items(
            Library,
            ["Biblioteca test_unit_001", "Biblioteca test_unit_003"],
            ["985000021", "985000023"],
        )

    def test_get_list_monument(self):
        self._get_list_items(
            Monument,
            ["Monumento test_unit_001", "Monumento test_unit_003"],
            ["985000031", "985000033"],
        )

    def test_get_list_museum(self):
        self._get_list_items(
            Museum,
            ["Museo test_unit_001", "Museo test_unit_003"],
            ["985000041", "985000043"],
        )

    def test_get_list_nursery_school(self):
        self._get_list_items(
            NurserySchool,
            ["Escuela infantil test_unit_001", "Escuela infantil test_unit_003"],
            ["985000051", "985000053"],
        )

    def test_get_list_school(self):
        self._get_list_items(
            School,
            ["Colegio test_unit_001", "Colegio test_unit_003"],
            ["985000061", "985000063"],
        )

    def test_get_list_security_force(self):
        self._get_list_items(
            SecurityForce,
            ["Bomberos test_unit_001", "Guardia Civil test_unit_003"],
            ["985000071", "985000073"],
        )

    def test_get_nearby_high_school(self):
        self._get_nearby_items(
            HighSchool,
            radio=1000,
            latitude=43.533349,
            longitude=-5.63369,
            names=["I.E.S. test_unit_001", "I.E.S. test_unit_003"],
            phones=["985000011", "985000013"],
        )

    def test_get_nearby_library(self):
        self._get_nearby_items(
            Library,
            radio=1000,
            latitude=43.5409683,
            longitude=-5.661986,
            names=["Biblioteca test_unit_001", "Biblioteca test_unit_002"],
            phones=["985000021", "985000022"],
        )

    def test_get_nearby_monument(self):
        self._get_nearby_items(
            Monument,
            radio=1000,
            latitude=43.5409683,
            longitude=-5.661986,
            names=["Monumento test_unit_003"],
            phones=["985000033"],
        )

    def test_get_nearby_museum(self):
        self._get_nearby_items(
            Museum,
            radio=1000,
            latitude=43.5409683,
            longitude=-5.661986,
            names=["Museo test_unit_001", "Museo test_unit_002"],
            phones=["985000041", "985000042"],
        )

    def test_get_nearby_nursery_school(self):
        self._get_nearby_items(
            NurserySchool,
            radio=1000,
            latitude=43.528987,
            longitude=-5.640641,
            names=["Escuela infantil test_unit_001"],
            phones=["985000051"],
        )

    def test_get_nearby_school(self):
        self._get_nearby_items(
            School,
            radio=1000,
            latitude=43.528987,
            longitude=-5.640641,
            names=["Colegio test_unit_002"],
            phones=["985000062"],
        )

    def test_get_nearby_security_force(self):
        self._get_nearby_items(
            SecurityForce,
            radio=1000,
            latitude=43.528987,
            longitude=-5.640641,
            names=["Guardia Civil test_unit_003"],
            phones=["985000073"],
        )
