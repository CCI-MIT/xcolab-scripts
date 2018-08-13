# Systemd configuration files
The files in this repository allow you to configure your XCoLab application as a group of Systemd services

## Advantages of using systemd
 * **Standard log treatment**: Application logs are managed through journald
 * **Control over individual services**: each service can be turned on and off using systemctl. The full application can also be controlled this way
 * Easily enable the application to **start automatically after server boots**

# Installation instructions
 1. Copy or clone this repository in a Linux or Mac machine and run "setup.py". This will substitute the patterns with your custom project root path, project name and username of the dedicated user.
 2. Copy the files of your "exec_pre" directory into `${ROOT_PATH}/run` in your server
 3. Copy the contents of the "systemd_unit_files" into `/etc/systemd/system` (in Red Hat or CentOS)
 4. Reload systemd with<br/> `systemctl daemon-reload`
 5. Enable the service that controls the full group (\__x__ is the name of your CoLab in lowercase):<br/> `systemctl enable __x__-colab.service`
 6. Enable the rest of the services with this very short command:

`systemctl enable eureka-colab.service activities-colab.service admin-colab.service comment-colab.service contest-colab.service content-colab.service emails-colab.service members-colab.service modeling-colab.service moderation-colab.service search-colab.service tracking-colab.service view-colab.service`
 7. Give privileges to manage this service to the dedicated user. To do that, copy the file `colab-permissions` into /etc/sudoers.d.

 If everything went well, you should already be able to manage your services with `systemctl` commands. Be aware that in order to change the state of a systemd service you need super-user privileges, so don't forget to modify your `sudoers` file if you want a specific user to control these daemons.


# Useful commands
 * To start/stop the whole application:
  `systemctl start/stop __x__-colab`
 * To start/stop an individual service:
  `systemctl status activities-colab`
 * To check the status of every service:
  `systemctl -a status *colab`
 * To check the log of a service:
  `journalctl -u emails-colab`
