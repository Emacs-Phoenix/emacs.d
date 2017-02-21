(setq mouse-wheel-scroll-amount '(1 ((shift) . 2))) ;; one linew at a time

(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling

(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

(setq scroll-step 1) ;; keyboard scroll one line at a time

;; Run at full power please
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; Answering just 'y' or 'n' will do
;;(defalias 'yes-or-no-p 'y-or-n-p)
;; (defun my-yes-or-mumble-p (prompt)
;;   "PROMPT user with a yes-or-no question, but only test for yes."
;;   (if (string= "y"
;;                (downcase
;;                 (read-from-minibuffer
;;                  (concat prompt "(y or n) "))))
;;       t
;;     nil))

;;(defalias 'yes-or-no-p 'my-yes-or-mumble-p)


;;hightlist TODO FIXME keyword
(fixme-mode 1)
;; (diminish 'fixme-mode)
;; (diminish 'paredit-mode)
;; (diminish 'emmet-mode)
;; (diminish 'anzu-mode)
;; (diminish 'tagedit-mode)
;; (diminish 'aggressive-indent-mode)
;; (diminish 'auto-highlight-symbol-mode)

;;解决有时候鼠标选不中的问题，来自李杀的教导
(transient-mark-mode 1)
(delete-selection-mode 1)

;;碰顶的响声
(setq ring-bell-function #'ignore)

(setq redisplay-dont-pause t)

(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

(setq scroll-conservatively 10)
(setq scroll-margin 7)

;;尼玛，索性不要鼠标滚动算了
;;(mouse-wheel-mode -1)

;;尼玛，全面禁止鼠标操作 2015-11-19
;; (dolist (k '([mouse-1] [down-mouse-1] [drag-mouse-1] [double-mouse-1] [triple-mouse-1]
;;              [mouse-2] [down-mouse-2] [drag-mouse-2] [double-mouse-2] [triple-mouse-2]
;;              [mouse-3] [down-mouse-3] [drag-mouse-3] [double-mouse-3] [triple-mouse-3]
;;              [mouse-4] [down-mouse-4] [drag-mouse-4] [double-mouse-4] [triple-mouse-4]
;;              [mouse-5] [down-mouse-5] [drag-mouse-5] [double-mouse-5] [triple-mouse-5]
;;              [mouse-6] [down-mouse-6] [drag-mouse-6] [double-mouse-6] [triple-mouse-6]
;;              [mouse-7] [down-mouse-7] [drag-mouse-7] [double-mouse-7] [triple-mouse-7]
;;              [double-wheel-down] [double-wheel-left] [double-wheel-right]
;;              [wheel-down] [wheel-left] [wheel-right] [wheel-up]))
;;   (global-set-key k
                                        ;;                   (λ (message "凡鼠标者，皆为虚妄！"))))


(provide 'behavior)
