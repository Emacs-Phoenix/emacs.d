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

(add-hook 'local-write-file-hooks
          (lambda ()
            (delete-trailing-whitespace)
            nil))

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
  (setq-default indent-tabs-mode nil)
  (electric-indent-local-mode -1)
  (add-hook 'local-write-file-hooks
            (lambda ()
              (delete-trailing-whitespace)
              nil)))

(defun sp-web-mode-is-code-context (id action context)
  (and (eq action 'insert)
       (not (or (get-text-property (point) 'part-side)
                (get-text-property (point) 'block-side)))))

(sp-local-pair 'web-mode "<" nil :when '(sp-web-mode-is-code-context))

(defun my-turn-indentation-off ()
  (interactive)
  (local-set-key (kbd "") 'tab-to-tab-stop))

(provide 'setup-web)
