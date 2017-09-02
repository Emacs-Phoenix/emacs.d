;; JavaScript
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.ts$" . web-mode))
(add-to-list 'auto-mode-alist '("/Users/chchen/MY-PROJECT/OctopusApp/.*\\.js[x]?$" . web-mode))
(add-to-list 'auto-mode-alist '("/Users/chchen/Octopus/web-octopus/.*\\.js[x]?$" . web-mode))
(add-to-list 'auto-mode-alist '("/Users/chchen/MY-PROJECT/octopus-backend/.*\\.js[x]?$" . web-mode))
(add-to-list 'auto-mode-alist '("/Users/chchen/Haseo-WEB/.*\\.js[x]?$" . web-mode))
(add-to-list 'auto-mode-alist '("/Users/chchen/Project/DataCenter/.*\\.js[x]?$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))
(add-to-list 'auto-mode-alist '("\\.jshintrc$" . javascript-mode))
(add-to-list 'magic-mode-alist '("#!/usr/bin/env node" . js2-mode))
(add-to-list 'auto-mode-alist '("\\rc$" . json-mode))

;; HTML
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ejs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

;; CSS
(add-to-list 'auto-mode-alist '("\\.scss$" . css-mode))

;; Emacs lisp
(add-to-list 'auto-mode-alist '("Carton$" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("Cask$" . emacs-lisp-mode))

;; Snippets
(add-to-list 'auto-mode-alist '("yasnippet/snippets" . snippet-mode))
(add-to-list 'auto-mode-alist '("\\.yasnippet$" . snippet-mode))

;;markdown
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

(provide 'mode-mapping)
