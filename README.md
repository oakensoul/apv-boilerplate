# apv-boilerplate

This project contains a Vagrant based development environment using
Ansible. As someone who works in all kinds of different development
environments, I hate when they collide with other projects I might be
working on... Here's looking at you Ruby!

This got me into the practice of creating development environments in
VMs and never allowing myself to install them on my MacBook. Less
pollution, less conflict. Well, when I decided to give Ansible a spin,
I decided I wanted to be able to do the same thing. So, I created this
template that I use for any infrastructure project I need to maintain.
I use it as a seed project for every project / infrastructure that I
need to maintain, and then grow it from there.

This project should work successfully on any Linux, Mac or Windows
environment capable of running Vagrant and VirtualBox.

By default, this environment installs the AWS CLI and Boto. If you would
like to change/update/edit what is installed by default as your base
environment, you can either fork/clone the project and edit
`inf/ansible/roles/base/tasks/main.yml`. Or, you can create/modify your
own Box to be used in the Vagrant file and expand upon it.

If you would like to work on creating your own box, I would suggest
looking at the apv-ansible-citadel project that I also have which is
responsible for building the base box that this project uses.

## Usage
Realistically, all you have to do is clone the project and start using
it. Update the Ansible roles for any automated tasks you need.
Ultimately, you should then create a role and put it into the automated
system that creates your boxes for you.

You can use this box as an Ansible box from which you manage your
environment (Ops), or you could simply use it as a jumping off point to
set up a Vagrant for Development... or, you could do both, it's really
up to your needs.

If this doesn't make sense, but you think you want what i'm selling,
just file an issue asking for help, and i'll do the best I can to
assist you.

## Contributing
### Contributing Guidelines
If you would like to contribute to this project, please read the
[Contributing Guidelines](https://github.com/oakensoul/trunk/CONTRIBUTING.md)
documentation.

### Dependencies

To use this development environment, you must have Vagrant and
VirtualBox installed.

We also recommend using the vagrant plugin "vagrant-vbguest" to prevent
the VirtualBox guest additions from getting out of sync.

```bash
$ vagrant plugin install vagrant-vbguest
```

### Vagrant

Once you have the repository cloned, you need only spin up your Vagrant
environment. If you need information about how to use Vagrant, please
see the http://vagrantup.com website. For this documentation, we'll
assume you have at least entry level Vagrant knowledge. If you don't,
feel free to use the Issues section of the repository to ask questions.

In order to get Ansible installed inside the Guest VM, you will notice
inside the Vagrantfile a section using the shell provisioner. In case
you're curious, we've used this approach to install Ansible as provided
by [Rob Allen](https://github.com/akrabat) in his
[blog post](http://akrabat.com/computing/provisioning-with-ansible-within-the-vagrant-guest/)
about such things.

As he mentions, the reason for this is that we don't want to rely on the
Host machine to have Ansible installed, that dirties up your machine
with even more stuff to maintain... and it doesn't follow the
Infrastructure as Code requirement of our team!

One thing to note, your project directory is mapped inside the Guest
VM in the folder `/vagrant`. You can change this by updating the
Vagrantfile to another path, should you so wish.

## Automation and Development

Now that you've got your development environment, simply ssh into the
Guest VM and off you go. To customize your dev environment use the
included Ansible playbooks, or add new roles in the requirements.yml
file. Or, add your own roles. If you've never used Ansible, we would
recommend you pause and run through some internet learning on Ansible.

* http://www.ansible.com/get-started
* http://www.ansible.com/resources
* http://docs.ansible.com/intro_getting_started.html
