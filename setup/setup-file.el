
;;;To help with large files, I've installed my own find-file-hook which turns on fundamental mode (avoids font-lock), turns off undo, and makes the buffer read-only just to avoid any accidental changes (making unnecessary backups of large files).
(defun my-find-file-check-make-large-file-read-only-hook ()
  "If a file is over a given size, make the buffer read only."
  (when (> (buffer-size) (* 1024 1024))
    (setq buffer-read-only t)
    (buffer-disable-undo)
    (fundamental-mode)))

(add-hook 'find-file-hook 'my-find-file-check-make-large-file-read-only-hook)

(provide 'setup-file)
