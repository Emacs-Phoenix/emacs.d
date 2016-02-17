(require 'company)
(require 'company-yasnippet)
(require 'company-capf)
(require 'company-keywords)
(require 'company-abbrev)
(require 'company-etags)

(require 'company-quickhelp)

(company-quickhelp-mode 1)


;; html 与 emment 严重冲突
;;(add-hook 'after-init-hook 'global-company-mode)

(add-hook 'python-mode-hook 'company-mode)
(add-hook 'js2-mode-hook 'company-mode)
(add-hook 'js3-mode-hook 'company-mode)
(add-hook 'go-mode-hook 'company-mode)
(add-hook 'haskell-mode-hook 'company-mode)
(add-hook 'emacs-lisp-mode-hook 'company-mode)
(add-hook 'css-mode-hook 'company-mode)
(add-hook 'scss-mode-hook 'company-mode)
(add-hook 'javascript-mode-hook 'company-mode)
(add-hook 'web-mode-hook 'company-mode)
(add-hook 'typescript-mode-hook 'company-mode)



;;(add-to-list 'company-backends 'company-web-html)

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

(setq company-minimum-prefix-length 2)
(setq company-auto-complete t)

;;(add-hook 'after-init-hook 'global-company-mode)

;;-----------python------------------------
(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)
;;------------------------------------------
(defun company-quick-help-show ()
  (with-no-warnings
    (pos-tip-show (company-fetch-metadata)
                  nil ; standard color
                  nil ; position, default is to start at point
                  nil ; current window
                  300 ; timeout in seconds
                  80 ; max width
                  nil ; calculate coordindates of frame
                  (+ 200 ; dx offset
                     (overlay-get company-pseudo-tooltip-overlay 'company-width))
                  nil )))

(define-key company-active-map (kbd "\C-n") 'company-select-next)
(define-key company-active-map (kbd "\C-p") 'company-select-previous)
(define-key company-active-map (kbd "\C-d") 'company-show-doc-buffer)
(define-key company-active-map (kbd "<tab>") 'company-complete)

(define-key company-active-map (kbd "<return>") nil)
;; (define-key company-active-map (kbd "SPC") nil)
;; (define-key company-active-map (kbd "<space>") nil)

(setq company-auto-complete nil)

(with-eval-after-load 'company
  (setq company-auto-complete nil)
  (define-key company-active-map (kbd "<return>") nil)
  (define-key company-active-map (kbd ".") nil)
  ;; (define-key company-active-map (kbd "SPC") nil)
  ;; (define-key company-active-map (kbd "spc") nil)
  ;; (define-key company-active-map (kbd "<space>") nil)
  ;; (define-key company-active-map (kbd "<SPACE>") nil)
  (define-key company-active-map (kbd "RET") nil))

(defvar company-mode/enable-yas t
  "Enable yasnippet for all backends.")

(defun company-mode/backend-with-yas (backend)
  (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
      backend
    (append (if (consp backend) backend (list backend))
            '(:with company-yasnippet))))

(setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))

(provide 'setup-company)
