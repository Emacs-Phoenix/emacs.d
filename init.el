(setq initial-frame-alist
      '(
        (width . 170) ; character
        (height . 58) ; lines
        ))

;; default/sebsequent window
;; (setq default-frame-alist
;;       '(
;;         (width . 100) ; character
;;         (height . 52) ; lines
;;         ))


(load "~/.emacs.d/phoenix-init.el")

;; (setq user-emacs-directory "~/.spacemacs.d/")
;; (load "~/.spacemacs.d/init.el")

;;(set-face-attribute 'default nil :height 120)
(setq warning-minimum-level :emergency)

(load-theme 'monokai t)

;; TODO module it
(add-hook 'before-save-hook
          'delete-trailing-whitespace)
