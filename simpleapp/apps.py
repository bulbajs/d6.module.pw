from django.apps import AppConfig


class SimpleappConfig(AppConfig):
    name = 'simpleapp'
    default_auto_field = 'django.db.models.BigAutoField'

    def ready(self):
        from . import signals
        