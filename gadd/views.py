from django.shortcuts import render, redirect
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import authenticate, login
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth import logout
from django.shortcuts import HttpResponseRedirect
#import mysql.connector as sql
from gadd.models import test
from gadd.models import user_reg
from django import forms
from django.forms import widgets
from crispy_forms.helper import FormHelper
# Create your views here.

# def signup(request):
#     # if request.user.is_authenticated:
#     #     return redirect('/')
#     if request.method == 'POST':
#         form = user_reg(request.POST)
#         if form.is_valid():
#             form.save()
#             # username = form.cleaned_data.get('username')
#             # email = form.cleaned_data.get('email')
#             # user = authenticate(username=username, password=password)
#             # login(request, user)
#             # user = users.objects.create_user(username=uname , password=psswrd, email = email)
#             # user.save()
#             return redirect('/')
#         else:
#             return render(request, 'signup.html', {'form': form})
#     else:
#         form = user_reg()
#         return render(request, 'signup.html', {'form': form})
def signup(request):
    # if request.user.is_authenticated:
    #     return redirect('/')
    if request.method == 'POST':
        form = user_reg(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password1')
            user = authenticate(username=username, password=password)
            login(request, user)
            return redirect('/')
        else:
            return render(request, 'signup.html', {'form': form})
    else:
        form = user_reg()
        return render(request, 'signup.html', {'form': form})
   
def home(request): 
    return render(request, 'home.html')

  
# def signin(request):
#     # if request.user.is_authenticated:
#     #     return render(request, 'home.html')
#     if request.method == 'POST':
#         uname = request.POST['username']
#         psswrd = request.POST['password']
#         if users.objects.filter(username=uname, password=psswrd).exists() :
#             #login(request, user)
#             request.session['username'] = uname
#             return render(request, 'home.html')
#             #return redirect('/test') #test
#         else:
#             msg = 'Error Login'
#             form = AuthenticationForm(request.POST)
#             return render(request, 'signin.html', {'form': form, 'msg': msg})
#     else:
#         form = AuthenticationForm()
#         return render(request, 'signin.html', {'form': form})

def signin(request):
    if request.user.is_authenticated:
        return render(request, 'home.html')
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('/test_page') #profile
        else:
            msg = 'Error Signin'
            form = AuthenticationForm(request.POST)
            return render(request, 'signin.html', {'form': form, 'msg': msg})
    else:
        form = AuthenticationForm()
        return render(request, 'signin.html', {'form': form})
  
def test_page(request):
    fields={}
    if request.user.is_authenticated:
        count=test.objects.filter(status=1).count()
        #print('count:',count)
        queryset = test.objects.all()
        for object in queryset:
            print(object.question)
            qid=object.id
            quest=object.question
            CHOICES = (
            # ans=object.answer
            # option1=object.opt1
            # option2=object.opt2
            # option3=object.opt3
            ('A', object.opt1),
            ('B', object.answer), 
            ('C', object.opt2),
            ('D', object.opt3),
            )
            # fields[str(object.question)] = forms.ChoiceField(required=False, choices=CHOICES, widget=widgets.RadioSelect)			
            # helper = FormHelper()
            # helper.form_show_labels = False
            # if request.method == 'POST':
            #     user_ans = request.POST['answer']
            #     if ans==user_ans:
            #         print("marks+5")
            return render(request, 'test.html',{'id':qid,'count':count-1,'quest': quest,'fields':CHOICES})
        return render(request, 'test.html') 
   
def signout(request):
    request.session.flush()
    logout(request)
    return redirect('/')