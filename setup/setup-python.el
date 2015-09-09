;;(require 'anaconda-mode)
(require 'elpy)
(require 'pyenv)
(add-hook 'python-mode-hook 'anaconda-mode)

(elpy-enable)

(provide 'setup-python)
