(require 'projectile)
(projectile-global-mode)

(global-unset-key (kbd "M-p"))
(global-set-key (kbd "M-p") 'projectile-find-file)

(provide 'setup-project)
