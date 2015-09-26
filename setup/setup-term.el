(setq system-uses-terminfo nil)

;;# If you use Cocoa Emacs or Carbon Emacs
;;tic -o ~/.terminfo /Applications/Emacs.app/Contents/Resources/etc/e/eterm-color.ti

(add-hook 'term-mode-hook
          (lambda ()
            (setq term-buffer-maximum-size 10000)))


(defcustom term-unbind-key-list
  '("C-z" "C-x" "C-c" "C-h" "C-y" "<ESC>")
  "The key list that will need to be unbind."
  :type 'list
  :group 'multi-term)

(defcustom term-bind-key-alist
  '(
    ("C-c C-c" . term-interrupt-subjob)
    ("C-p" . previous-line)
    ("C-n" . next-line)
    ("C-s" . isearch-forward)
    ("C-r" . isearch-backward)
    ("C-m" . term-send-raw)
    ("M-f" . term-send-forward-word)
    ("M-b" . term-send-backward-word)
    ("M-o" . term-send-backspace)
    ("M-p" . term-send-up)
    ("M-n" . term-send-down)
    ("M-M" . term-send-forward-kill-word)
    ("M-N" . term-send-backward-kill-word)
    ("M-r" . term-send-reverse-search-history)
    ("M-," . term-send-input)
    ("M-x" . smex)
    ("M-." . comint-dynamic-complete))
  "The key alist that will need to be bind.
If you do not like default setup, modify it, with (KEY . COMMAND) format."
  :type 'alist
  :group 'multi-term)


(add-hook 'term-mode-hook
          (lambda ()
            (add-to-list 'term-bind-key-alist '("M-[" . multi-term-prev))
            (add-to-list 'term-bind-key-alist '("M-]" . multi-term-next))))

(add-hook 'term-mode-hook
          (lambda ()
            (define-key term-raw-map (kbd "C-y") 'term-paste)))


;; (add-hook 'ansi-term-mode-hook
;;           (lambda ()
;;             (define-key term-raw-map (kbd "C-y") 'term-paste)
;;             (define-key term-raw-map [tab] nil)
;;             (define-key term-raw-map (kbd "TAB") nil)
;;             ))


;;anble tab
;;(define-key term-mode-map (read-kbd-macro open) (λ (js2r--self-insert-wrapping open close)))
;;(define-key term-map (kbd "TAB") 'nil)



(provide 'setup-term)
