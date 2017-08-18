(require 'prettier-js)

(setq prettier-js-args '(
                         "--single-quote"
                         "--print-width" "100"
                         ))

(defun enable-minor-mode (my-pair)
  "Enable minor mode if filename match the regexp.  MY-PAIR is a cons cell (regexp . minor-mode)."
  (if (buffer-file-name)
      (if (string-match (car my-pair) buffer-file-name)
          (funcall (cdr my-pair)))))

(add-hook 'web-mode-hook #'(lambda ()
                             (enable-minor-mode
                              '("\\.jsx?\\'" . prettier-js-mode))))

(add-to-list 'auto-mode-alist
             '("\\.jsx\\'" . (lambda ()
                               ;; add major mode setting here, if needed, for example:
                               ;; (text-mode)
                               (prettier-js-mode))))

(provide 'setup-prettier)
