(setq css-indent-offset 2)

(require 'css-eldoc)
(autoload 'turn-on-css-eldoc "css-eldoc")
(add-hook 'css-mode-hook 'turn-on-css-eldoc)
(turn-on-css-eldoc)

(add-hook 'css-mode-hook
          (lambda ()
            (advice-add 'company-complete-selection :after
                        (lambda ()
                          (if (when (derived-mode-p 'css-mode)
                                (unless
                                    (string-match ":" (buffer-substring-no-properties (line-beginning-position) (point)))
                                  (emmet-expand-line nil))))))))


(setq css3-imenu-generic-expression
      '(
        (nil "\\(^@font-face\\)" 1)
        (nil "^ *\\([^ ]+\\) *{ *$" 1)
        (nil "\\(^h[123]\\)" 1)
        ))

(add-hook 'css-mode-hook (lambda () (setq imenu-generic-expression css3-imenu-generic-expression)))


(add-hook 'css-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends) '(company-css company-yasnippet))))



(provide 'setup-css)
