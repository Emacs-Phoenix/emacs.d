;;加载各种文件夹

(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

(setq setup-dir 
      (expand-file-name "setup" user-emacs-directory))

(setq setting-dir
      (expand-file-name "setting" user-emacs-directory))

(setq lib-dir
      (expand-file-name "lib" user-emacs-directory))


(add-to-list 'load-path site-lisp-dir)
(add-to-list 'load-path setup-dir)

(add-to-list 'load-path setting-dir)
(add-to-list 'load-path lib-dir)

;; Add external projects to load path
(dolist (project (directory-files site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; (autoload 'esup "esup" "Emacs Start Up Profiler." nil)

;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

(require 'lib)
(require 'component)

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(require 'server)
(unless (server-running-p)
  (server-start))

;;FIXME
(auto-save-mode -1)
;;81826f1e4ac636c739c539aa138a6026d3df286f

(require 'auto-compile)
(auto-compile-on-load-mode)
(auto-compile-on-save-mode)

(byte-recompile-directory (expand-file-name "~/.emacs.d") 0)

(defalias 'helm-buffer-match-major-mode 'helm-buffers-list--match-fn)

