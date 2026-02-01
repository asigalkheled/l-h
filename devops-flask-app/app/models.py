tasks = []
task_id_counter = 1

def get_all_tasks():
    return tasks

def add_task(title):
    global task_id_counter
    task = {"id": task_id_counter, "title": title, "done": False}
    tasks.append(task)
    task_id_counter += 1
    return task

def mark_done(task_id):
    for task in tasks:
        if task["id"] == task_id:
            task["done"] = True
            return task
    return None