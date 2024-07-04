#######################################################################################
###############  Debian: Download latest Emacs package ################################
###############  Compile the source code into binary   ################################
###############  Install compile Emacs binary          ################################
#######################################################################################

# Get the latest GNU Emacs from repository
git clone git://git.savannah.gnu.org/emacs.git ./emacs

cd emacs

git pull

sudo apt update
sudo apt install -y autoconf make gcc texinfo libgtk-3-dev libxpm-dev \
     libjpeg-dev libgif-dev libtiff5-dev libgnutls28-dev libncurses5-dev \
     libjansson-dev libharfbuzz-dev libharfbuzz-bin imagemagick libmagickwand-dev libgccjit-10-dev libgccjit0 gcc-10 libjansson4 libjansson-dev xaw3dg-dev texinfo libx11-dev

export CC="gcc-10"

./autogen.sh

./configure --with-native-compilation=aot -with-json --with-modules --with-harfbuzz --with-compress-install \
   --with-threads --with-included-regex --with-x-toolkit=lucid --with-zlib --with-jpeg --with-png --with-imagemagick --with-tiff --with-xpm --with-gnutls \
   --with-xft --with-xml2 --with-mailutils --with-tree-sitter

make -j 8
sudo make install
