(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")

(define-key my-keys-minor-mode-map (kbd "C-/") 'imenu-anywhere)
(define-key my-keys-minor-mode-map (kbd "C-r") 'isearch-forward-use-region)
(define-key my-keys-minor-mode-map (kbd "C-o") 'vi-open-line-below)
(define-key my-keys-minor-mode-map (kbd "C-M-q") 'indent-code-rigidly)
(define-key my-keys-minor-mode-map (kbd "C-M-i") 'indent-code-rigidly)
(define-key my-keys-minor-mode-map (kbd "<prior>") 'previous-buffer)
(define-key my-keys-minor-mode-map (kbd "<home>") 'beginning-of-buffer)
(define-key my-keys-minor-mode-map (kbd "<next>") 'next-buffer)
(define-key my-keys-minor-mode-map (kbd "<end>") 'end-of-buffer)

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " my-keys" 'my-keys-minor-mode-map)

(defun my-minibuffer-setup-hook ()
  (my-keys-minor-mode 0))

(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)

(my-keys-minor-mode 1)

(defadvice loadkey (after give-my-keybindings-priority)
  "Try to ensure that my keybindings always have priority."
  (if (not (eq (car (car minor-mode-map-alist)) 'my-keys-minor-mode))
      (let ((mykeys (assq 'my-keys-minor-mode minor-mode-map-alist)))
        (assq-delete-all 'my-keys-minor-mode minor-mode-map-alist)
        (add-to-list 'minor-mode-map-alist mykeys))))
(ad-activate 'loadkey)



(provide 'setup-mykeybinding)
