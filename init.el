;; TODO module it
(require 'package)
(setq package-list
      '(js2-mode js2-refactor jquery-doc web-mode scss-mode sass-mode emmet-mode web less-css-mode css-eldoc tern tern-auto-complete
                 clojure-mode clj-refactor clojure-mode-extra-font-locking
                 tss
                 haskell-mode coffee-mode
                 yaml-mode haml-mode nginx-mode
                 swift-mode
                 elpy pythonic jedi
                 nyan-mode
                 ido-vertical-mode ido-ubiquitous smartparens tagedit ace-jump-mode avy
                 hungry-delete expand-region whitespace-cleanup-mode
                 helm-swoop helm helm-dash helm-ack helm-ag full-ack helm-ag
                 dumb-jump ace-jump-mode
                 company company-web company-jedi
                 projectile ibuffer-projectile
                 magit git-gutter
                 window-numbering aggressive-indent guide-key powerline tabbar neotree bm
                 elfeed imenu-anywhere flycheck ido-hacks idomenu windresize fixmee
                 vimish-fold ido-vertical-mode restclient ido-at-point flx spaceline
                 highlight-symbol reveal-in-osx-finder redo+ undo-tree anzu showkey bash-completion sublimity markdown-mode
                 which-key rainbow-mode rainbow-delimiters visual-regexp
                 smex slime paredit paredit-everywhere
                 ))

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; -----------------------------------------

(setq initial-frame-alist '((width . 170) (height . 58)))

(load "~/.emacs.d/phoenix-init.el")

;; (setq user-emacs-directory "~/.spacemacs.d/")
;; (load "~/.spacemacs.d/init.el")

;; (set-face-attribute 'default nil :height 120)
(setq warning-minimum-level :emergency)

(load-theme 'monokai t)

;; TODO module it
(add-hook 'before-save-hook
          'delete-trailing-whitespace)
