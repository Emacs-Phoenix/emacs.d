(setq mouse-wheel-scroll-amount '(6 ((shift) . 6))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 6) ;; keyboard scroll one line at a time


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


;;disable tabbar-mode
(tabbar-mode -1)

;;hightlist TODO FIXME keyword
(fixme-mode 1)

(provide 'behavior)
