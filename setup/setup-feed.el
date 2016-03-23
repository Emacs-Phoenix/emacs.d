(require 'emacs-feedjs)


(define-prefix-command 'emacs-feed-key-map)
(global-set-key (kbd "C-c e") 'emacs-feed-key-map)
(define-key emacs-feed-key-map (kbd "s") 'feedjs)
(define-key emacs-feed-key-map (kbd "k") 'kill-feedjs-process)
(define-key emacs-feed-key-map (kbd "r") 'restart-feedjs-process)


(provide 'setup-feed)
