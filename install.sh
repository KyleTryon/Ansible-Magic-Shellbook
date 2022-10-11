#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

while [ "$#" -gt 0 ]; do
case "$1" in
    --personal)
    ARGS_PERSONAL=1
    ;;
esac
shift
done


function print_ascii_art() {
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
}

function prep_machine() {

    # Install and configure the default playbook on the local machine.
    echo "Updating the local machine..."
    apt update -y
    apt install software-properties-common -y

    # If Python 3 is not installed, install it.
    if ! command -v python3 &>/dev/null; then
        echo "Installing Python 3 and pip..."
        apt install python3 python3-pip python3-venv -y
    fi

    # Install Ansible.
    apt-add-repository --yes --update ppa:ansible/ansible
    apt install ansible -y
}

function prep_playbook() {
    # To keep the repo clean, I load my defaults from a separate untracked file.
    if [ -f ./defaults/.main.yml ]; then
        echo "Overwriting variables with secret defaults..."
        cat ./defaults/.main.yml >./defaults/main.yml
    fi
    ## In CI, I load from a JSON file loaded in the environment.
    if [ -f ./defaults/.main.json ]; then
        echo "Overwriting variables with secret defaults..."
        cat ./defaults/.main.json >./defaults/main.yml
    fi

    # Ensure the default variables are set.
    if grep -q "John Doe" defaults/main.yml; then
        echo "Please update the defaults/main.yml file with your own information."
        echo "You may also provide a .main.yml file in the defaults directory."
        exit 1
    fi

    if [ ! "$ARGS_PERSONAL" = "1" ]; then
        if grep -q "KyleTryon/.dotfiles" defaults/main.yml; then
            echo "ERROR: You must FORK and modify your own personal dotfiles repo."
            echo
            echo "  Step 1: Fork this repo to your own account:"
            echo "    https://github.com/KyleTryon/.dotfiles"
            echo
            echo "  Step 2: Update the 'dotfile_repo' value in defaults/main.yml file with your own repo."
            exit 1
        fi
    fi
}

function run_playbook() {
    echo "Install Ansible Galaxy requirements"
    ansible-galaxy install -r requirements.yml

    echo "Running playbook"
    ansible-playbook ./linux-dev.yml --extra-vars "@./defaults/main.yml"
}

function main() {
    print_ascii_art
    parse_arguments
    prep_machine
    prep_playbook
    run_playbook
}

main