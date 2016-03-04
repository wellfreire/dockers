Ansible Machines
================

Creates a container ready for being managed by Ansible, containing Python installed as well as ssh enabled.

Setup
-----

You should place a ***ssh_key.pub*** file containing a public ssh key for being placed on the created container.

In the ***docker-compose.yml*** file only a single container is set to be built. You can replicate that for building any number of identical containers.

Usage
-----

### Building and Running the container(s)


First, you need **docker** and **docker compose** properly set up. Then:

```bash
$ docker-compose build

$ docker-compose up -d
```

With your container(s) up and running you now can access their bash by executing:

```bash
$ docker exec -it ansiblemachines_{container_name}_1 bash
```