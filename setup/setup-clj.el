(require 'clojure-mode)
(require 'cider)
(require 'icomplete)
(require 'clj-refactor)
(require 'clojure-mode-extra-font-locking)
(require 'inf-clojure)
(require 'inf-lisp)
(require 'clojure-cheatsheet)


(add-hook 'clojure-mode-hook #'subword-mode)
(add-hook 'clojure-mode-hook #'inf-clojure-minor-mode)
(add-hook 'clojure-mode-hook #'paredit-mode)
(add-hook 'clojure-mode-hook #'smartparens-strict-mode)
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)
(add-hook 'clojure-mode-hook
          (lambda ()
            (clj-refactor-mode 1)))

(cljr-add-keybindings-with-modifier "C-s-")

(define-key clj-refactor-map (kbd "C-x C-r") 'cljr-rename-file)
(define-key clojure-mode-map (kbd "C->") 'cljr-thread)
(define-key clojure-mode-map (kbd "C-<") 'cljr-unwind)

(eval-after-load 'clojure-mode
  '(progn
     (define-key clojure-mode-map (kbd "C-c h") #'clojure-cheatsheet)))

(define-key cider-repl-mode-map (kbd "C-.") 'complete-symbol)
(define-key cider-mode-map (kbd "C-.") 'complete-symbol)
(define-key cider-mode-map (kbd "C-c C-q") 'nrepl-close)
(define-key cider-mode-map (kbd "C-c C-Q") 'cider-quit)

(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)
(add-hook 'cider-repl-mode-hook #'cider-company-enable-fuzzy-completion)
(add-hook 'cider-mode-hook #'cider-company-enable-fuzzy-completion)


(provide 'setup-clj)
