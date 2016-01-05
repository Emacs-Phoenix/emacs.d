(require 'yasnippet)
(yas-global-mode 1)
(setq yas-dir
      (expand-file-name "snippets" user-emacs-directory))


;;; use popup menu for yas-choose-value
(require 'popup)

;; add some shotcuts in popup menu mode
(define-key popup-menu-keymap (kbd "M-n") 'popup-next)
(define-key popup-menu-keymap (kbd "TAB") 'popup-next)
(define-key popup-menu-keymap (kbd "<tab>") 'popup-next)
(define-key popup-menu-keymap (kbd "<backtab>") 'popup-previous)
(define-key popup-menu-keymap (kbd "M-p") 'popup-previous)

(defun yas-popup-isearch-prompt (prompt choices &optional display-fn)
  (when (featurep 'popup)
    (popup-menu*
     (mapcar
      (lambda (choice)
        (popup-make-item
         (or (and display-fn (funcall display-fn choice))
             choice)
         :value choice))
      choices)
     :prompt prompt
     ;; start isearch mode immediately
     :isearch t
     )))

(setq yas-prompt-functions '(yas-popup-isearch-prompt yas-ido-prompt yas-no-prompt))


;;http://emacs.stackexchange.com/questions/7908/how-to-make-yasnippet-and-company-work-nicer
(defun check-expansion ()
  (save-excursion
    (if (looking-at "\\_>") t
      (backward-char 1)
      (if (looking-at "\\.") t
        (backward-char 1)
        (if (looking-at "->") t nil)))))

(defun do-yas-expand ()
  (let ((yas/fallback-behavior 'return-nil))
    (yas/expand)))

(defun tab-indent-or-complete ()
  (interactive)
  (cond
   ((minibufferp)
    (minibuffer-complete))
   (t
    (indent-for-tab-command)
    (if (or (not yas/minor-mode)
            (null (do-yas-expand)))
        (if (check-expansion)
            (progn
              (company-manual-begin)
              (if (null company-candidates)
                  (progn
                    (company-abort)
                    (indent-for-tab-command)))))))))

(defun pair-jump-or-tab ()
  (interactive)

  (let ((after-char (string (char-after)))
        (before-char (string (char-before))))
    (cond ((or (equal after-char "(")
               (equal after-char "{")
               (equal after-char "\"")
               (equal after-char "[")
               ;; (equal before-char "(")
               ;; (equal before-char "{")
               ;; (equal before-char "\"")
               ;; (equal before-char "[")
               )
           (forward-sexp))
          ((or;; (equal after-char ")")
            ;; (equal after-char "}")
            ;; (equal after-char "\"")
            ;; (equal after-char "]")
            (equal before-char ")")
            (equal before-char "}")
            (equal before-char "\"")
            (equal before-char "]"))
           (backward-sexp))
          (t
           (indent-for-tab-command)))))

(advice-add 'tab-indent-or-complete :before #'pair-jump-or-tab)

(defun tab-complete-or-next-field ()
  (interactive)
  (if (or (not yas/minor-mode)
          (null (do-yas-expand)))
      (if company-candidates
          (company-complete-selection)
        (if (check-expansion)
            (progn
              (company-manual-begin)
              (if (null company-candidates)
                  (progn
                    (company-abort)
                    (yas-next-field))))
          (yas-next-field)))))

(defun expand-snippet-or-complete-selection ()
  (interactive)
  (if (or (not yas/minor-mode)
          (null (do-yas-expand))
          (company-abort))
      (company-complete-selection)))

(defun complete-selection ()
  (interactive)
  (company-complete-selection))

(defun abort-company-or-yas ()
  (interactive)
  (if (null company-candidates)
      (yas-abort-snippet)
    (company-abort)))

;;绑定这个在term下tab键会失效，容我想想办法
;;(global-set-key [tab] 'tab-indent-or-complete)
;;(global-set-key (kbd "TAB") 'tab-indent-or-complete)

(define-key js2-mode-map (kbd "TAB") 'tab-indent-or-complete)
(define-key html-mode-map (kbd "TAB") 'tab-indent-or-complete)
(define-key emacs-lisp-mode-map (kbd "TAB") 'tab-indent-or-complete)
(define-key emacs-lisp-mode-map ["tab"] 'tab-indent-or-complete)

(global-set-key [(control return)] 'company-complete-common)

;; (define-key company-active-map [tab] 'expand-snippet-or-complete-selection)
;; (define-key company-active-map (kbd "TAB") 'expand-snippet-or-complete-selection)
(define-key company-active-map [tab] 'complete-selection)
(define-key company-active-map (kbd "TAB") 'complete-selection)



(define-key yas-minor-mode-map [tab] nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)

(define-key yas-keymap [tab] 'tab-complete-or-next-field)
(define-key yas-keymap (kbd "TAB") 'tab-complete-or-next-field)
(define-key yas-keymap [(control tab)] 'yas-next-field)
(define-key yas-keymap (kbd "C-g") 'abort-company-or-yas)

(provide 'setup-yas)
