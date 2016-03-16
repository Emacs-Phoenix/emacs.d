(defvar mac-keybinding-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")

(define-key mac-keybinding-minor-mode-map (kbd "M-v") 'yank)
(define-key mac-keybinding-minor-mode-map (kbd "M-c") 'save-region-or-current-line)
(define-key mac-keybinding-minor-mode-map (kbd "M-x")
  (λ (if (region-active-p)
         (paredit-kill-region-or-backward-word))))
(define-key mac-keybinding-minor-mode-map (kbd "s-x") 'smex)
(define-key mac-keybinding-minor-mode-map (kbd "s-X") 'smex-major-mode-commands)
(global-set-key (kbd "s-x") 'smex)
(global-set-key (kbd "s-X") 'smex-major-mode-commands)



(define-minor-mode mac-keybinding-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " mac-keys" 'mac-keybinding-minor-mode-map)

(defun mac-keybinding-minibuffer-setup-hook ()
  (mac-keybinding-minor-mode 0))

(add-hook 'minibuffer-setup-hook 'mac-keybinding-minibuffer-setup-hook)

(mac-keybinding-minor-mode 1)

(defadvice loadkey (after give-my-keybindings-priority)
  "Try to ensure that my keybindings always have priority."
  (if (not (eq (car (car minor-mode-map-alist)) 'mac-keybinding-minor-mode))
      (let ((mykeys (assq 'mac-keybinding-minor-mode minor-mode-map-alist)))
        (assq-delete-all 'mac-keybinding-minor-mode minor-mode-map-alist)
        (add-to-list 'minor-mode-map-alist mykeys))))
(ad-activate 'loadkey)

(provide 'setup-mac-keybinding)
