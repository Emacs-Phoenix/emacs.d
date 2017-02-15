;; TODO module it
(require 'package)
(setq package-list '(js2-mode js2-refactor web-mode hungry-delete helm-swoop
                              haskell-mode elfeed imenu-anywhere emmet-mode
                              guide-key dumb-jump clojure-mode powerline
                              ido-ubiquitous magit coffee-mode))

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

(setq initial-frame-alist
      '(
        (width . 170) ; character
        (height . 58) ; lines
        ))

;; default/sebsequent window
;; (setq default-frame-alist
;;       '(
;;         (width . 100) ; character
;;         (height . 52) ; lines
;;         ))


(load "~/.emacs.d/phoenix-init.el")

;; (setq user-emacs-directory "~/.spacemacs.d/")
;; (load "~/.spacemacs.d/init.el")

;;(set-face-attribute 'default nil :height 120)
(setq warning-minimum-level :emergency)

(load-theme 'monokai t)

;; TODO module it
(add-hook 'before-save-hook
          'delete-trailing-whitespace)
