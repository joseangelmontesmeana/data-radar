from django.core.validators import RegexValidator
from django.db import models


# No table, since abstract = True
class BaseModel(models.Model):
    class Meta:
        abstract = True

    name = models.CharField(max_length=150)
    phone = models.CharField(
        validators=[RegexValidator("^98(\\d){7}$", message="Use formato: 98XXXXXXX")],
        max_length=9,
    )
    latitude = models.DecimalField(max_digits=12, decimal_places=7)
    longitude = models.DecimalField(max_digits=12, decimal_places=7)

    def __str__(self):
        return f"{self.name}|{self.phone}|{self.latitude} {self.longitude}"


class HighSchool(BaseModel):
    """
    Model HighSchool,
    """

    pass


class Library(BaseModel):
    """
    Model Library,
    """

    pass


class Monument(BaseModel):
    """
    Model Monument,
    """

    pass


class Museum(BaseModel):
    """
    Model Museum,
    """

    pass


class NurserySchool(BaseModel):
    """
    Model NurserySchool,
    """

    pass


class School(BaseModel):
    """
    Model School,
    """

    pass


class SecurityForce(BaseModel):
    """
    Model SecurityForce,
    """

    pass
