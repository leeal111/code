#!/bin/bash
curl -LO https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
zcat < install-tl-unx.tar.gz | tar xf -
rm install-tl-unx.tar.gz
cd install-tl-*
perl ./install-tl --no-interaction
cd ..
export year=$(echo install-tl-* | sed -En '{s/install-tl-([0-9]{4})[0-9]{4}/\1/;p}')
echo -e "\nexport PATH=/usr/local/texlive/'${year}'/bin/x86_64-linux:\$PATH" >> ~/.bashrc
. ~/.bashrc
rm -r install-tl-*