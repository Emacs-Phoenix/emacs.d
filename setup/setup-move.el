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

(define-key global-map (kbd "<triple-wheel-right>")
  (λ (scroll-left 2)))

(define-key global-map (kbd "<double-wheel-right>")
  (λ (scroll-left 2)))

(define-key global-map (kbd "<triple-wheel-left>")
  (λ (scroll-right 2)))

(define-key global-map (kbd "<double-wheel-left>")
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
(global-set-key (kbd "H-p") 'previous-buffer)
(global-set-key (kbd "H-;") 'beginning-of-buffer)
(global-set-key (kbd "H-/") 'next-buffer)
(global-set-key (kbd "H-n") 'previous-buffer)
(global-set-key (kbd "H-.") 'end-of-buffer)


(global-set-key (kbd "M-<up>") 'smart-up)
(global-set-key (kbd "M-<down>") 'smart-down)
(global-set-key (kbd "M-<left>") 'smart-backward)
(global-set-key (kbd "M-<right>") 'smart-forward)


(global-set-key (kbd "<prior>") 'previous-buffer)
(global-set-key (kbd "<home>") 'beginning-of-buffer)
(global-set-key (kbd "<next>") 'next-buffer)
(global-set-key (kbd "<end>") 'end-of-buffer)


(provide 'setup-move)

