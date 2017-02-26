(require 'mode-mapping)
(require 'appearance)
(require 'default)

;;site-lisp
;;(require 'indent-guide)
(require 'js2-mode)
(require 'markdown-mode)
(require 'flycheck)
(require 'flymake-jshint)
(require 'imenu-anywhere)
(require 'ace-jump-mode)
(require 'expand-region)
(require 's)
(require 'dash)
(require 'goto-last-change)
;;(require 'speed-type)
(require 'sublimity)
(require 'sublimity-scroll)
;;(require 'sublimity-map)
;;(require 'sublimity-attractive)


(require 'undo-tree)
(require 'redo+)
(require 'helm)
(require 'async)
;; (require 'dired-async)
;; (require 'dired+)
(require 'helm-config)

(require 'web-mode)
;; (require 'aggressive-indent)

(require 'ack)
(require 'smart-forward)
;;(require 'line-num)
(require 'tagedit)

(require 'yaml-mode)
(require 'auto-highlight-symbol)
;; (require 'highlight-escape-sequences)
;; (require 'idomenu)

(require 'hungry-delete)
(require 'visual-regexp)

(require 'bm) ;;bookmark (conum mark)
(global-set-key (kbd "<C-f2>") 'bm-toggle)
(global-set-key (kbd "<f2>")   'bm-next)
(global-set-key (kbd "<S-f2>") 'bm-previous)


(require 'change-inner)
(global-set-key (kbd "C-c i") 'change-inner)
(global-set-key (kbd "C-c o") 'change-outer)

(require 'multiple-cursors)
(require 'reveal-in-osx-finder)
(require 'ibuffer-vc) ;;ibuffer 分组

(require 'undohist) ;;记录session之外的undo
(require 'helm-ag)
(require 'helm-ack)
(require 'nginx-mode)
(require 'fixme-mode)


(require 'avy)
(require 'yaml-mode)
(require 'smooth-scroll)
(require 'ansi-color)
(require 'sass-mode)



;;setup
(require 'setup-ido)
(require 'setup-project)
(require 'setup-company)
(require 'setup-tern)
(require 'setup-json)
;; (require 'setup-smartparens)
(require 'setup-pair)
(require 'setup-flycheck)
(require 'setup-yas)
(require 'setup-yas2)
(require 'setup-emmet)
;; (require 'setup-imenu)
(require 'setup-paredit)
(require 'setup-shell)
(require 'setup-hideshow)
(require 'setup-git)
(require 'setup-web-beautify)
(require 'setup-syntax-table)
(require 'setup-recently)
;;(require 'setup-indent-guide) ;;谁开谁傻逼，开了卡成狗
(require 'setup-undo)
;;(require 'setup-auto-indent) ;;狗日的，打开这个在Mac下kill-ring有严重的问题！！！！！！！！！！！！排查死爹了！！！！！！！
(require 'setup-highlight)
(require 'setup-clean)
(require 'setup-color)
(require 'setup-jump)
;;(require 'setup-guide-key)
(require 'setup-which-key)
(require 'setup-python)
(require 'setup-term)
(require 'setup-swoop)
(require 'setup-search)
;;(require 'setup-desktop)
;; (require 'setup-file)
;;(require 'setup-tabbar)
(require 'setup-ibuffer)
(require 'setup-backup)
(require 'setup-tool)
(require 'setup-spell)
(require 'setup-indent)
(require 'setup-misc)
;; (require 'setup-rss)  不知道什么时候有错误 用不了了
(require 'setup-feed)
(require 'setup-org)
(require 'setup-js2)
(require 'setup-clj)
(require 'setup-jsx)
(require 'setup-scss)
(require 'anzu)
;; (require 'setup-tags)
(require 'setup-pretty)
(require 'setup-elisp)
(require 'setup-dictionary)
(require 'setup-move)
(require 'setup-powerline)
(require 'setup-window)
(require 'setup-html)
(require 'setup-markdown)
(require 'setup-web)
(require 'setup-css)
(require 'setup-document)
(require 'setup-restclient)
(require 'setup-neotree)
(require 'setup-string)
;; (require 'setup-backup) ;; 好卡

(when is-mac (require 'setup-mac))


;;my site-lisp
(require 'transparent)
(require 'hippie)
(require 'edit-sword)
(require 'emacs-uglify)
(require 'reveal-dir)
(require 'emacs-boilerplate)
(require 'eye-care)

; (require 'pair-jump)
(require 'osx-tools)

(require 'trigger)
(require 'keybinding)

(require 'setup-mykeybinding)

(require 'behavior)


;; (require 'saveplace)
;; (setq-default save-place t)
;; save the place of the cursor of the buffers which where open at that moment
;; 焦点变一下就自动保存，跑测试受不了

(provide 'component)
