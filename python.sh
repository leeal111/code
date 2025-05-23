#!/bin/bash
curl -LO https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b
rm Miniconda3-latest-Linux-x86_64.sh
echo -e "\nexport PATH=~/miniconda3/bin:\$PATH" >>~/.bashrc
. ~/.bashrc && conda init
