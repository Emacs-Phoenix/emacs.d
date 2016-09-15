;; {} 中回车自动缩进
;; (setq electric-pair-pairs '(
;;                             (?\{ . ?\})
;;                             (?\( . ?\))
;;                             (?\[ . ?\])
;;                             ) )
(electric-pair-mode 1)

;;(add-hook 'after-init-hook 'smartparens-global-mode)

;; (add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
;; (add-hook 'lisp-interaction-mode-hook 'smartparens-mode)
;; (add-hook 'lisp-mode-hook 'smartparens-mode)
;; (add-hook 'ielm-mode-hook 'smartparens-mode)

;; (require 'autopair)
;; (autopair-mode 1)

(require 'smartparens-config)
(setq sp-navigate-reindent-after-up nil)
;; (smartparens-global-mode 1)
;; (show-smartparens-global-mode 1)
(add-hook 'emacs-lisp-mode #'smartparens-mode)
(add-hook 'css-mode #'smartparens-mode)

;; pair "`" with "'" in emacs-lisp-mode
(sp-local-pair 'emacs-lisp-mode "`" "'")
;; no '' pair in emacs-lisp-mode
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)

;; don't pair "'" if we're at the end of a word (like when typing an
;; apostrophe)
(sp-pair "'" nil :unless '(sp-point-after-word-p))
(sp-local-pair 'emacs-lisp-mode "`" "'")

(sp-local-pair 'minibuffer-inactive-mode "'" nil :actions nil)



(provide 'setup-pair)


