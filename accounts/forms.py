from django import forms
from django.contrib.auth.models import User, Group
from django.contrib.auth.forms import UserCreationForm
from allauth.account.forms import SignupForm
from django.core.mail import send_mail


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

        send_mail(
            subject='Добро пожаловать к нам на сайт!',
            message=f'{user.username}, вы успешно зарегистрированы!',
            from_email='lapetrla@yandex.ru',
            recipient_list=[user.email],
            fail_silently=False,
        )
        print('DEBUG: Письмо отправлено!')  # <- отладка
        return user
