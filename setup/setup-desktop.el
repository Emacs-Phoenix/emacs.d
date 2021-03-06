;;(desktop-save-mode 1)

;;(setq history-length 250)
;;(add-to-list 'desktop-globals-to-save 'file-name-history)

;;
;;===================================================
;;===================================================
;;

;; (setq desktop-path '("~/.emacs.d/"))
;; (setq desktop-dirname "~/.emacs.d/")
;; (setq desktop-base-file-name "emacs-desktop")

;; ;; remove desktop after it's been read
;; (add-hook 'desktop-after-read-hook
;; 	  '(lambda ()
;; 	     ;; desktop-remove clears desktop-dirname
;; 	     (setq desktop-dirname-tmp desktop-dirname)
;; 	     (desktop-remove)
;; 	     (setq desktop-dirname desktop-dirname-tmp)))

;; (defun saved-session ()
;;   (file-exists-p (concat desktop-dirname "/" desktop-base-file-name)))

;; ;; use session-restore to restore the desktop manually
;; (defun session-restore ()
;;   "Restore a saved emacs session."
;;   (interactive)
;;   (if (saved-session)
;;       (desktop-read)
;;     (message "No desktop found.")))

;; ;; use session-save to save the desktop manually
;; (defun session-save ()
;;   "Save an emacs session."
;;   (interactive)
;;   (if (saved-session)
;;       (if (y-or-n-p "Overwrite existing desktop? ")
;; 	  (desktop-save-in-desktop-dir)
;; 	(message "Session not saved."))
;;     (desktop-save-in-desktop-dir)))

;; ;; ask user whether to restore desktop at start-up
;; (add-hook 'after-init-hook
;; 	  '(lambda ()
;; 	     (if (saved-session)
;; 		 (if (y-or-n-p "Restore desktop? ")
;; 		     (session-restore)))))

;; ;;
;;===================================================
;;===================================================
;;
(require 'desktop)
(desktop-save-mode 1)
(defun my-desktop-save ()
  (interactive)
  ;; Don't call desktop-save-in-desktop-dir, as it prints a message.
  (if (eq (desktop-owner) (emacs-pid))
      (desktop-save desktop-dirname)))


(add-hook 'auto-save-hook 'my-desktop-save)

;;(plan)
;;(add-hook 'desktop-after-read-hook 'plan)

(provide 'setup-desktop)
