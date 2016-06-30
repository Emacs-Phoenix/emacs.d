(require 'projectile)
(projectile-global-mode)

(global-unset-key (kbd "M-p"))
(global-set-key (kbd "M-p") 'projectile-find-file)

(defun projectile-find-file-or-from-region ()
  (interactive)
  (if (region-active-p)
      ;;TODO
      (message "h")
    (projectile-find-file)))

(global-set-key (kbd "H-n") 'projectile-find-file-or-from-region)

(provide 'setup-project)
