#[Emacs-Phoenix](https://github.com/Emacs-Phoenix)
![emacs](https://raw.githubusercontent.com/Emacs-Phoenix/emacs.d/master/icon/emacs.png)

##setup
#####clone
git clone --recursive git@github.com:Emacs-Phoenix/emacs.d.git .emacs.d

#####plugin
- pyemacs
cd plugin/pymacs && make check && sudo make install

- slime
`cd lisp-site/slime`
`make`

#####npm 
- npm install -g js-beatutify jshint tern

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
