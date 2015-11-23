
(require 'scss-mode)
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

(defun aj-scss-mode-hook()
  (setq cssm-indent-function #'cssm-c-style-indenter)
  ;; (setq scss-sass-options '("--style" "compressed"))
  (rainbow-mode t))
(add-hook 'scss-mode-hook 'aj-scss-mode-hook)

(add-hook 'scss-mode-hook 'flycheck-mode)

(provide 'setup-scss)
