(add-hook 'js2-mode-hook (lambda () (tern-mode t)))

(defun delete-tern-process ()
  (interactive)
  (delete-process "Tern"))


(provide 'setup-tern)
