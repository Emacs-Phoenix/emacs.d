(require 'backups-mode)
(backups-mode-start)

(setq backup-by-copying t
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

(defvar backup-directory "~/.emacs-backups/backups/")
(defvar tramp-backup-directory "~/.emacs-backups/tramp-backups/")

;; keep all versions forever
(setq delete-old-versions 1)

(provide 'setup-backup)
