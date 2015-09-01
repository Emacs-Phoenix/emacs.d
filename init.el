(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;;去除初始化页面
(setq inhibit-startup-message t)

;;记载各种文件夹
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

;;主要是自己写的小组建
(setq component-dir
      (expand-file-name "component" user-emacs-directory))

(setq setting-dir
      (expand-file-name "setting" user-emacs-directory))

