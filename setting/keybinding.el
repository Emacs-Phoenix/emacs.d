;; I don't need to kill emacs that easily
;; the mnemonic is C-x REALLY QUIT
(global-unset-key (kbd "C-s"))
(define-key global-map [(control shift ?s)] 'isearch-repeat-forward)
(define-key global-map (kbd "C-S-s") 'isearch-repeat-forward)
(define-key global-map (kbd "M-S-s") 'isearch-repeat-forward)
(define-key global-map (kbd "C-s") 'ace-jump-mode)
(define-key global-map (kbd "C-#") 'ace-jump-mode)

(global-set-key (kbd "C-x r q") 'save-buffers-kill-terminal)
(global-set-key (kbd "C-x C-c") 'delete-frame)

;; Completion that uses many different methods to find options.
(global-set-key (kbd "C-.") 'hippie-expand-no-case-fold)
(global-set-key (kbd "C-;") 'hippie-expand-lines)
(global-set-key (kbd "C-,") 'completion-at-point)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(global-unset-key (kbd "C-/"))
(global-set-key (kbd "C-/") 'imenu-anywhere)

(global-set-key (kbd "C-<f10>") 'menu-bar-mode)

(define-key key-translation-map [?\C-h] [?\C-?])
(global-set-key (kbd "<f1>") 'help-command)

(global-set-key (kbd "C-'") 'er/expand-region)


(provide 'keybinding)
