# Intended to be run as a standalone script (i.e. in current directory)
SCRIPTDIR=.
VIMDIR=~/.vim

############################################
# Install Basic Vim
#############################################
sudo apt-get --assume-yes install vim

# Just in case it doesn't exist
mkdir $VIMDIR

sudo chown -R $(who am i | awk '{print $1}'):$(who am i | awk '{print $1}') .vim

# Set default editor to vim
export VISUAL=vim
export EDITOR="$VISUAL"

 #Add base vimrc
cp $SCRIPTDIR/.myvimrc ~/.vimrc

# Download and install molakai theme
mkdir $VIMDIR/colors
git clone https://github.com/tomasr/molokai.git $VIMDIR/colors/molokai
cp $VIMDIR/colors/molokai/colors/molokai.vim $VIMDIR/colors/molokai.vim

