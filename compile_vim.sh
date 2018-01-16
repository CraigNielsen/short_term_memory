sudo dpkg -r vim
cd $HOME/git_repos/vim/src
./configure --enable-python3interp --with-features=huge --with-python3-config-dir=~/.pyenv/versions/3.6.2/lib/python3.6/config-3.6m-x86_64-linux-gnu
make
cd ..
sudo checkinstall
