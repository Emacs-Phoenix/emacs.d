(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;;去除初始化页面
(setq inhibit-startup-message t)

(setq initial-scratch-message (with-temp-buffer
                                (insert-file-contents "~/.emacs.d/misc/doge.ascii")
                                (buffer-string)))

;;初始化透明度
(set-frame-parameter (selected-frame) 'alpha '(92 92))

;;操作不阻塞显示
(setq redisplay-dont-pause t)


;;高亮当前行
(global-hl-line-mode 1)

(setq custom-theme-directory (concat user-emacs-directory "themes"))

(dolist
    (path (directory-files custom-theme-directory t "\\w+"))
  (when (file-directory-p path)
    (add-to-list 'custom-theme-load-path path)))


(show-paren-mode 1)

(defmacro rename-modeline (package-name mode new-name)
  `(eval-after-load ,package-name
     '(defadvice ,mode (after rename-modeline activate)
        (setq mode-name ,new-name))))

(rename-modeline "js2-mode" js2-mode "JS2")
(rename-modeline "clojure-mode" clojure-mode "CLJ")
(rename-modeline "cider-mode" cider-mode "CLJ")
;;(rename-modeline "Projectile" projectile-mode "ⓟ")
(rename-modeline "Emacs-Lisp" emacs-lisp-mode "ⓔ")
;;????为毛remap到第一个
;;(rename-modeline "Paredit" paredit-mode "( ˘ ³˘)❤")

(setq powerline-arrow-shape 'curve)

(provide 'appearance)

