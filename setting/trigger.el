
;;(sublimity-mode 1)


;; mac 下关掉 scroll 会更好
;;(smooth-scroll-mode t)


;; (setq sublimity-scroll-weight 6
;;     sublimity-scroll-drift-length 4)




;;(global-highlight-changes-mode 1)

;;(helm-mode 1)



;;操
;;(indent-guide-global-mode)

;;貌似不支持linux
;;(eval (list (nyan-create)))

;; Highlight escape sequences
;; 高亮转义嘛
;; (hes-mode)
;; (put 'font-lock-regexp-grouping-backslash 'face-alias 'font-lock-builtin-face)

;;tiny graphical system monitor
;;(symon-mode);;影响minibuffer显示


;;linum-mode
;;(global-linum-mode 1) ;;这他妈linum和sublime那个小窗不能共存
;;linum-mode 开了滚动有点卡，还是不开为妙

;; (add-hook 'js2-mode-hook 'turn-on-setnu-mode)
;; (add-hook 'emacs-lisp-mode-hook 'turn-on-setnu-mode)
;; (add-hook 'html-mode-hook 'turn-on-setnu-mode)
;; (add-hook 'web-mode-hook 'turn-on-setnu-mode)
;; (add-hook 'python-mode-hook 'turn-on-setnu-mode)
;; (add-hook 'css-mode-hook 'turn-on-setnu-mode)


;;View Large Files in Emacs
;; (custom-set-variables
;;  '(vlf-application 'dont-ask))








(which-function-mode 1)

(require 'beacon)
(beacon-mode 1)

(global-whitespace-mode)


(provide 'trigger)
