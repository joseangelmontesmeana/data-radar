from django.db import models
from django.core.validators import MinValueValidator, MaxValueValidator


class Pharmacy(models.Model):
    """
    Model Pharmacy,
    """
    name = models.CharField(max_length=30)
    phone = models.PositiveIntegerField(validators=[MinValueValidator(984000000), MaxValueValidator(985999999)])
    latitude = models.DecimalField(max_digits=12, decimal_places=7)
    longitude = models.DecimalField(max_digits=12, decimal_places=7)

    # location = models.PointField()

    # def save(self, *args, **kwargs):
    #     self.latitude = self.location.y
    #     self.longitude = self.location.x
    #     super(Pharmacy, self).save(*args, **kwargs)

    def __str__(self):
        return f"{self.name}|{self.phone}|{self.latitude} {self.longitude}"
