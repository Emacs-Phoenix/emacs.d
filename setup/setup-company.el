(require 'company)
(require 'company-yasnippet)
(require 'company-keywords)
(require 'company-css)
;; (require 'company-abbrev)

(setq company-idle-delay 0)
;; (setq company-minimum-prefix-length 1)
(setq company-auto-complete t)
;; (setq company-require-match nil)
;; (setq company-transformers '(company-sort-by-occurrence))
(setq company-quickhelp-delay 0.5)
(setq company-dabbrev-downcase nil)

(define-key company-active-map (kbd "\C-n") 'company-select-next)
(define-key company-active-map (kbd "\C-p") 'company-select-previous)
(define-key company-active-map (kbd "\C-d") 'company-show-doc-buffer)
(define-key company-active-map (kbd "<tab>") 'company-complete)
(define-key company-active-map (kbd "<return>") 'company-complete)

;;(setq company-dabbrev-downcase nil)

;; --- text-mode
(defun text-mode-hook-setup ()
  (make-local-variable 'company-backends)
  (add-to-list 'company-backends 'company-ispell)
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
        markdown-mode
        html-mode
        magit-mode
        org-mode))

(add-to-list 'company-backends 'company-tern)

(provide 'setup-company)
