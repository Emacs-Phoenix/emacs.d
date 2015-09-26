(require 'mode-mapping)
(require 'appearance)
(require 'behavior)
(require 'default)


;;site-lisp
(require 'indent-guide)
(require 'js2-mode)
;;(require 'ggtags)
(require 'flycheck)
(require 'smartparens-config)
(require 'powerline)
(require 'rainbow-delimiters)
(require 'imenu-anywhere)
(require 'ace-jump-mode)
(require 'expand-region)
(require 's)
(require 'dash)
(require 'goto-last-change)
(require 'shell-pop)
(require 'multi-term)
(require 'eyebrowse) ;;小眼睛模式
(require 'zone-matrix)
;;(require 'zone-settings) ;;酷炫，但是很烧cpu
(require 'tabbar)
(require 'sublimity)
(require 'sublimity-scroll)
;;(require 'sublimity-map)
;;(require 'sublimity-attractive)
(require 'neotree)
(require 'ztree)
(require 'undo-tree)
(require 'redo+)
(require 'helm)
(require 'async)
(require 'nyan-mode)
(require 'dired-async)
(require 'helm-config)
(require 'helm-swoop)
(require 'names)
(require 'web-mode)
(require 'aggressive-indent)
(require 'company-web-html)
(require 'ack)
(require 'quick-buffer-switch)
(require 'smart-forward)
(require 'browse-kill-ring)
(require 'line-num)
(require 'tagedit)
(require 'rainbow-mode)
(require 'yaml-mode)
;;(require 'prodigy)
(require 'simplezen)
(require 'restclient)
(require 'dockerfile-mode)
(require 'auto-highlight-symbol)
(require 'highlight-escape-sequences)
(require 'idomenu)
(require 'company-jedi)
(require 'markdown-mode+)
(require 'symon)
(require 'hungry-delete)
(require 'visual-regexp)
(require 'coffee-mode)
(require 'find-file-in-project) 
(require 'pangu-spacing) ;;小伙子，在英文旁边加空格
(require 'desktop-recover)
(require 'company-quickhelp)
(require 'typescript)
(require 'tss) 
;;(require 'setnu) ;;buggly
(require 'bm)
(require 'vlf-setup)
(require 'change-inner)
(require 'multiple-cursors)
(require 'reveal-in-osx-finder)
(require 'lacarte)
(require 'ibuffer-vc)
(require 'ibuffer-projectile)
(require 'less-css-mode)
(require 'helm-backup)
(require 'undohist)

(require 'setup-aggressive) ;;进击的模式
;;setup
(require 'setup-ido)
(require 'setup-project)
;;(require 'setup-ggtags)
(require 'setup-company)
(require 'setup-tern)
(require 'setup-smartparens)
(require 'setup-flycheck)
(require 'setup-yas)
(require 'setup-emmet)
(require 'setup-imenu)
(require 'setup-paredit)
(require 'setup-shell)
(require 'setup-hideshow)
;;(require 'setup-perspective) ;;没啥用
(require 'setup-magit)
(require 'setup-web-beautify)
(require 'setup-syntax-table)
(require 'setup-recently)
;;(require 'setup-indent-guide) ;;谁开谁傻逼，开了卡成狗
(require 'setup-undo)
;;(require 'setup-auto-indent) ;;狗日的，打开这个在Mac下kill-ring有严重的问题！！！！！！！！！！！！排查死爹了！！！！！！！
(require 'setup-highlight)
(require 'setup-rainbow-mode)
(require 'setup-jump)
(require 'setup-guide-key)
(require 'setup-python)
(require 'setup-term)
(require 'setup-search)
(require 'setup-desktop)
(require 'setup-file)
(require 'setup-tabbar)
(require 'setup-ibuffer)
(require 'setup-backup)
(when is-mac (require 'setup-mac))

;;my site-lisp
(require 'transparent)
(require 'hippie)
(require 'js2-extra)
(require 'html-extra)
(require 'edit-sword)

(require 'trigger)
(require 'keybinding)

(require 'setup-mykeybinding)

(provide 'component)
