# Vagrant Environment

## Kudos and Inspiration

* Mutable Instrument's [mutable-dev-environment](https://github.com/pichenettes/mutable-dev-environment)

## Requirements

* [VirtualBox 6.x](https://www.virtualbox.org/wiki/Downloads)
* [VirtualBox Extension Pack](https://www.virtualbox.org/wiki/Downloads)
* [Vagrant](https://www.vagrantup.com/downloads.html)

The Extension pack consists of a file with the `vbox-extpack` extension.  On windows, double click on it.  On OS X or Linux, the file needs to be installed from the command line with the command:

    VBoxManage extpack install <filename>

Finally if you are running a Linux operating system you will want to add your user to the `vboxusers` group so that the virtual machine can access your USB devices.  Run the following command:

    sudo usermod -a -G vboxusers <username>

Then **log out and log back in** to make sure the group change takes effect.

## Usage

First, clone this repository:

	git clone https://github.com/pichenettes/mutable-dev-environment.git

or download: 

	https://github.com/pichenettes/mutable-dev-environment/archive/master.zip

To start the VM, open a terminal in the `mutable-dev-environment` directory with the Vagrantfile and run:

    vagrant up

The first time the VM is started, all tools will be downloaded, and the latest version of the code will be grabbed from github.  The process takes about 15 minutes, depending on the speed of your internet connection or computer.

Then, you can log onto the virtual machine by running:

    vagrant ssh

Once you're done with your session, you can leave the VM terminal with:

    exit

The virtual machine continues running and can be reaccessed with `vagrant ssh`. It can also be suspended with `vagrant suspend`, halted with `vagrant halt`, and completely destroyed with `vagrant destroy`.  Note that with this last command, you might lose any files you have created inside the VM's disk image!

## File Sharing

By default, the working directory `projects` is created in the `/vagrant` directory, which is shared between the VM and the host. You can use any text editor on the host to modify the files.  Note that any file can be transferred between the VM and the host by being copied in this location.

## USB Issues

To pass through USB devices from your real machine to the virtual machine, consult the [VirtualBox USB Documentation](https://www.virtualbox.org/manual/ch03.html#idp96037808).

### Arduino UNO

If you get the following error when uploading to the Arduino, you may need to add the `vagrant` user to the `dialout` group.

```
avrdude: ser_open(): can't open device "/dev/ttyACM0": Permission denied
```

To fix this, open the terminal or ssh connection and type:

```
ls -l /dev/ttyACM*
```

You should get something like this:

```
crw-rw---- 1 root dialout 188, 0 5 apr 23.01 ttyACM0
```

The `0` at the end of ACM might be a different number, or multiple entries might be returned. The data we need is the group owner of the file: `dialout`.

Now we just need to add our user to the group:

```
sudo usermod -a -G dialout <username>
```

Where `<username>` is your Linux user name, in our case `vagrant`.

**You will need to `vagrant halt` and `vagrant up` for this change to take effect.**

## Additional Development Setup

The following setup may be required if you intend to use the Vagrant box as a development environment.

If you intend to use the box to clone and build existing repos, these setup tasks aren't necessary.

### Scripts

If you intend to use the `init-repo` script, add the `DEV_HOST` environment variable to `.bashrc`:

```
export DEV_HOST=git@example.com:namespace
```

### Git

Configure git user and email:

```
git config --global user.name "Your Name"
git config --global user.email you@example.com
```

### SSH

Install your ssh keys in `~/.ssh`.

Ensure that the keys have the correct permissions:

```
sudo chmod 600 ~/.ssh/id_rsa
sudo chmod 600 ~/.ssh/id_rsa.pub
```

### VSCode

1. Ensure that the Vagrant box is up with `vagrant up`.

2. Run `vagrant ssh-config` to output the valid configuration for an SSH config file to SSH into the running Vagrant machine from `ssh` directly instead of using `vagrant ssh`.

3. The result should look something like this:
```
Host default
  HostName 127.0.0.1
  User vagrant
  Port 2222
  UserKnownHostsFile /dev/null
  StrictHostKeyChecking no
  PasswordAuthentication no
  IdentityFile C:/projects/vagrant-dev/.vagrant/machines/default/virtualbox/private_key
  IdentitiesOnly yes
  LogLevel FATAL
```

4. Copy the result and paste it into the `.ssh/config` file located in your home folder. At this point, you can rename the `Host default` to something more descriptive like `Host Vagrant` or `Host vagrant-dev`.

5. Next, install the VSCode extension `Remote-SSH`.

6. Next, click on the small green box in the lower left corner of VSCode and select `Remote-ssh: Open configuration file` from the dropdown box that appears at the top of the window. Select the `.ssh/config` file.

7. Finally, click on the `Remote Explorer` icon on the left side of the window, right-click on the new SSH target and select your preferred method of connection.
