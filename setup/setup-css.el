
;;(advice-add 'tab-indent-or-complete :before #'pair-jump-or-tab)


(add-hook 'css-mode-hook
          (lambda ()
            (advice-add 'company-complete-selection :after
                        (lambda ()
                          (if (when (derived-mode-p 'css-mode)
                                (unless
                                    (string-match ":" (buffer-substring-no-properties (line-beginning-position) (point)))
                                  (emmet-expand-line nil))))))))

;; (add-hook 'css-mode-hook
;;           (lambda ()
;;             (advice-add 'company-complete :after (lambda ()
;;                                                    (emmet-expand-line nil)))))

;; (add-hook 'css-mode-hook
;;           (lambda ()
;;             (if )
            
;;             (advice-add 'company-complete-selection :after (lambda ()
;;                                                    (emmet-expand-line nil)))))

(defun kill-text-with-property (start end property value &optional object)
  "Delete the text with the PROPERTY in the part of OBJECT from START and END."
  (interactive "r\nsProperty: \nsValue: ")
  (let ((delenda ()) (here start))
    ;; collect the list of regions to kill
    ;; note that delenda contains the regions in the reverse order so that
    ;; deleting the later ones do not affect the boundaries of the ealier ones
    (while (< here end)
      (let ((beg (text-property-any here end property value object))
            (stop (and beg (text-property-not-all beg end property value object) end)))
        (if (null beg)
            (setq here end)     ; done
          (push (cons beg stop) delenda)
          (setq here stop))))
    (if (stringp object)
        ;; collect the complements of delenda into a new string
        (....)
      ;; buffer: kill the delenda regions
      (with-current-buffer (or object (current-buffer))
        (dolist (pair delenda)
          (kill-region (car pair) (cdr pair)))))))


(setq css3-imenu-generic-expression
      '(
        (nil "\\(^@font-face\\)" 1)
        ;;(nil "\\(^body\\)" 1)
        ;;(nil "\\(^#foo\\)" 1)
        (nil "^ *\\([^ ]+\\) *{ *$" 1)
        (nil "\\(^h[123]\\)" 1)
        ))


(add-hook 'css-mode-hook 
          (lambda ()
            (setq imenu-generic-expression css3-imenu-generic-expression)))


(require 'css-eldoc)
(autoload 'turn-on-css-eldoc "css-eldoc")
(add-hook 'css-mode-hook 'turn-on-css-eldoc)
(turn-on-css-eldoc)


;; (defun maybe-flymake-css-load ()
;;   "Activate flymake-css as necessary, but not in derived modes."
;;   (when (eq major-mode 'css-mode)
;;     (flymake-css-load)))

;; (defun my-css-imenu-make-index ()
;;   (save-excursion
;;     (imenu--generic-function '((nil "^ *\\([^ ]+\\) *{ *$" 1)
;;                                ))))
;; (add-hook 'css-mode-hook
;;           (lambda ()
;;             (unless (is-buffer-file-temp)
;;               (setq imenu-create-index-function 'my-css-imenu-make-index)
;;               (maybe-flymake-css-load))))

;; (add-hook 'scss-mode-hook
;;           (lambda ()
;;             (unless (is-buffer-file-temp)
;;               (setq imenu-create-index-function 'my-css-imenu-make-index)
;;               (flymake-sass-load))))

(setq css-indent-offset 2)

(provide 'setup-css)
