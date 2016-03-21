
(require 'rainbow-delimiters)
(add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)
(add-hook 'web-map-hook #'rainbow-delimiters-mode)
(add-hook 'scss-map-hook #'rainbow-delimiters-mode)
(add-hook 'html-map-hook #'rainbow-delimiters-mode)

(require 'rainbow-mode)
(dolist (hook '(css-mode-hook
                  html-mode-hook))
(add-hook hook (lambda () (rainbow-mode t))))


(provide 'setup-color)
