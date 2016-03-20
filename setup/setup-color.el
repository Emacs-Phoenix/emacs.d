
(add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)
(add-hook 'web-map-hook #'rainbow-delimiters-mode)
(add-hook 'scss-map-hook #'rainbow-delimiters-mode)
(add-hook 'html-map-hook #'rainbow-delimiters-mode)

;;rainbow mode
;; (setq rainbow-html-colors nil)
;; (setq rainbow-ansi-colors nil)
;; (setq rainbow-x-colors nil)


(provide 'setup-color)
