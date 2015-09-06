(eyebrowse-mode t)

(sublimity-mode 1)
(setq sublimity-scroll-weight 6
      sublimity-scroll-drift-length 4)

(global-undo-tree-mode 1)

(helm-mode 1)
(dired-async-mode 1)

(indent-guide-global-mode)

;;rainbow cat
;;貌似不支持linux
;;(eval (list (nyan-create)))
;; Highlight escape sequences
(hes-mode)
(put 'font-lock-regexp-grouping-backslash 'face-alias 'font-lock-builtin-face)

(provide 'trigger)
