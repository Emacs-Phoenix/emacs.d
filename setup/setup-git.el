;; full screen magit-status

(add-to-list 'load-path "~/.emacs.d/site-lisp/magit/lisp")
(require 'magit)

(with-eval-after-load 'info
  (info-initialize)
  (add-to-list 'Info-directory-list
	       "~/.emacs.d/site-lisp/magit/Documentation/"))

(defun magit-status-fullscreen (prefix)
  (interactive "P")
  (magit-status)
  (unless prefix
    (delete-other-windows)))

;; don't prompt me

(set-default 'magit-unstage-all-confirm nil)
(set-default 'magit-stage-all-confirm nil)
(set-default 'magit-revert-buffers 'silent)

;; full screen vc-annotate
(defun vc-annotate-quit ()
  "Restores the previous window configuration and kills the vc-annotate buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :vc-annotate-fullscreen))

(eval-after-load "vc-annotate"
  '(progn
     (defadvice vc-annotate (around fullscreen activate)
       (window-configuration-to-register :vc-annotate-fullscreen)
       ad-do-it
       (delete-other-windows))
     (define-key vc-annotate-mode-map (kbd "q") 'vc-annotate-quit)))

;;(define-key 'make-sparse-keymap (kbd "<tab>") 'magit-section-toggle)

(define-prefix-command 'my-magit-map)
(global-set-key (kbd "C-x m") 'my-magit-map)
(define-key my-magit-map (kbd "a") 'magit-status)
(define-key my-magit-map (kbd "f") 'magit-log-buffer-file)
(define-key my-magit-map (kbd "l") 'magit-log-all)

(autoload 'magit-status "magit")

(require 'magit-filenotify)
(add-hook 'after-save-hook 'magit-after-save-refresh-status)

(require 'git-gutter)
(global-git-gutter-mode +1)

(provide 'setup-git)
