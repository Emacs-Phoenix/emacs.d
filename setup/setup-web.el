(require 'sws-mode)
(require 'jade-mode)

(setq web-mode-markup-indent-offset 2)


(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  
  (setq-default indent-tabs-mode nil) ;; // 永远 indent 2 格

  
  (add-hook 'local-write-file-hooks
            (lambda ()
              (delete-trailing-whitespace)
              nil)))

(add-hook 'web-mode-hook  'my-web-mode-hook)

;; (add-to-list 'auto-mode-alist '("\\.vue\\'" . jade-mode))
;; (add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))

(setq web-mode-engines-alist
      '(("vue"    . "\\.vue\\'"))
      )

(defun my-web-mode-hook ()
  (setq web-mode-enable-auto-pairing nil))

(add-hook 'web-mode-hook  'my-web-mode-hook)

(defun sp-web-mode-is-code-context (id action context)
  (and (eq action 'insert)
       (not (or (get-text-property (point) 'part-side)
                (get-text-property (point) 'block-side)))))

(sp-local-pair 'web-mode "<" nil :when '(sp-web-mode-is-code-context))


(setq web-mode-enable-current-column-highlight t)

(setq web-mode-attr-indent-offset 2)
(setq web-mode-enable-current-element-highlight t)

(setq web-mode-style-padding 2)


(setq web-mode-script-padding 2)



(provide 'setup-web)
