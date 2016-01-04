

(defun comment-line-or-comment-block ()
  (interactive)
  (if (use-region-p)
      (paredit-comment-dwim)
    (progn
      (set-mark-command nil)
      (end-of-line)
      (paredit-comment-dwim))))



(provide 'operation)
