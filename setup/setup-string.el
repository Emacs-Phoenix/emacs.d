(define-prefix-command 'string-map)
(global-unset-key "\M-a")
(global-set-key (kbd "M-a") 'string-map)
(define-key string-map (kbd "c") 'capitalize-word)


(provide 'setup-string)
