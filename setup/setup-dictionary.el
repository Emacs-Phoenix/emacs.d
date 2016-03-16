(require 'osx-dictionary)
;; 要到 dictionary.app 应用里面选择默认的词典
(require 'chinese-word-at-point)
(setq osx-dictionary-use-chinese-text-segmentation t)

(require 'emacs-translate)
(global-set-key (kbd "C-c d") 'osx-dictionary-search-pointer)

(provide 'setup-dictionary)
