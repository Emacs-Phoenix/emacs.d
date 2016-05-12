(add-hook 'js2-mode-hook 'auto-highlight-symbol-mode)
;;(add-hook 'html-mode-hook 'auto-highlight-symbol-mode)
;;(add-hook 'web-mode-hook 'auto-highlight-symbol-mode)
(add-hook 'python-mode-hook 'auto-highlight-symbol-mode)
;;(add-hook 'css-mode-hook 'auto-highlight-symbol-mode)
(add-hook 'emacs-lisp-mode-hook 'auto-highlight-symbol-mode)

(advice-add 'highlight-symbol-at-point :before
            (lambda ()
              (message "You can unhighlight by use \"unhighlight-regexp\"")))

(provide 'setup-highlight)
