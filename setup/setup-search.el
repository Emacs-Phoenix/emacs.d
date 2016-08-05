;; anzu
(require 'anzu)
(global-anzu-mode +1)

;;;ack
(autoload 'ack-same "full-ack" nil t)
(autoload 'ack "full-ack" nil t)
(autoload 'ack-find-same-file "full-ack" nil t)
(autoload 'ack-find-file "full-ack" nil t)

;;;helm-ack
(require 'helm-config)
(require 'helm-multi-match)
(require 'helm-ack)
(require 'helm-migemo)

(custom-set-variables
 ;; Does not insert '--type' option
 '(helm-ack-auto-set-filetype nil)
 ;; Insert "thing-at-point 'symbol" as search pattern
 '(helm-ack-thing-at-point 'symbol))

;; ag 
(require 'ag)
(setq ag-highlight-search t)
(setq ag-reuse-window 't)
(global-set-key (kbd "M-s s") 'ag)
(global-set-key (kbd "M-s h") 'helm-ag)

;; fzf
(require 'fzf)
(global-set-key (kbd "M-s z") 'fzf)


(provide 'setup-search)
