(global-prettify-symbols-mode 1)

;; http://xahlee.info/comp/unicode_arrows.html
(defun js-pretty-lambda ()
  "make some word or string show as pretty Unicode symbols"
  (setq prettify-symbols-alist
        '(
          ;; ("function" . 10770)             ; ⨍
          ("return" . 10145)    ; ➡
          
          
          ;; ("+" . 8853)
          ;; ("-" . 8854)
          ;; ("*" . 8855)
          ;; ("/" . 8856)
          )))

(add-hook 'js2-mode-hook 'js-pretty-lambda)


(defun py-pretty-lambda ()
  "make some word or string show as pretty Unicode symbols"
  (setq prettify-symbols-alist
        '(
          ("def" . 10765)  ; ⨍
          ("return" . 10145)    ; ➡ 
          )))

(add-hook 'python-mode-hook 'py-pretty-lambda)

(defun css-pretty-lambda ()
  "make some word or string show as pretty Unicode symbols"
  (setq prettify-symbols-alist
        '(
          (":" . 8788)  
          
          )))

(add-hook 'css-mode-hook 'css-pretty-lambda)


(defun html-pretty-lambda ()
  "make some word or string show as pretty Unicode symbols"
  (setq prettify-symbols-alist
        '(
          ("div" . 8709)
          ("/div" . 8709)
          
          )))

;;(add-hook 'html-mode-hook 'html-pretty-lambda)






(provide 'setup-pretty)
