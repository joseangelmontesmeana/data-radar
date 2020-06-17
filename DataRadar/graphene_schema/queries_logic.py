import geopy.distance


def get_item(item_type, info, **kwargs):
    id = kwargs.get("id")
    name = kwargs.get("name")
    if id is not None:
        return item_type.objects.get(pk=id)
    if name is not None:
        return item_type.objects.get(name=name)
    return None


def get_all_items(item_type):
    return item_type.objects.all()


def get_list_items(item_type, info, **kwargs):
    names = kwargs.get("names")
    if names is not None:
        items = []
        for name in names:
            item = item_type.objects.get(name=name)
            if item is not None:
                items.append(item)
        return items
    return None


def get_nearby_items(item_type, info, **kwargs):
    latitude = kwargs.get("latitude")
    longitude = kwargs.get("longitude")
    radio = kwargs.get("radio")

    # Validate coordinates  "coords1" and "coords2"

    coords1 = (latitude, longitude)
    items = []
    all_items = item_type.objects.all()

    for item in all_items:
        coords2 = (item.latitude, item.longitude)
        try:
            if abs(geopy.distance.geodesic(coords1, coords2).m) <= radio:
                items.append(item)
        except ValueError:
            pass

    return items
