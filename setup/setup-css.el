
;;(advice-add 'tab-indent-or-complete :before #'pair-jump-or-tab)



(add-hook 'css-mode-hook
          (lambda ()
            (advice-add 'company-complete :after (lambda ()
                                                   (emmet-expand-line nil)))))

(add-hook 'css-mode-hook
          (lambda ()
            (advice-add 'company-complete-selection :after (lambda ()
                                                   (emmet-expand-line nil)))))


(setq css-imenu-generic-expression
      '(
        (nil "\\(^@font-face\\)" 1)
        ;;(nil "\\(^body\\)" 1)
        ;;(nil "\\(^#foo\\)" 1)
        (nil "^ *\\([^ ]+\\) *{ *$" 1)
        (nil "\\(^h[123]\\)" 1)
        ))


(add-hook 'css-mode-hook 
          (lambda ()
            (setq imenu-generic-expression css-imenu-generic-expression)))


(require 'css-eldoc)
(autoload 'turn-on-css-eldoc "css-eldoc")
(add-hook 'css-mode-hook 'turn-on-css-eldoc)
(turn-on-css-eldoc)


;; (defun maybe-flymake-css-load ()
;;   "Activate flymake-css as necessary, but not in derived modes."
;;   (when (eq major-mode 'css-mode)
;;     (flymake-css-load)))

;; (defun my-css-imenu-make-index ()
;;   (save-excursion
;;     (imenu--generic-function '((nil "^ *\\([^ ]+\\) *{ *$" 1)
;;                                ))))
;; (add-hook 'css-mode-hook
;;           (lambda ()
;;             (unless (is-buffer-file-temp)
;;               (setq imenu-create-index-function 'my-css-imenu-make-index)
;;               (maybe-flymake-css-load))))

;; (add-hook 'scss-mode-hook
;;           (lambda ()
;;             (unless (is-buffer-file-temp)
;;               (setq imenu-create-index-function 'my-css-imenu-make-index)
;;               (flymake-sass-load))))

(provide 'setup-css)
