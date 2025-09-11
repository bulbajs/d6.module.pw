from django import forms
from django.contrib.auth.models import User, Group
from django.contrib.auth.forms import UserCreationForm
from allauth.account.forms import SignupForm
from django.core.mail import send_mail
from django.core.mail import EmailMultiAlternatives, mail_managers, mail_admins

class SignUpForm(UserCreationForm):
    first_name = forms.CharField(label='Имя')
    last_name = forms.CharField(label='Фамилия')
    email = forms.EmailField(label='Email')

    class Meta:
        model = User
        fields = [
            'username',
            'first_name',
            'last_name',
            'email',
            'password1',
            'password2',
        ]


class CustomSignupForm(SignupForm):
    def save(self, request):
        user = super().save(request)

        print(f"DEBUG: Отправляем письмо пользователю {user.email}")  # <- отладка


        subject = 'Добро пожаловать к нам на сайт!'
        text = f'{user.username}, вы успешно зарегистрированы!'
        html = (
            f'<b>{user.username}</b>, вы успешно зарегистрировались на '
            f'<a href="http://127.0.0.1:8000/products">сайте</a>!'
        )
        msg = EmailMultiAlternatives(
            subject=subject, body=text, from_email=None, to=[user.email]
        )
        msg.attach_alternative(html, "text/html")
        msg.send()

        mail_managers(
            subject='Там кто-то зарегался',
            message=f'{user.username}, зарегался и хочет купить у нас арбуз !',
        )

        print('DEBUG: Письмо отправлено!')  # <- отладка
        return user
