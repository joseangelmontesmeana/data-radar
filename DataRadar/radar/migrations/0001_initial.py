# Generated by Django 3.0.5 on 2020-04-05 20:22

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Pharmacy',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=30)),
                ('phone', models.PositiveIntegerField(validators=[django.core.validators.MinValueValidator(984000000), django.core.validators.MaxValueValidator(985999999)])),
                ('latitude', models.DecimalField(decimal_places=6, max_digits=10)),
                ('longitude', models.DecimalField(decimal_places=6, max_digits=10)),
            ],
        ),
    ]
