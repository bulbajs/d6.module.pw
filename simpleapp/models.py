from django.db import models
from django.shortcuts import reverse
from django.core.validators import MaxLengthValidator, MinValueValidator
from django.contrib.auth.models import User


class Product(models.Model):
    name = models.CharField(max_length=100, unique=True)
    description = models.TextField()
    quantity = models.IntegerField(default=0, validators=[MinValueValidator(0)])
    category = models.ForeignKey('Category',on_delete=models.CASCADE, related_name='products')
    price = models.FloatField(validators=[MinValueValidator(0.0)])

    def __str__(self):
        return f'{self.name.title()}: {self.description[:100]}'

    def get_absolute_url(self):
        return reverse('products_list')


class Category(models.Model):
    name = models.CharField(max_length=100, unique=True)

    def __str__(self):
        return f'{self.name.title()}'


class Subscriptions(models.Model):
    user = models.ForeignKey(to=User, on_delete=models.CASCADE, related_name='subscriptions')
    category = models.ForeignKey(to='Category', on_delete=models.CASCADE, related_name='subscriptions')
