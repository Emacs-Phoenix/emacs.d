(require 'emacs-feedjs)

(setq feedjs--process "/Users/chchen/MY-PROJECT/NodeAtom/app.js")

(define-prefix-command 'emacs-feed-key-map)
(global-set-key (kbd "C-c e") 'emacs-feed-key-map)
(define-key emacs-feed-key-map (kbd "s") 'feedjs)
(define-key emacs-feed-key-map (kbd "k") 'kill-feedjs-process)
(define-key emacs-feed-key-map (kbd "r") 'feedjs-restart-process)
(define-key emacs-feed-key-map (kbd "n") 'feedjs-stop-notify)

;;(run-feedjs)

(provide 'setup-feed)
