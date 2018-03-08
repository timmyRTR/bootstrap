This is a shell script to get some of the initial setup of homebrew, Chrome, Slack, and other packages going on your MacOS machine. This relies heavily on Jeff Geerling's Ansible playbook featured here: https://github.com/geerlingguy/mac-dev-playbook



1. Clone the repo: 

```git clone git@github.com:RentTheRunway/developer-bootstrap.git```

2. Make any necessary additions to `mac-config.yml`

3. Run the shell script -- all password prompts will be for your local sudoer password. 

```cd {directory_you_cloned_to}
./mac-os-first-install.sh
```

4. If you need to make modifications and re-run, you'll need to go to `$HOME/git/mac-dev-playbook`, update `config.yml`, and re-run the playbook:

```
ansible-playbook main.yml -i inventory -K
```
