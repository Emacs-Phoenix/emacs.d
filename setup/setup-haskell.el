(require 'highlight-uses-mode)
(require 'inf-haskell)

(require 'haskell-mode)

(add-to-list 'load-path "~/.emacs.d/site-lisp/structured-haskell-mode/elisp")
(require 'shm)

(add-hook 'haskell-mode-hook 'structured-haskell-mode)


(provide 'setup-haskell)
