
;;http://stackoverflow.com/questions/151945/how-do-i-control-how-emacs-makes-backup-files

;; Save all tempfiles in $TMPDIR/emacs$UID/                                                        
(defconst emacs-tmp-dir
  (format "%s/%s%s/" temporary-file-directory "emacs" (user-uid)))
(setq backup-directory-alist
      `((".*" . ,emacs-tmp-dir)))
(setq auto-save-file-name-transforms
      `((".*" ,emacs-tmp-dir t)))
(setq auto-save-list-file-prefix emacs-tmp-dir)

(setq backup-by-copying t)

(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

;; 完全不需要备份
;; (setq make-backup-files nil)

(provide 'setup-backup)
