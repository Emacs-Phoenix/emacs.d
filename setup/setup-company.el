(require 'company)
(require 'company-yasnippet)
(require 'company-capf)
(require 'company-keywords)
(require 'company-abbrev)
;;(require 'company-etags) ;; TODO 启动卡
(require 'company-jedi)
(require 'company-web-html)
(require 'company-quickhelp)

(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)
(setq company-auto-complete t)
(setq company-require-match nil)

(add-hook 'css-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends) '(company-css))))



(add-to-list 'company-backends 'company-tern)
(setq company-tern-property-marker "")

;; (setq company-backends '(company-elisp
;;                          company-nxml
;;                          company-css
;;                          company-semantic
;;                          company-clang
;;                          company-eclim
;;                          company-xcode
;;                          company-ropemacs
;;                          (company-gtags company-etags company-keywords)
;;                          company-oddmuse
;;                          company-files
;;                          company-tern
;;                          company-web-html))

(defun company-predictive (command &optional arg &rest ignored)
  (case command
    (prefix (let* ((text (downcase (word-at-point))))
              (set-text-properties 0 (length text) nil text)
              text))
    (candidates (predictive-complete arg))))

;;(set (make-local-variable 'company-backends) '(company-predictive))


(define-key company-active-map (kbd "\C-n") 'company-select-next)
(define-key company-active-map (kbd "\C-p") 'company-select-previous)
(define-key company-active-map (kbd "\C-d") 'company-show-doc-buffer)
(define-key company-active-map (kbd "<tab>") 'company-complete)
(define-key company-active-map (kbd "<return>") nil)


;; --------------------- yas ---------------------
(setq company-mode/enable-yas t)

(defun company-mode/backend-with-yas (backend)
  (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
      backend
    (append (if (consp backend) backend (list backend))
            '(:with company-yasnippet))))

(setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))





;;-----------python------------------------
(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)



(with-eval-after-load 'company
  (setq company-auto-complete nil)
  (define-key company-active-map (kbd "<return>") nil)
  (define-key company-active-map (kbd "RET") nil))


(add-hook 'after-init-hook 'global-company-mode)

(provide 'setup-company)
