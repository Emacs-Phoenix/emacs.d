(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")

(define-key my-keys-minor-mode-map (kbd "C-i") 'idomenu)
(define-key my-keys-minor-mode-map (kbd "C-/") 'imenu-anywhere)
(define-key my-keys-minor-mode-map (kbd "C-r") 'isearch-forward-use-region)

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " my-keys" 'my-keys-minor-mode-map)

(defun my-minibuffer-setup-hook ()
  (my-keys-minor-mode 0))

(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)

(defadvice loadkey (after give-my-keybindings-priority)
  "Try to ensure that my keybindings always have priority."
  (if (not (eq (car (car minor-mode-map-alist)) 'my-keys-minor-mode))
      (let ((mykeys (assq 'my-keys-minor-mode minor-mode-map-alist)))
        (assq-delete-all 'my-keys-minor-mode minor-mode-map-alist)
        (add-to-list 'minor-mode-map-alist mykeys))))
(ad-activate 'loadkey)

(my-keys-minor-mode 1)

(provide 'setup-mykeybinding)
