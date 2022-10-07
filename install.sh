#!/bin/bash

echo '
                                            @
                                        @@@@@@@@@
                                    .@@@@@@@@@@@@@@@@@
                                ,@@@@@@@@@@@@@@@@@@@@@@@@@,
                            (@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*
                        @@@@@@@@@@@@@@(        .@@@@@@@@@@@@@@@@@@@
                    @@@@@@@@@@@@@                  ,@@@@@@@@@@@@@@@@@@@
                @@@@@@@@@@@@@#     @@          @@(   @@@@@@@@@@@@@@@@@@@@@@
          #@@@@@@@@@@@@@@@       @@@,      @@@.     @@@@@@@@@@@@@@@@@@@@@@@@@@
      &@@@@@@@@@@@@@@@@@@       .@@ @@@@@@@.        @@@@@@@@@@@@@@@@@@@@@@@@%
  @@@@@@@@@@@@@@@@@@@@@@        @@   @@@,&@@@&     @@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@*        @@@@@(           @@@@@@@@@@@@@@@@@@@@   *@ @@@@
@@@  @@@@@@@@@@@@@@@@@@@@       (@@@           .@@@@@@@@@@@@@@@@@#   &@ @@@,
@@@@@#   &@@@@@@@@@@@@@@@@*                 @@@@@@@@@@@@@@@@@,   @@,@@@
    @@@/@@   /@@@@@@@@@@@@@@@@@,    ./@@@@@@@@@@@@@@@@@@@    @%%@@@
        @@@&%@    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   .@*@@@&
            &@@@*@,   @@@@@@@@@@@@@@@@@@@@@@@@@@%   (@ @@@#
                /@@@ @#   %@@@@@@@@@@@@@@@@@/   &@,@@@(
                    @@@*@@   *@@@@@@@@@.   @&(@@@
                        @@@##@    @    @/%@@@
                            @@@&,@(@.@@@@
                                /@@@.
'

# Install and configure the default playbook on the local machine.
echo "Updating the local machine..."
apt update -y
apt install software-properties-common -y

# If Python 3 is not installed, install it.
if ! command -v python3 &> /dev/null
then
    echo "Installing Python 3 and pip..."
    apt install python3 python3-pip -y
fi


# Install Ansible.
apt-add-repository --yes --update ppa:ansible/ansible
apt install ansible -y

# To keep the repo clean, I load my defaults from a separate untracked file.
if [ -f ./defaults/.main.yml ]; then
  echo "Overwriting variables with secret defaults..."
  cat ./defaults/.main.yml > ./defaults/main.yml
fi
## In CI, I load from a JSON file loaded in the environment.
if [ -f ./defaults/.main.json ]; then
  echo "Overwriting variables with secret defaults..."
  cat ./defaults/.main.json > ./defaults/main.yml
fi

# Ensure the default variables are set.
if grep -q "John Doe" defaults/main.yml; then
    echo "Please update the defaults/main.yml file with your own information."
    echo "You may also provide a .main.yml file in the defaults directory."
    exit 1
fi


echo "Install Ansible Galaxy requirements"
ansible-galaxy install -r requirements.yml

echo "Running playbook"
ansible-playbook ./linux-dev.yml --extra-vars "@./defaults/main.yml"