(define-key global-map (kbd "C-S-n")
  (λ (scroll-up-line)
     (scroll-up-line)
     (scroll-up-line)
     (scroll-up-line)
     (scroll-up-line)
     (scroll-up-line)))

(define-key global-map (kbd "C-S-<down>")
  (λ (scroll-up-line)
     (scroll-up-line)
     (scroll-up-line)
     (scroll-up-line)))

(define-key global-map (kbd "C-S-p")
  (λ (scroll-down-line)
     (scroll-down-line)
     (scroll-down-line)
     (scroll-down-line)
     (scroll-down-line)
     (scroll-down-line)))

(define-key global-map (kbd "C-S-<up>")
  (λ (scroll-down-line)
     (scroll-down-line)
     (scroll-down-line)
     (scroll-down-line)))

(define-key global-map (kbd "C-S-f")
  (λ (scroll-left 2)))

(define-key global-map (kbd "C-S-b")
  (λ (scroll-right 2)))

(global-set-key (kbd "M-]") 'forward-sexp)
(global-set-key (kbd "M-[") 'backward-sexp)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  For ErgoDox
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; empty

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  For Mac keyboard
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "H-'") 'previous-buffer)
(global-set-key (kbd "H-;") 'beginning-of-buffer)
(global-set-key (kbd "H-/") 'next-buffer)
(global-set-key (kbd "H-.") 'end-of-buffer)


(provide 'setup-move)

