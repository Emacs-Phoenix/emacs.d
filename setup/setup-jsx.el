(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))

;; TODO 判断是 jsx 后缀才 set content
(add-hook 'web-mode-hook
          (lambda ()
            (when (and (stringp buffer-file-name)
                       (string-match "\\.jsx\\'" buffer-file-name))
              (if (equal web-mode-content-type "javascript")
                  (progn
                    (web-mode-set-content-type "jsx")
                    (web-mode-jshint))
                (message "now set to: %s" web-mode-content-type)))))

(provide 'setup-jsx)
