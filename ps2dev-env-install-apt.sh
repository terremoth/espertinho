#!/bin/bash
set -euo pipefail

sudo apt install gcc git make texinfo wget gettext libgsl-dev flex bison libgmp-dev zlib1g libmpfr-dev libmpfi0 libmpc-dev -y

echo export PS2DEV=/usr/local/ps2dev >> ~/.bashrc
echo export PS2SDK=$PS2DEV/ps2sdk >> ~/.bashrc
echo export GSKIT=$PS2DEV/gsKit >> ~/.bashrc
echo export PATH=$PATH:$PS2DEV/bin:$PS2DEV/ee/bin:$PS2DEV/iop/bin:$PS2DEV/dvp/bin:$PS2SDK/bin >> ~/.bashrc

source ~/.bashrc

sudo mkdir -p $PS2DEV
sudo chown -R $USER: $PS2DEV

# after this, you can execute ./build-extra.sh from https://github.com/ps2dev/ps2dev
