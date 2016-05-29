
(require 'rainbow-delimiters)
(add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)
(add-hook 'web-map-hook #'rainbow-delimiters-mode)
(add-hook 'scss-map-hook #'rainbow-delimiters-mode)
(add-hook 'css-map-hook #'rainbow-delimiters-mode)
(add-hook 'js2-map-hook #'rainbow-delimiters-mode)

(require 'rainbow-mode)
(setq rainbow-html-colors nil) ;; 不显示 red black 这些 html 颜色 
(dolist (hook '(css-mode-hook
                html-mode-hook))
  (add-hook hook (lambda () (rainbow-mode t))))



(provide 'setup-color)
