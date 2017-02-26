(require 'emacs-feedjs)

(setq feedjs--process "/Users/chchen/MY-PROJECT/NodeAtom/app.js")

(define-prefix-command 'emacs-feed-key-map)
(global-set-key (kbd "C-c e") 'emacs-feed-key-map)
(define-key emacs-feed-key-map (kbd "s") 'feedjs)
(define-key emacs-feed-key-map (kbd "k") 'feedjs-kill-process)
(define-key emacs-feed-key-map (kbd "r") 'feedjs-restart-process)
(define-key emacs-feed-key-map (kbd "n") 'feedjs-start-notify)

(provide 'setup-feed)
