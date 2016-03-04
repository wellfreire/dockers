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
```

Ready-to-use Playbooks
----------------------

All the existing playbooks are placed inside the ***resources/playbooks*** directory. There you'll find a folder for each of them. So, in the upcoming docs for each playbook consider their own folder as the root for any relative path.

### Jenkins CI Server

Deploys a Jenkins CI server on every target host. This playbook uses the Ansible Galaxy's role from Jeff Geerling (see [here](https://galaxy.ansible.com/geerlingguy/jenkins/)).

#### Setup

First of all, you need to import the Jenkins role from Ansible Galaxy. Run the following command:

```bash
$ ansible-galaxy install -r requirements.yml -p roles
```

Then, modify the ***hosts*** (*inventory*) file by including all of your servers under the **ci-servers** group.

Inside ***vars/external_vars.yml*** define the *remote_user* for logging in into the hosts, which is set for *root* by default.

In this same vars file you can set other variables for the *Jenkins role*. For instance, you can change the *port* in which Jenkins you'll be available in your hosts by simple changing the *jenkins_http_port* variable (for more options please refer to the role docs linked above).

You can also change/add any additional configuration in the ***playbook.yml***.

#### Usage

Once you're done, simply run the playbook using the following:

```bash
$ ansible-playbook -i hosts playbook.yml
```

In case you do not have an *ssh key* already set up you can add a flag for entering a password instead:

```bash
$ ansible-playbook -i hosts playbook.yml --ask-pass
```

Once the *playbook* run you can already access the Jenkins dashboard by pointing to *your.example-server.com:8080* (or another port you may have indicated).