from django.urls import path
from . import views

urlpatterns = [
    path("", views.task_list, name="task_list"),
    path("create/", views.create_task, name="create_task"),
    path("toggle/<int:task_id>/", views.toggle_task, name="toggle_task"),
]
