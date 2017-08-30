(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#454545" "#cd5542" "#6aaf50" "#baba36" "#5180b3" "#ab75c3" "#bdbc61" "#bdbdb3"])
 '(ansi-term-color-vector
   [unspecified "#343d46" "#bf616a" "#a3be8c" "#ebcb8b" "#8fa1b3" "#b48ead" "#8fa1b3" "#dfe1e8"] t)
 '(cider-cljs-boot-repl
   "(do (require 'cljs.repl.node) (cemerick.piggieback/cljs-repl (cljs.repl.node/repl-env)))")
 '(cider-cljs-gradle-repl
   "(do (require 'cljs.repl.node) (cemerick.piggieback/cljs-repl (cljs.repl.node/repl-env)))")
 '(cider-cljs-lein-repl
   "(do (require 'cljs.repl.node) (cemerick.piggieback/cljs-repl (cljs.repl.node/repl-env)))")
 '(column-number-mode t)
 '(compilation-message-face (quote default))
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("b571f92c9bfaf4a28cb64ae4b4cdbda95241cd62cf07d942be44dc8f46c491f4" "7356632cebc6a11a87bc5fcffaa49bae528026a78637acd03cae57c091afd9b9" "fb0234f37de07754227864ceb11bad7d7decc74d2853ac635f9f8715ba917a20" "5999e12c8070b9090a2a1bbcd02ec28906e150bb2cdce5ace4f965c76cf30476" "98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" "5dc0ae2d193460de979a463b907b4b2c6d2c9c4657b2e9e66b8898d2592e3de5" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "de2c46ed1752b0d0423cde9b6401062b67a6a1300c068d5d7f67725adc6c3afb" "f41fd682a3cd1e16796068a2ca96e82cfd274e58b978156da0acce4d56f2b0d5" "41b6698b5f9ab241ad6c30aea8c9f53d539e23ad4e3963abff4b57c0f8bf6730" "0a67c29cc87f7773beafb7b457dd829eb52e0a175c10cfc91fc48e8d9981e001" "978ff9496928cc94639cb1084004bf64235c5c7fb0cfbcc38a3871eb95fa88f6" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "e003c6adea3ddbbe092c6e2db2e48a1deed2fd06c89534c886bad99fd15e0fc1" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "08b8807d23c290c840bbb14614a83878529359eaba1805618b3be7d61b0b0a32" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "67a0265e2497207f5f9116c4d2bfbbab4423055e3ab1fa46ea6bd56f7e322f6a" "41fdf489f0144f81787c766d1ecad512a910beaa7bb605891b1c08c109aa11c6" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "12b4427ae6e0eef8b870b450e59e75122d5080016a9061c9696959e50d578057" "25e803c02e139e480508c9f7545c6062a0ff861ce11f31b71fa1217154cf6009" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "cfa7053f155661faa33ef648f55d524eb97854f8f0ff9ff91a08b3ba47a9a25f" "06b2849748590f7f991bf0aaaea96611bb3a6982cad8b1e3fc707055b96d64ca" "74278d14b7d5cf691c4d846a4bbf6e62d32104986f104c1e61f718f9669ec04b" "0fb7a2477003cae53303f9cd4600e3f8d45b5bbdacbe0bffc486a09c7b182cb1" "46fd293ff6e2f6b74a5edf1063c32f2a758ec24a5f63d13b07a20255c074d399" "7bde52fdac7ac54d00f3d4c559f2f7aa899311655e7eb20ec5491f3b5c533fe8" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "405fda54905200f202dd2e6ccbf94c1b7cc1312671894bc8eca7e6ec9e8a41a2" "4f5bb895d88b6fe6a983e63429f154b8d939b4a8c581956493783b2515e22d6d" "9ecfe88e1068e5da165a5859888392bef3891ca744b287d6d6f21404cce4d141" "ea005860c3b627fd02420de511a63d5a88e55ba55f24f8d1e0ad2930180ac40d" "3c5687290423e5cd7138f5453c66e015a18f5c8509431c5ba30d89d68f30b7f0" "cab6c71ad251a6cebb357e5fa3dfeaf99daee9b04f21dc846026fc926917b9c3" "613a7c50dbea57860eae686d580f83867582ffdadd63f0f3ebe6a85455ab7706" "f34b107e8c8443fe22f189816c134a2cc3b1452c8874d2a4b2e7bb5fe681a10b" "5e5a16078993032c842aa079da17cec6f5891c2b0e2fd4a98309f972064158cb" default)))
 '(fci-rule-color "#383838")
 '(flycheck-display-errors-function (function flycheck-pos-tip-error-messages))
 '(global-whitespace-mode t)
 '(helm-ack-auto-set-filetype nil)
 '(helm-ack-thing-at-point (quote symbol))
 '(highlight-changes-colors ("#FD5FF0" "#AE81FF"))
 '(highlight-tail-colors
   (quote
    (("#49483E" . 0)
     ("#67930F" . 20)
     ("#349B8D" . 30)
     ("#21889B" . 50)
     ("#968B26" . 60)
     ("#A45E0A" . 70)
     ("#A41F99" . 85)
     ("#49483E" . 100))))
 '(hl-sexp-background-color "#1c1f26")
 '(linum-format " %5i ")
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (helm-perspeen perspeen beacon focus ranger ctags-update company-sourcekit darktooth-theme tangotango-theme gruvbox-theme molokai-theme alect-themes material-theme eslint-fix auto-minor-mode manage-minor-mode exec-path-from-shell prettier-js dired+ atom-one-dark-theme dashboard cider-nrepl anaconda-mode appt company-quickhelp inf-clojure perspective smart-forward jade-mode jshint jshint-mode paredit-everywhere slime rainbow-mode raml-mode which-key fixmee fixme-mode windreszie idomenu ido-hacks company-jedi markdown-mode-plus markdown-mode nginx-mode squiggly-clojure flx jedi smex sublimity bash-completion showkey anzu undo-tree redo+ reveal-in-osx-finder highlight-symbol ido-at-point restclient vimish-fold whitespace-cleanup-mode tss clj-refactor pythonic tern-auto-complete tern avy swift-mode ace-jump-mode less-css-mode ibuffer-projectile company-mode nyan-mode jquery-doc helm-ag helm-ack bm web emacs-web git-gutter elpy window-numbering neotree company-web emacs-neotree expand-region go-mode hungry-delete go-mode-autoloads js2-mode)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(shell-pop-full-span t)
 '(shell-pop-term-shell "/bin/zsh")
 '(shell-pop-universal-key "C-t")
 '(shell-pop-window-position "bottom")
 '(shell-pop-window-size 30)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(weechat-color-list
   (unspecified "#272822" "#49483E" "#A20C41" "#F92672" "#67930F" "#A6E22E" "#968B26" "#E6DB74" "#21889B" "#66D9EF" "#A41F99" "#FD5FF0" "#349B8D" "#A1EFE4" "#F8F8F2" "#F8F8F0"))
 '(whitespace-line-column 2000))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(set-face-attribute 'default nil :height 120)
