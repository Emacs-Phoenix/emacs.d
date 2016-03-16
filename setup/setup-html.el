;; (defun skip-to-next-blank-line ()
;;   (interactive)
;;   (let ((inhibit-changing-match-data t))
;;     (skip-syntax-forward " >")
;;     (unless (search-forward-regexp "^\\s *$" nil t)
;;       (goto-char (point-max)))))

;; (defun skip-to-previous-blank-line ()
;;   (interactive)
;;   (let ((inhibit-changing-match-data t))
;;     (skip-syntax-backward " >")
;;     (unless (search-backward-regexp "^\\s *$" nil t)
;;       (goto-char (point-min)))))

;; (defun html-wrap-in-tag (beg end)
;;   (interactive "r")
;;   (let ((oneline? (= (line-number-at-pos beg) (line-number-at-pos end))))
;;     (deactivate-mark)
;;     (goto-char end)
;;     (unless oneline? (newline-and-indent))
;;     (insert "</div>")
;;     (goto-char beg)
;;     (insert "<div>")
;;     (unless oneline? (newline-and-indent))
;;     (indent-region beg (+ end 11))
;;     (goto-char (+ beg 4))))

;; (defun --setup-simplezen ()
;;   (require 'simplezen)
;;   (set (make-local-variable 'yas-fallback-behavior)
;;        '(apply simplezen-expand-or-indent-for-tab)))

;; (add-hook 'sgml-mode-hook '--setup-simplezen)
;; (add-hook 'html-mode-hook '--setup-simplezen)

;;(define-key html-mode-map (kbd "TAB") 'simplezen-expand-or-indent-for-tab)


;; after deleting a tag, indent properly
(defadvice sgml-delete-tag (after reindent activate)
  (indent-region (point-min) (point-max)))




(tagedit-add-experimental-features)



(provide 'setup-html)
