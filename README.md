# Ansible Magic Shellbook

![CircleCI](https://img.shields.io/circleci/build/gh/KyleTryon/Ansible-Magic-Shellbook/main?logo=circleci)

My personal collection of Ansible playbooks and roles for setting up my personal development machines.

<details>
  <summary>ASCII Art</summary>

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

| Shell                 | Languages    | Core Utilities | More       |
| --------------------- | ------------ | -------------- | ---------- |
| ZSH (default)         | Python       | Bat            | Bats       |
| Oh-My-ZSH             | NodeJS (nvm) | Exa            | ShellCheck |
| Powerlevel10K         | Go           | Fzf            | JQ         |
| Additional Plugins... |              | Lunarvim       | YQ         |
|                       |              | Tmux           | Dasel      |
|                       |              | Btop           |            |
|                       |              | More...        |

### Dotfiles

This repo _requires_ provided dotfiles to be present. See the accompanying [dotfiles repo](https://github.com/KyleTryon/.dotfiles).

To modify, fork the dotfiles repo and update the `/defaults/main.yml` file to change the value of `dotfile_repo`.