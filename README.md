# Ansible Magic Shellbook

![CircleCI](https://img.shields.io/circleci/build/gh/KyleTryon/Ansible-Magic-Shellbook/main)

My personal collection of Ansible playbooks and roles for setting up my personal development machines.

<details>
  <summary>ASCII Art (desktop only)</summary>

```text
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

```

</details>

## Overview

### Shell

- ZSH default shell
- Oh My ZSH
- Powerlevel10k
- Addtional plugins...

### Languages

- Python
- NodeJS
- Go

### Core utilities

- Bat
- Bats
- Exa
- Fzf
- Git
- Neovim
- Shellcheck
- Tmux
- Many more...

### Dotfiles

This repo _requires_ provided dotfiles to be present. See the accompanying [dotfiles repo](https://github.com/KyleTryon/.dotfiles).

To modify, fork the dotfiles repo and update the `/defaults/main.yml` file to change the value of `dotfile_repo`.