

;; (setq org-todo-keywords
;;       '((sequence "TODO(t)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")))


(add-hook 'org-mode-hook (lambda () (setq truncate-lines t)))

(setq org-todo-keywords '((type "TODO" "PREPARE" "WAIT" "DOING" "DONE" "TESTING" "FIXING" "CANCELED")))

(setq org-todo-keyword-faces
      '(("TODO" . org-warning) ("STARTED" . "yellow")
        ("DONE" . (:foreground "green" :weight bold))
        ("CANCELED" . (:foreground "yellow" :weight bold))))

(provide 'setup-org)
