Ansible Docker Image
====================

Provides a container ready with the latest **Ansible**.

Usage
-----

### Building and Running the container


First, you need **docker** and **docker compose** properly set up. Then:

```bash
$ docker-compose build ansible

$ docker-compose up -d ansible
```

With your container up and running you now can access its bash in order to use Ansible:

```bash
$ docker exec -it ansible_ansible_1 bash
```

### SSH setup

You can set up an ssh key for using when running Ansible's playbooks. Suppose you placed your ***id_rsa*** ssh key file inside the mirrored ***~/resources/ssh*** directory. Then, run:

```bash
$ cd ~/resources
$ ssh-agent bash && ssh-add ssh/id_rsa