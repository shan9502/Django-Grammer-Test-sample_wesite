from django.db import models
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User

# Create your models here.
# question and answers
class test(models.Model):
    question=models.CharField(max_length=40)
    answer=models.CharField(max_length=20)
    opt1=models.CharField(max_length=20)
    opt2=models.CharField(max_length=20)
    opt3=models.CharField(max_length=20)
    time=models.IntegerField()
    status=models.IntegerField()
    class Meta:
        db_table='test'
        managed = True
        verbose_name = 'Tests'
        verbose_name_plural = 'Tests'

# class users(models.Model):
#     id=models.IntegerField(primary_key=True)
#     username=models.CharField(max_length=50)
#     password=models.CharField(max_length=50)
#     email=models.CharField(max_length=50)
#     class Meta:
#         db_table="users"

# for user registration
class user_reg(UserCreationForm):
    fname=models.CharField(max_length=50)
    lname=models.CharField(max_length=50)
    username=models.CharField(max_length=50)
    password=models.CharField(max_length=50)
    email=models.CharField(max_length=50)
    marks=models.IntegerField()
    class Meta:
        model = User
        fields = ['first_name','last_name','username', 'email', 'password1', 'password2']
 