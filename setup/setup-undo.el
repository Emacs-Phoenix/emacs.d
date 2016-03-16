(global-undo-tree-mode 1)

(with-eval-after-load 'undo-tree
  (setq undo-tree-auto-save-history t))

(defconst spacemacs-cache-directory
  (expand-file-name (concat user-emacs-directory ".cache/")))
  
(setq undo-tree-auto-save-history t
      undo-tree-history-directory-alist
      `(("." . ,(concat user-emacs-directory".undo"))))
(unless (file-exists-p (concat user-emacs-directory ".undo"))
  (make-directory (concat user-emacs-directory ".undo")))


;;undolist
(undohist-initialize)

(provide 'setup-undo)
