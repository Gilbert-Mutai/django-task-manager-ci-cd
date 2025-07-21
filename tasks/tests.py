import pytest
from django.urls import reverse
from django.test import Client


@pytest.mark.django_db
def test_task_list_view_renders():
    client = Client()
    response = client.get(reverse("task_list"))
    assert response.status_code == 200
