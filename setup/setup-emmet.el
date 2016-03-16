(require 'emmet-mode)


;;(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
(add-hook 'html-mode-hook  'emmet-mode)
(add-hook 'web-mode-hook  'emmet-mode)

(provide 'setup-emmet)
