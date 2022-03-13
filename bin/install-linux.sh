#########################################
# Install packages
#########################################

sudo apt install git git-core zsh curl build-essential cmake python-dev python3-dev
sudo apt install apt-transport-https
sudo apt install sqlite3 tmux exuberant-ctags vim vim-gtk3 nmap
sudo apt install ubuntu-restricted-extras gnome-tweak-tool
sudo apt install fonts-powerline virtualbox
sudo apt install fasd zeal
sudo apt install unrar

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
sudo apt install curl
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update
sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn

sudo apt install tracker
sudo apt install ttf-mscorefonts-installer

# Snaps

snap install --classic go
sudo snap install rubymine --classic
sudo snap install slack --classic
sudo snap install spotify

# Chrome

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update
sudo apt-get install google-chrome-stable

# copyq

sudo add-apt-repository ppa:hluk/copyq
sudo apt install copyq

# inSync

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ACCAF35C
echo "deb http://apt.insynchq.com/ubuntu bionic non-free contrib" | sudo tee /etc/apt/sources.list.d/insync.list
sudo apt update
sudo apt install insync

# Node
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn

# Postgresql

# echo deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main | sudo tee /etc/apt/sources.list.d/postgresql.list
# wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
# sudo apt update
# sudo apt install postgresql postgresql-contrib

# vscode

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install code

#########################################
# Setup
#########################################

# gnome

# Larger text
gsettings set org.gnome.desktop.interface text-scaling-factor 1.2

# Ubuntu extends the dock across the screen horz or vert(like Windows). This will mess up hiding the top bar, as the dock will appear under the top bar.
# This makes the dock appear like MacOS dock.
# gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
