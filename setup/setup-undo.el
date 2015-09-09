;; (defun save-undo-filename (orig-name)
;;   "given a filename return the file name in which to save the undo list"
;;   (concat (file-name-directory orig-name)
;;           "."
;;           (file-name-nondirectory orig-name)
;;           ".undo~"))

;; (defun save-undo-list ()
;;   "Save the undo list to a file"
;;   (save-excursion
;;     (ignore-errors
;;       (let ((undo-to-save `(setq buffer-undo-list ',buffer-undo-list))
;;             (undo-file-name (save-undo-filename (buffer-file-name))))
;;         (find-file undo-file-name)
;;         (erase-buffer)
;;         (let (print-level
;;               print-length)
;;           (print undo-to-save (current-buffer)))
;;         (let ((write-file-hooks (remove 'save-undo-list write-file-hooks)))
;;           (save-buffer))
;;         (kill-buffer))))
;;   nil)

;; (defvar handling-undo-saving nil)

;; (defun load-undo-list ()
;;   "load the undo list if appropriate"
;;   (ignore-errors
;;     (when (and
;;            (not handling-undo-saving)
;;            (null buffer-undo-list)
;;            (file-exists-p (save-undo-filename (buffer-file-name))))
;;       (let* ((handling-undo-saving t)
;;              (undo-buffer-to-eval (find-file-noselect (save-undo-filename (buffer-file-name)))))
;;         (eval (read undo-buffer-to-eval))))))

;; (add-hook 'write-file-hooks 'save-undo-list)
;; (add-hook 'find-file-hook 'load-undo-list)

;;+++++++++++++++++++++++++++++++++++++++++

(setq undo-tree-auto-save-history t)


(provide 'setup-undo)
