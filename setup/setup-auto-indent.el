(require 'auto-indent-mode)
(add-hook 'js2-mode-hook
          '(lambda ()
             (define-key c-mode-map "\C-m" 'newline-and-indent)))

(add-hook 'js2-mode-hook 'auto-indent-mode)

(provide 'setup-auto-indent)
