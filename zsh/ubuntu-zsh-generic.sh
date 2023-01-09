########################################
# Install oh-my-zsh
# @see (manual installation) https://github.com/robbyrussell/oh-my-zsh
# @see (manual installation) https://github.com/ohmyzsh/ohmyzsh
########################################

echo "Installing ZSH"
sudo apt --assume-yes install zsh

echo "Installing Oh My Zsh"

# Ensure path variables are configured correctly
if [ ! -n "$ZSH" ]; then
    ZSH=~/.oh-my-zsh
fi

git clone https://github.com/ohmyzsh/ohmyzsh.git $ZSH

# Create a new zsh config file by copying the supplied template
cp $ZSH/templates/zshrc.zsh-template ~/.zshrc

#sed "/^export ZSH=/ c\\
#export ZSH=$ZSH
#" ~/.zshrc > ~/.zshrc-omztemp
#mv -f ~/.zshrc-omztemp ~/.zshrc

# make default shell (applied next login)
sudo usermod -s $(which zsh) $(who am i | awk '{print $1}')

# Add custom prompt
echo "Installing custom ZSH theme"
sed -i 's/ZSH_THEME.*/ZSH_THEME="bensullivan"/g' ~/.zshrc
cp ~/.oh-my-zsh/themes/agnoster.zsh-theme ~/.oh-my-zsh/themes/bensullivan.zsh-theme
sed -i 's/prompt_segment blue/prompt_segment yellow/g' ~/.oh-my-zsh/themes/bensullivan.zsh-theme

# download custom directory colours
git clone https://github.com/huyz/dircolors-solarized.git ~/.dircolors
sed -i '$a eval `dircolors ~/.dircolors/dircolors.256dark`' ~/.zshrc

# required for the aggnoster theme
sudo apt --assume-yes install fonts-powerline
