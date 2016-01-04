(defun region-as-string ()
  (buffer-substring (region-beginning)
                    (region-end)))

(defun isearch-forward-use-region ()
  (interactive)
  (when (region-active-p)
    (add-to-history 'search-ring (region-as-string))
    (deactivate-mark))
  (call-interactively 'isearch-forward))

(defun isearch-backward-use-region ()
  (interactive)
  (when (region-active-p)
    (add-to-history 'search-ring (region-as-string))
    (deactivate-mark))
  (call-interactively 'isearch-backward))

(eval-after-load "multiple-cursors"
  '(progn
     (unsupported-cmd isearch-forward-use-region ".")
     (unsupported-cmd isearch-backward-use-region ".")))

(defun sudo-edit (&optional arg)
  (interactive "p")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))


;; (defun comment-region-or-to-end ()
;;   "comment-region-or-to-end"
;;   (interactive)
;;   (when (region-active-p)
;;     (paredit-comment-dwim))
;;   (progn
;;     (set-mark-command)
;;     (move-end-of-line)
;;     (paredit-comment-dwim)))

(provide 'defuns)
