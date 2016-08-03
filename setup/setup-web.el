(require 'sws-mode)
(require 'jade-mode)


(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

(setq web-mode-code-indent-offset 2)
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
  ;; (set (make-local-variable 'indent-line-function) (lambda () 'noindent)))
  ;; (electric-indent-local-mode nil)
  ;; (set (make-local-variable 'indent-line-function nil))
  ;; (set (make-local-variable 'electric-indent-local-mode nil))
  ;; (electric-indent-mode nil)
  (electric-indent-mode -1)
  (add-hook 'electric-indent-functions
            (lambda () 'no-indent) nil 'local)
  (setq-default indent-tabs-mode nil)
  (electric-indent-local-mode -1)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-enable-auto-pairing nil)
  (add-hook 'local-write-file-hooks
            (lambda ()
              (delete-trailing-whitespace)
              nil)))

(setq web-mode-code-indent-offset 2)

(defun sp-web-mode-is-code-context (id action context)
  (and (eq action 'insert)
       (not (or (get-text-property (point) 'part-side)
                (get-text-property (point) 'block-side)))))

(sp-local-pair 'web-mode "<" nil :when '(sp-web-mode-is-code-context))


;; (setq web-mode-enable-current-column-highlight t)

;; (setq web-mode-attr-indent-offset 2)
;; (setq web-mode-enable-current-element-highlight t)

(setq web-mode-style-padding 2)


(setq web-mode-script-padding 2)

(defun my-turn-indentation-off ()
  (interactive)
  (local-set-key (kbd "") 'tab-to-tab-stop))


;;(add-to-list 'web-mode-indentation-params '("case-extra-offset" . nil))

(provide 'setup-web)
