# Ansible Galaxy Roles - On top of Docker Desktop
## Base on stop and start state playbook from previous lab

- Make Sure the state is start via previous lab and then make sure its on stopped state
```
ansible-playbook -i inventory.yml manage_flask.yml -e "state=stop"
```
### Steps - Create Galaxy Role
  - Ansible Galaxy role
  - Defaults (role defaults)
  - Global vars override
  - Handlers (start/stop)
  - Clean production structure
    
- Step 1 — Inventory, Just check ping pong
- Step 2 — Create Galaxy Role
```
ansible-galaxy init flask_app
ls -ll
  # Output
flask_app/
	README.md/
	defaults/
	files/
	handlers/	
	meta/
	tasks/
	templates/
	tests/
	vars/
```

- Step 3 — Define Default Global Variables
```
tee flask_app/defaults/main.yml > /dev/null <<EOF
---
# defaults file for flask_app
app_dir: /home/ansible
app_file: "{{ app_dir }}/app.py"
venv_python: "{{ app_dir }}/venv/bin/python"
pid_file: "{{ app_dir }}/app.pid"

# default behavior
state: start

EOF
```


- Step 3 — Move Your Tasks Into Role
```
tee flask_app/tasks/main.yml > /dev/null <<EOF
---
# tasks file for flask_app
- name: Trigger start
  command: /bin/true
  when: state == "start"
  notify: start app

- name: Trigger stop
  command: /bin/true
  when: state == "stop"
  notify: stop app

EOF
```
- Step 4 — Move Handlers Into Role - **Copy from handlers/main.yml via vi in case the tee is not work**
```
tee flask_app/handlers/main.yml > /dev/null <<EOF
---
# handlers file for flask_app
- name: start app
  shell: |
    nohup {{ venv_python }} {{ app_file }} \
    > {{ app_dir }}/app.log 2>&1 &
    echo $! > {{ pid_file }}
  args:
    executable: /bin/sh

- name: stop app
  shell: |
    if [ -f {{ pid_file }} ]; then
        kill $(cat {{ pid_file }}) || true
        rm -f {{ pid_file }}
    fi
  args:
    executable: /bin/sh

EOF
```
 
- Step 5  — Create General Playbook deploy_galaxy_role.yml

```
tee deploy_galaxy_role.yml > /dev/null <<EOF
---
- name: Manage Flask via Galaxy Role
  hosts: slaves
  become: yes

  roles:
    - flask_app

EOF
```

- Step 6 — Execute playbook

```
ansible-playbook -i inventory.yml deploy_galaxy_role.yml -e "state=stop"
ansible-playbook -i inventory.yml deploy_galaxy_role.yml -e "state=start"
```
