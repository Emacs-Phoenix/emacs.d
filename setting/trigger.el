(eyebrowse-mode t)

(sublimity-mode 1)
;;(setq sublimity-scroll-weight 6
;;     sublimity-scroll-drift-length 4)


(global-undo-tree-mode 1)

(global-highlight-changes-mode 1)

;;(helm-mode 1)

(dired-async-mode 1)

;;操
;;(indent-guide-global-mode)

;;rainbow cat
;;貌似不支持linux
;;(eval (list (nyan-create)))

;; Highlight escape sequences
(hes-mode)
(put 'font-lock-regexp-grouping-backslash 'face-alias 'font-lock-builtin-face)

;;save undo out of box
(add-to-list 'desktop-locals-to-save 'buffer-undo-list)


;;tiny graphical system monitor
(symon-mode)

(hungry-keyboard global-map)

;;linum-mode
;;(global-linum-mode 1) ;;这他妈linum和sublime那个小窗不能共存
;;linum-mode 开了滚动有点卡，还是不开为妙

(add-hook 'js2-mode-hook 'turn-on-setnu-mode)
(add-hook 'emacs-lisp-mode-hook 'turn-on-setnu-mode)
(add-hook 'html-mode-hook 'turn-on-setnu-mode)
(add-hook 'web-mode-hook 'turn-on-setnu-mode)
(add-hook 'python-mode-hook 'turn-on-setnu-mode)
(add-hook 'css-mode-hook 'turn-on-setnu-mode)

;;Visual Bookmarks
(global-set-key (kbd "<C-f2>") 'bm-toggle)
(global-set-key (kbd "<f2>")   'bm-next)
(global-set-key (kbd "<S-f2>") 'bm-previous)
(global-set-key (kbd "<left-fringe> <mouse-5>") 'bm-next-mouse)
(global-set-key (kbd "<left-fringe> <mouse-4>") 'bm-previous-mouse)
(global-set-key (kbd "<left-fringe> <mouse-1>") 'bm-toggle-mouse)

;;View Large Files in Emacs
(custom-set-variables
 '(vlf-application 'dont-ask))

(provide 'trigger)
