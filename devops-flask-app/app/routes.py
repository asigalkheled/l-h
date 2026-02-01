from flask import Blueprint, request, jsonify, render_template, redirect, url_for
from .models import get_all_tasks, add_task, mark_done

main = Blueprint("main", __name__)

@main.route("/")
def index():
    tasks = get_all_tasks()
    return render_template("index.html", tasks=tasks)

@main.route("/add", methods=["POST"])
def add():
    title = request.form.get("title")
    if title:
        add_task(title)
    return redirect(url_for("main.index"))

@main.route("/done/<int:task_id>")
def done(task_id):
    mark_done(task_id)
    return redirect(url_for("main.index"))

# --- API endpoints (great for testing & CI) ---

@main.route("/api/tasks", methods=["GET"])
def api_get_tasks():
    return jsonify(get_all_tasks())

@main.route("/api/tasks", methods=["POST"])
def api_add_task():
    data = request.json
    task = add_task(data["title"])
    return jsonify(task), 201