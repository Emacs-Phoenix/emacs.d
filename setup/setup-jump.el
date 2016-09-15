;;(setq ace-jump-word-mode-use-query-char nil)

(setq ace-jump-mode-scope 'window)
(setq ace-jump-mode-case-fold nil)


(global-set-key (kbd "C-c <SPC>") 'avy-goto-line)
(global-set-key (kbd "C-:") 'ace-jump-char-mode)
(global-set-key (kbd "C-;") 'ace-jump-char-mode)
(global-set-key (kbd "C-c C-:") 'ace-jump-mode)

(require 'dumb-jump)
(dumb-jump-mode)

(provide 'setup-jump)
