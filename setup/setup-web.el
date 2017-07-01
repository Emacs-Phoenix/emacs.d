(require 'sws-mode)
(require 'jade-mode)

(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))

(setq web-mode-content-types-alist
      '(("jsx"  . "/Users/chchen/MY-PROJECT/OctopusApp/.*\\.js[x]?\\'")
        ("jsx"  . "/Users/chchen/MY-PROJECT/Octopus/.*\\.js[x]?\\'")))

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-enable-current-column-highlight t)
(setq web-mode-attr-indent-offset 2)
(setq web-mode-enable-current-element-highlight t)
(setq web-mode-style-padding 2)
(setq web-mode-script-padding 2)
(setq web-mode-enable-auto-quoting nil)
;; (setq web-mode-auto-quote-style 2) ;; attr value single quote

(global-set-key [(control return)] 'yas-expand)
(define-key web-mode-map (kbd "C-c C-s") 'yas/insert-snippet)
(define-key web-mode-map (kbd "C-j") 'emmet-expand-line)

(flycheck-add-mode 'javascript-eslint 'web-mode)
(setq-default flycheck-temp-prefix ".flycheck")

;; (add-hook 'web-mode-hook (lambda () (web-mode-set-content-type "jsx")))

(defun my/use-eslint-from-node-modules ()
 (let* ((root (projectile-project-root))
        (eslint (and root
                     (expand-file-name "node_modules/.bin/eslint"
                                       root))))
   (when (and eslint (file-executable-p eslint))
     (setq-local flycheck-javascript-eslint-executable eslint))))

(setq web-mode-extra-auto-pairs
      '(("'"  . (("'" "'")))
        ))

(add-hook 'web-mode-hook #'my/use-eslint-from-node-modules)

(require 'smartparens-config)
(add-hook 'web-mode-hook #'smartparens-mode)

(provide 'setup-web)
