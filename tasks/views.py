from django.shortcuts import render, redirect
from .models import Task
from django.views.decorators.http import require_POST
from django.db.models import Q


def task_list(request):
    query = request.GET.get("q", "")
    incomplete_tasks = Task.objects.filter(is_completed=False)
    completed_tasks = Task.objects.filter(is_completed=True)

    if query:
        incomplete_tasks = incomplete_tasks.filter(Q(title__icontains=query))
        completed_tasks = completed_tasks.filter(Q(title__icontains=query))

    return render(
        request,
        "tasks/index.html",
        {
            "incomplete_tasks": incomplete_tasks,
            "completed_tasks": completed_tasks,
        },
    )


@require_POST
def create_task(request):
    title = request.POST.get("title")
    reminder = request.POST.get("reminder")
    if title:
        Task.objects.create(title=title, reminder=reminder or None)
    return redirect("task_list")


@require_POST
def toggle_task(request, task_id):
    task = Task.objects.get(id=task_id)
    task.is_completed = not task.is_completed
    task.save()
    return redirect("task_list")
