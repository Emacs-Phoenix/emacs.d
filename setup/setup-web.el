(require 'sws-mode)
(require 'jade-mode)

(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-enable-current-column-highlight t)
(setq web-mode-attr-indent-offset 2)
(setq web-mode-enable-current-element-highlight t)
(setq web-mode-style-padding 2)
(setq web-mode-script-padding 2)
;; (setq web-mode-auto-quote-style 2) ;; attr value single quote

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq-default indent-tabs-mode nil) ;; // 永远 indent 2 格
  (electric-indent-mode nil)
  (electric-indent-mode -1)
  (add-hook 'electric-indent-functions
            (lambda () 'no-indent) nil 'local)
  (electric-indent-local-mode -1)

  (define-key web-mode-map (kbd "C-<RET>") 'company-yasnippet)

  (add-hook 'local-write-file-hooks
            (lambda ()
              (delete-trailing-whitespace)
              (set-buffer-file-coding-system 'utf-8)
              nil)))

(defun sp-web-mode-is-code-context (id action context)
  (and (eq action 'insert)
       (not (or (get-text-property (point) 'part-side)
                (get-text-property (point) 'block-side)))))

(sp-local-pair 'web-mode "<" nil :when '(sp-web-mode-is-code-context))

(defun my-turn-indentation-off ()
  (interactive)
  (local-set-key (kbd "") 'tab-to-tab-stop))


(flycheck-add-mode 'javascript-eslint 'web-mode)
(setq-default flycheck-temp-prefix ".flycheck")

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(add-hook 'web-mode-hook
          (lambda ()
            (when (and (stringp buffer-file-name)
                       (string-match "\\.jsx\\'" buffer-file-name))
              (progn
                (message "jsx for web-mode")
                (web-mode-set-content-type "jsx")
                ;(web-mode-jshint)
                )
              (message "now set to: %s" web-mode-content-type)
              )))

(defun my/use-eslint-from-node-modules ()
 (let* ((root (projectile-project-root))
        (eslint (and root
                     (expand-file-name "node_modules/.bin/eslint"
                                       root))))
   (when (and eslint (file-executable-p eslint))
     (setq-local flycheck-javascript-eslint-executable eslint))))

(add-hook 'web-mode-hook #'my/use-eslint-from-node-modules)

(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))

(provide 'setup-web)
