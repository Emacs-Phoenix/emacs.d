(setq python-indent-guess-indent-offset 4)
(setq python-indent-offset 4)

(require 'anaconda-mode)

(require 'elpy)


;;(add-hook 'python-mode-hook 'anaconda-mode)

(elpy-enable)

(provide 'setup-python)
