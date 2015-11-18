(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time

(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling

(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

(setq scroll-step 1) ;; keyboard scroll one line at a time

;; Run at full power please
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; Answering just 'y' or 'n' will do
;;(defalias 'yes-or-no-p 'y-or-n-p)
;; (defun my-yes-or-mumble-p (prompt)
;;   "PROMPT user with a yes-or-no question, but only test for yes."
;;   (if (string= "y"
;;                (downcase
;;                 (read-from-minibuffer
;;                  (concat prompt "(y or n) "))))
;;       t
;;     nil))

;;(defalias 'yes-or-no-p 'my-yes-or-mumble-p)


(require 'diminish)

(eval-after-load "smartparens"
  '(diminish 'smartparens-mode))

(eval-after-load "guide-key"
  '(diminish 'guide-key-mode))

(eval-after-load "undo-tree"
  '(diminish 'undo-tree-mode))

(eval-after-load "projectile"
  '(diminish 'projectile-mode))

(eval-after-load "yas-minor-mode"
  '(diminish 'yas-minor-mode))

(eval-after-load "auto-complete"
  '(diminish 'auto-complete-mode))

(eval-after-load "yasnippet"
  '(diminish 'yas-minor-mode))

(eval-after-load "flyspell"
  '(diminish 'flyspell-mode))

(eval-after-load "eldoc"
  '(diminish 'eldoc-mode))

(eval-after-load "git-gutter"
  '(diminish 'git-gutter-mode))

(eval-after-load "whitespace-cleanup-mode"
  '(diminish 'whitespace-cleanup-mode))

(eval-after-load 'flycheck
  '(diminish 'flycheck-mode))

(diminish 'abbrev-mode)
(eval-after-load 'auto-revert-mode
  '(diminish 'auto-revert-mode))

(diminish 'my-keys-minor-mode)
(diminish 'which-key-mode)
(diminish 'subword-mode)

(eval-after-load 'awk-mode
  '(diminish 'awk-mode))



;;hightlist TODO FIXME keyword
(fixme-mode 1)
(diminish 'fixme-mode)
(diminish 'paredit-mode)
(diminish 'emmet-mode)
(diminish 'anzu-mode)
(diminish 'tagedit-mode)
(diminish 'aggressive-indent-mode)
(diminish 'auto-highlight-symbol-mode)

;;解决有时候鼠标选不中的问题，来自李杀的教导
(transient-mark-mode 1)
(delete-selection-mode 1)

;;尼玛，索性不要鼠标滚动算了
(mouse-wheel-mode -1)

(provide 'behavior)

