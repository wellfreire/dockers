Ansible Docker Image
====================

Provides a container ready with Ansible.

Usage
-----

First, you need **docker** and **docker compose** properly set up. Then, from the root directory:

```
docker-compose build ansible

docker-compose up -d ansible

docker exec -it ansible_ansible_1 bash
```