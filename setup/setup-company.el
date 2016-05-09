(require 'company)
(require 'company-yasnippet)
(require 'company-capf)
(require 'company-keywords)
(require 'company-abbrev)
;;(require 'company-etags) ;; TODO 启动卡
(require 'company-jedi)
(require 'company-web-html)
(require 'company-quickhelp)

(add-to-list 'load-path (expand-file-name "site-lisp/know-your-http-well/emacs/" user-emacs-directory))
(load
 (expand-file-name "site-lisp/know-your-http-well/emacs/know-your-http-well.el" user-emacs-directory))
(require 'company-restclient)

(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)
(setq company-auto-complete t)
(setq company-require-match nil)



;; -------- css
(add-hook 'css-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends) '(company-css))))


; ----- restclient
(add-to-list 'company-backends 'company-restclient)


;; --------- js2
(require 'jquery-doc)
;; (add-hook 'js2-mode-hook (lambda ()
;;                            (add-to-list 'company-backends 'company-jquery)))

;; (require 'jquery-doc)
;; (add-hook 'js2-mode-hook 'jquery-doc-setup)

(add-to-list 'company-backends 'company-tern)

(setq company-tern-property-marker "")

;; ----- predictive

(defun company-predictive (command &optional arg &rest ignored)
  (case command
    (prefix (let* ((text (downcase (word-at-point))))
              (set-text-properties 0 (length text) nil text)
              text))
    (candidates (predictive-complete arg))))

(set (make-local-variable 'company-backends) '(company-predictive))


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


;; --- text-mode
(defun text-mode-hook-setup ()
  ;; make `company-backends' local is critcal
  ;; or else, you will have completion in every major mode, that's very annoying!
  (make-local-variable 'company-backends)

  ;; company-ispell is the plugin to complete words
  (add-to-list 'company-backends 'company-ispell)

  ;; OPTIONAL, if `company-ispell-dictionary' is nil, `ispell-complete-word-dict' is used
  ;;  but I prefer hard code the dictionary path. That's more portable.
  (setq company-ispell-dictionary (file-truename "~/.emacs.d/misc/english-words.txt")))

(add-hook 'text-mode-hook 'text-mode-hook-setup)

(defun toggle-company-ispell ()
  (interactive)
  (cond
   ((memq 'company-ispell company-backends)
    (setq company-backends (delete 'company-ispell company-backends))
    (message "company-ispell disabled"))
   (t
    (add-to-list 'company-backends 'company-ispell)
    (message "company-ispell enabled!"))))



(with-eval-after-load 'company
  (setq company-auto-complete nil)
  (define-key company-active-map (kbd "<return>") nil)
  (define-key company-active-map (kbd "RET") nil))



;; Don't enable company-mode in below major modes
(global-company-mode)
(setq company-global-modes
      '(not
        term-mode
        html-mode
        eshell-mode
        comint-mode
        erc-mode
        rcirc-mode
        org-mode))
;;(add-hook 'after-init-hook 'global-company-mode)

(provide 'setup-company)
