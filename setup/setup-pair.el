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

(provide 'setup-pair)


