from django.core.validators import RegexValidator
from django.db import models


class Pharmacy(models.Model):
    """
    Model Pharmacy,
    """

    name = models.CharField(max_length=150)
    phone = models.CharField(
        validators=[RegexValidator("^98(\\d){7}$", message="Use formato: 98XXXXXXX")],
        max_length=9,
    )
    latitude = models.DecimalField(max_digits=12, decimal_places=7)
    longitude = models.DecimalField(max_digits=12, decimal_places=7)

    # location = models.PointField()

    # def save(self, *args, **kwargs):
    #     self.latitude = self.location.y
    #     self.longitude = self.location.x
    #     super(Pharmacy, self).save(*args, **kwargs)

    def __str__(self):
        return f"{self.name}|{self.phone}|{self.latitude} {self.longitude}"
