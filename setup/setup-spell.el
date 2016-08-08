
;;(setq-default flyspell-mode t)

(global-set-key (kbd "M-<RET>") 'ispell-complete-word)

(setq ispell-program-name "aspell")
(setq ispell-local-dictionary "en")
(setq ispell-dictionary "en")


(provide 'setup-spell)
