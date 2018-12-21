# Dependencies

## Control host
* Ansible
* Passlib: `pip install passlib`
* Install required roles: `ansible-galaxy install -r requirements.yml`

# Guides

## Set up a new host

To set up a new pogs or xcolab host, run the `pogs.yml` or `xcolab.yml` playbook with `ansible-playbook`.

Make sure you configured the host to log in with a sudo account and you run with the`--ask-become-pass` option enabled. 
