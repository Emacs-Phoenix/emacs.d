#[Emacs-Phoenix](https://github.com/Emacs-Phoenix)

![emacs](https://raw.githubusercontent.com/Emacs-Phoenix/emacs.d/master/icon/emacs.png)

##setup

#####build emacs (recommanded)
- ubuntu
`sudo aptitude install build-essential libxpm-dev libgif-dev libtiff-dev libjpeg-dev libgtk2.0-dev libdbus-1-dev texinfo`
`./configure --with-x-toolkit --with-xft`
`make bootstrap`
or 'make all'


#####clone
git clone --recursive git@github.com:Emacs-Phoenix/emacs.d.git .emacs.d

#####plugin
- pyemacs
cd plugin/pymacs && make check && sudo make install

- slime
`cd lisp-site/slime`
`make`

#####npm
NOTICE: `nvm use system`
- npm install -g js-beatutify jshint jshinter tern

#####compile
- cd site-lisp/helm && make

- ggtags

#####python
- pip install rope
- pip install jedi
- pip install flake8
- pip install importmagic
- pip install autopep8
- pip install rope ropemacs
- pip install wakatime

#####node
- npm install jshint -g

#####evernote
gem install evernote_oauth
cd evernote-mode/ruby
ruby setup.rb


##### misc
`brew install bash-completion`


