(require 'hideshowvis)

(autoload 'hideshowvis-enable "hideshowvis" "Highlight foldable regions")

(autoload 'hideshowvis-minor-mode
  "hideshowvis"
  "Will indicate regions foldable with hideshow in the fringe."
  'interactive)


(dolist (hook (list 'emacs-lisp-mode-hook
                    'c++-mode-hook
                    'js2-mode-hook
                    'json-mode
                    'html-mode-hook
                    'web-mode-hook
                    'css-mode-hook
                    'python-mode-hook))
  (add-hook hook 'hideshowvis-enable))

(hideshowvis-symbols)

(provide 'setup-hideshow)
