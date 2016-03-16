(require 'osx-dictionary)
;; 要到 dictionary.app 应用里面选择默认的词典
(require 'chinese-word-at-point)
(setq osx-dictionary-use-chinese-text-segmentation t)

(require 'emacs-translate)
(global-set-key (kbd "C-c d") 'osx-dictionary-search-pointer)

(define-prefix-command 'translate-map)
(global-set-key (kbd "M-t") 'translate-map)
(define-key translate-map (kbd "t") 'baidu-translate)
(define-key translate-map (kbd "c") 'baidu-translate-command)
(define-key translate-map (kbd "y") 'yank-translate-result)


(provide 'setup-dictionary)
