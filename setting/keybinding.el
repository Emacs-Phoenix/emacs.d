;;Key binding

(global-unset-key "\C-z")

(require 'misc)
(global-set-key (kbd "C-<tab>") 'find-tag-no-prompt)
(global-set-key (kbd "s-.") 'copy-from-above-command)

(define-key global-map (kbd "M-_") 'redo)

(global-set-key (kbd "C-r") 'isearch-backward-use-region)
(global-set-key (kbd "C-s") 'isearch-forward-use-region)

;; string
;; Toggle quotes
(global-set-key (kbd "C-\"") 'toggle-quotes)

(global-set-key (kbd "C-x r q") 'save-buffers-kill-terminal)
(global-set-key (kbd "C-x C-c") 'delete-frame)

;;Completion that uses many different methods to find options.
(global-set-key (kbd "C-.") 'hippie-expand-no-case-fold)


(global-set-key (kbd "C-s-c C-s-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(global-unset-key (kbd "C-/"))


(global-set-key (kbd "C-<f10>") 'menu-bar-mode)

(define-key key-translation-map [?\C-h] [?\C-?])
(global-set-key (kbd "<f1>") 'help-command)

(global-set-key (kbd "C-=") 'er/expand-region)

(global-set-key (kbd "C-s-k") 'kill-and-retry-line)
(global-set-key (kbd "C-w") 'kill-region-or-backward-word)

(global-set-key (kbd "C-<backspace>") 'hungry-delete-backward)

(global-set-key (kbd "C-c C-<left>")  'windmove-left)
(global-set-key (kbd "C-c C-<right>") 'windmove-right)
(global-set-key (kbd "C-c C-<up>")    'windmove-up)
(global-set-key (kbd "C-c C-<down>")  'windmove-down)

(global-set-key (kbd "C-c h")  'windmove-left)
(global-set-key (kbd "C-c l") 'windmove-right)
(global-set-key (kbd "C-c k")    'windmove-up)
(global-set-key (kbd "C-c j")  'windmove-down)

(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
(global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
(global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)

;; Zap to char
(global-set-key (kbd "M-z") 'zap-up-to-char)
(global-set-key (kbd "s-z") (lambda (char) (interactive "cZap up to char backwards: ") (zap-up-to-char -1 char)))


(global-set-key (kbd "M-e") 'switch-to-buffer)


;; Revert without any fuss
(global-set-key (kbd "M-<escape>") (λ (revert-buffer t t)))

;; Edit file with sudo
(global-set-key (kbd "M-s e") 'sudo-edit)

;;(global-set-key (kbd "C-x C-\\") 'rotate-windows)

(global-set-key (kbd "M-j") (λ (join-line -1)))

;; Help should search more than just commands
(global-set-key (kbd "<f1> a") 'apropos)

;; Should be able to eval-and-replace anywhere.
(global-set-key (kbd "C-c C-e") 'eval-and-replace)


(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)

(require 'move-text)
(global-set-key (kbd "<C-s-down>") 'move-text-down)
(global-set-key (kbd "<C-s-up>") 'move-text-up)

(global-set-key (kbd "C-s-y") 'yank-unindented)
(global-set-key (kbd "C-x u") 'undo-tree-visualize)

(global-set-key (kbd "C-w") 'kill-region-or-backward-word)
(global-set-key (kbd "C-c C-w") 'kill-to-beginning-of-line)

(global-set-key (kbd "C-c z") 'goto-last-change)
(global-set-key (kbd "C-z") 'goto-last-change)
;;;

;;A regexp/replace command for Emacs with interactive visual feedback
(define-key global-map (kbd "C-c r") 'vr/replace)
(define-key global-map (kbd "C-c q") 'vr/query-replace)

(define-key global-map (kbd "C-M-q") 'indent-code-rigidly)
(define-key global-map (kbd "C-M-i") 'indent-code-rigidly)

(define-key global-map (kbd "C-o") 'vi-open-line-below)
(define-key global-map (kbd "C-S-O") 'vi-open-line-above)
(define-key global-map [(meta shift ?o)] 'vi-open-line-above)


(global-set-key (kbd "C-x <up>") 'winner-undo)
(global-set-key (kbd "C-x <down>") 'winner-redo)

;;vim like move
;; (define-key global-map (kbd "C-S-h")
;;   'left-char)

;; (define-key global-map (kbd "C-S-k")
;;   'previous-line)

;; (define-key global-map (kbd "C-S-j")
;;   'next-line)

;; (define-key global-map (kbd "C-S-l")
;;   'right-char)


;; (define-key global-map (kbd "backspace")
;;   (λ (if (region-active-p)
;;          (delete-region)
;;         (delete-backward-char))))

(define-key global-map (kbd "C-S-h")
  'sp-splice-sexp)

(global-set-key (kbd "M-;") 'comment-line-or-comment-block)

(global-set-key (kbd "M-n") 'new-frame)


(provide 'keybinding)
