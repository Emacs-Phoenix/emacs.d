;;记载各种文件夹
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

;;主要是自己写的小hack
(setq ehack-dir 
      (expand-file-name "ehack" user-emacs-directory))

(setq setting-dir
      (expand-file-name "setting" user-emacs-directory))

(setq lib-dir
      (expand-file-name "lib" user-emacs-directory))


(add-to-list 'load-path site-lisp-dir)
(add-to-list 'load-path ehack-dir) 
(add-to-list 'load-path setting-dir)
(add-to-list 'load-path lib-dir)

;; Add external projects to load path
(dolist (project (directory-files site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

(require 'lib)
(require 'appearance)
(require 'component)

