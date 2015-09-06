(require 'company)

(add-hook 'after-init-hook 'global-company-mode)

(add-to-list 'company-backends 'company-web-html)

(add-to-list 'company-backends 'company-tern)  
;;(global-set-key "C-." 'company-complete-common)
(setq company-idle-delay 0)

(require 'color)

;; (let ((bg (face-attribute 'default :background)))
;;   (custom-set-faces
;;    `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 2)))))
;;    `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
;;    `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
;;    `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
;;    `(company-tooltip-common ((t (:inherit font-lock-constant-face))))))

(setq company-minimum-prefix-length 1)
(setq company-idle-delay 0.25)
(setq company-auto-complete t)

(add-hook 'after-init-hook 'global-company-mode)
(define-key company-mode-map (kbd "C-n") 'company-select-next)
(define-key company-mode-map (kbd "C-p") 'company-select-previous)
;;-----------python------------------------
(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)
;;------------------------------------------


;;-------------------------THEMES-------------------
;;-----------------------------------------------

(provide 'setup-company)
