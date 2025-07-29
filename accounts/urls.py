from django.urls import path
from .views import CreateAccount,CustomLoginView

urlpatterns = [
    path('signup/', CreateAccount.as_view(), name='signup'),
    path('login/', CustomLoginView.as_view(), name='login'),
]