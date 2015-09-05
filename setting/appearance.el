(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;;去除初始化页面
(setq inhibit-startup-message t)

(setq initial-scratch-message (with-temp-buffer
                                (insert-file-contents "~/.emacs.d/misc/doge.ascii")
                                (buffer-string)))

(set-frame-parameter (selected-frame) 'alpha '(85 85))


(global-hl-line-mode 1)

(setq custom-theme-directory (concat user-emacs-directory "themes"))

(dolist
    (path (directory-files custom-theme-directory t "\\w+"))
  (when (file-directory-p path)
    (add-to-list 'custom-theme-load-path path)))

(show-paren-mode 1)

(provide 'appearance)

