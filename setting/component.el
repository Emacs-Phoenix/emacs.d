(require 'mode-mapping)
(require 'appearance)
(require 'default)




;;site-lisp
;;(require 'indent-guide)
(require 'js2-mode)
(require 'markdown-mode)
;;(require 'ggtags) ;;already delete
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
(require 'project-explorer)
;;(require 'sublimity-map)
;;(require 'sublimity-attractive)


(require 'undo-tree)
(require 'redo+)
(require 'helm)
(require 'async)
;; (require 'dired-async) 
;; (require 'dired+)
(require 'helm-config)
(require 'helm-swoop)
(require 'names) 
(require 'web-mode)
;; (require 'aggressive-indent)

(require 'ack)
(require 'smart-forward)
;;(require 'browse-kill-ring)
;;(require 'line-num)
(require 'tagedit)

(require 'yaml-mode)
(require 'simplezen)
(require 'dockerfile-mode)
(require 'auto-highlight-symbol)
;; (require 'highlight-escape-sequences)
;; (require 'idomenu)

(require 'markdown-mode+)
;;(require 'symon)  ;;tiny graphical system monitor
(require 'hungry-delete)
(require 'visual-regexp)
;;(require 'coffee-mode)
;;(require 'find-file-in-project)
;;(require 'pangu-spacing) ;;小伙子，在英文旁边加空格
;;(require 'desktop-recover) 


(require 'tss) ;;Provide a interface for auto-complete.el/flymake.el on typescript-mode.

(require 'bm) ;;bookmark (conum mark)
(global-set-key (kbd "<C-f2>") 'bm-toggle)
(global-set-key (kbd "<f2>")   'bm-next)
(global-set-key (kbd "<S-f2>") 'bm-previous)
(global-set-key (kbd "<left-fringe> <mouse-5>") 'bm-next-mouse)
(global-set-key (kbd "<left-fringe> <mouse-4>") 'bm-previous-mouse)
(global-set-key (kbd "<left-fringe> <mouse-1>") 'bm-toggle-mouse)

;;(require 'vlf-setup) ;;big file only read

(require 'change-inner)
(global-set-key (kbd "C-c i") 'change-inner)
(global-set-key (kbd "C-c o") 'change-outer)

(require 'multiple-cursors)
(require 'reveal-in-osx-finder)
(require 'lacarte)
(require 'ibuffer-vc) ;;ibuffer 分组
;; (require 'ibuffer-projectile)
;; (require 'less-css-mode)
;; (require 'helm-backup)
(require 'undohist) ;;记录session之外的undo
;; (require 'etxt) ;; read ebook
(require 'ranger)
(require 'helm-ag)
(require 'helm-ack)

(require 'nginx-mode)
;; (require 'circe)
(require 'fixme-mode)
;;(require 'sos)

;;(require 'chinese-fonts-setup)
;;(require 'chinese-pyim)
;;(require 'vimish-fold);;vim like fold code
;;(require 'windresize)
;;(require 'uimage) ;;显示图片
;;(require 'nodejs-repl)
;;(require 'ace-jump-buffer)
(require 'avy)
;; (require 'setup-aggressive-indent) ;;进击的模式 auto indent
;; (require 'esup) ;;Emacs Start Up Profiler
(require 'yaml-mode)
(require 'smooth-scroll)
;;(require 'showkey) ;;Display what keys are being typed in emacs in real-time.
(require 'ansi-color)
;;(require 'typo)
(require 'eproject)
;;(require 'xah-css-mode)



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
(require 'setup-magit)
(require 'setup-web-beautify)
(require 'setup-syntax-table)
(require 'setup-recently)
;;(require 'setup-indent-guide) ;;谁开谁傻逼，开了卡成狗
(require 'setup-undo)
;;(require 'setup-auto-indent) ;;狗日的，打开这个在Mac下kill-ring有严重的问题！！！！！！！！！！！！排查死爹了！！！！！！！
(require 'setup-highlight)
(require 'setup-color)
(require 'setup-jump)
;;(require 'setup-guide-key)
(require 'setup-which-key)
(require 'setup-python)
(require 'setup-term)
(require 'setup-search)
;;(require 'setup-desktop)
;; (require 'setup-file)
;;(require 'setup-tabbar)
(require 'setup-ibuffer)
(require 'setup-backup)
(require 'setup-tool)
(require 'setup-spell)
(require 'setup-indent)
;; (require 'setup-emms)
(require 'setup-misc)
;;(require 'setup-erc)
(require 'setup-rss)
(require 'setup-feed)
;;(require 'setup-doubanfm)
(require 'setup-org)
(require 'setup-js2)
(require 'setup-clj)
(require 'setup-jsx)
(require 'setup-go)
(require 'setup-scss)
;;(require 'setup-tramp)
(require 'anzu)
(require 'setup-haskell)
;; (require 'setup-tags)
;; (require 'setup-wakatime)
;; (require 'setup-geolocation)
;; (require 'setup-perspective) ;; emacs buffer 分区
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
(require 'setup-restclient)
(require 'setup-neotree)
(require 'setup-project-explorer)
;; (require 'setup-eye)
;; (require 'setup-backup) ;; 好卡
(require 'setup-tss)

(when is-mac (require 'setup-mac))


;;my site-lisp
(require 'transparent)
(require 'hippie)
;;(require 'js2-extra)
;;(require 'html-extra)
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
(provide 'component)

