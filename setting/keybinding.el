;;Key binding

(global-unset-key "\C-z")

(require 'misc)
(global-set-key (kbd "s-.") 'copy-from-above-command)

(define-key global-map (kbd "M-_") 'redo)

(global-set-key (kbd "C-x C-y") 'browse-kill-ring)

(global-unset-key (kbd "C-s"))
(global-unset-key (kbd "C-r"))
(define-key global-map [(meta shift ?s)] 'isearch-backward-use-region)
(define-key global-map (kbd "C-r") 'isearch-forward-use-region)
(global-set-key (kbd "C-r") 'isearch-forward-use-region)
(define-key global-map (kbd "C-s") 'ace-jump-char-mode)
(define-key global-map (kbd "C-#") 'ace-jump-mode)

;;string
;; Toggle quotes
(global-set-key (kbd "C-\"") 'toggle-quotes)

(global-set-key (kbd "C-x r q") 'save-buffers-kill-terminal)
(global-set-key (kbd "C-x C-c") 'delete-frame)

;;Completion that uses many different methods to find options.
(global-set-key (kbd "C-.") 'hippie-expand-no-case-fold)
(global-set-key (kbd "C-;") 'hippie-expand-lines)
(global-set-key (kbd "C-,") 'completion-at-point)

(global-set-key (kbd "C-s-c C-s-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c C-.") 'mc/mark-all-like-this)
(global-set-key (kbd "C-s-<mouse-1>") 'mc/add-cursor-on-click)


(global-unset-key (kbd "C-/"))
(global-set-key (kbd "C-/") 'imenu-anywhere)

(global-set-key (kbd "C-<f10>") 'menu-bar-mode)

(define-key key-translation-map [?\C-h] [?\C-?])
(global-set-key (kbd "<f1>") 'help-command)

(global-set-key (kbd "C-=") 'er/expand-region)

(global-set-key (kbd "C-s-k") 'kill-and-retry-line)
(global-set-key (kbd "C-w") 'kill-region-or-backward-word)

(global-set-key [f8] 'neotree-toggle)
(global-set-key [f7] 'tabbar-mode)


(global-set-key (kbd "C-c C-<left>")  'windmove-left)
(global-set-key (kbd "C-c C-<right>") 'windmove-right)
(global-set-key (kbd "C-c C-<up>")    'windmove-up)
(global-set-key (kbd "C-c C-<down>")  'windmove-down)



(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
(global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
(global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)

;; Zap to char
(global-set-key (kbd "M-z") 'zap-up-to-char)
(global-set-key (kbd "s-z") (lambda (char) (interactive "cZap up to char backwards: ") (zap-up-to-char -1 char)))

(global-set-key (kbd "C-x C-i") 'idomenu)

(global-set-key (kbd "C-x C-p") 'find-or-create-file-at-point)

(global-set-key (kbd "s-b") 'quick-switch-buffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "s-b") 'quick-switch-buffer)

;; Revert without any fuss
(global-set-key (kbd "M-<escape>") (λ (revert-buffer t t)))

;; Edit file with sudo
(global-set-key (kbd "M-s e") 'sudo-edit)

(global-set-key (kbd "C-x C--") 'rotate-windows)

(global-set-key (kbd "M-j") (λ (join-line -1)))

;; Help should search more than just commands
(global-set-key (kbd "<f1> a") 'apropos)

;; Should be able to eval-and-replace anywhere.
(global-set-key (kbd "C-c C-e") 'eval-and-replace)

(global-set-key (kbd "<prior>") 'beginning-of-buffer)
(global-set-key (kbd "<home>") 'beginning-of-buffer)
(global-set-key (kbd "<next>") 'end-of-buffer)
(global-set-key (kbd "<end>") 'end-of-buffer)
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)

(global-set-key (kbd "M-<up>") 'smart-up)
(global-set-key (kbd "M-<down>") 'smart-down)
(global-set-key (kbd "M-<left>") 'smart-backward)
(global-set-key (kbd "M-<right>") 'smart-forward)

(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)

(global-set-key (kbd "C-x m") 'magit-status)
(autoload 'magit-status "magit")

(global-set-key (kbd "<C-s-down>") 'move-text-down)
(global-set-key (kbd "<C-s-up>") 'move-text-up)

(global-set-key (kbd "C-s-y") 'yank-unindented)
(global-set-key (kbd "C-x u") 'undo-tree-visualize)

(global-set-key (kbd "C-w") 'kill-region-or-backward-word)
(global-set-key (kbd "C-c C-w") 'kill-to-beginning-of-line)

;; Use M-w for copy-line if no active region
(global-set-key (kbd "M-w") 'save-region-or-current-line)

(global-set-key (kbd "C-c z") 'goto-last-change)
(global-set-key (kbd "C-z") 'goto-last-change)


;;A regexp/replace command for Emacs with interactive visual feedback
(define-key global-map (kbd "C-c r") 'vr/replace)
(define-key global-map (kbd "C-c q") 'vr/query-replace)

(define-key global-map (kbd "C-M-q") 'indent-code-rigidly)
(define-key global-map (kbd "C-M-i") 'indent-code-rigidly)

(define-key global-map (kbd "C-o") 'vi-open-line-below)
(define-key global-map (kbd "C-O") 'vi-open-line-above)
(define-key global-map (kbd "C-S-O") 'vi-open-line-above)
(define-key global-map [(meta shift ?o)] 'vi-open-line-above)


(global-set-key (kbd "C-x w") 'elfeed)

(provide 'keybinding)


