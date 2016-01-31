
;;Calculator计算器 C-x Ctrl + Return
(if (locate-library "calculator")
    (progn
      (autoload 'calculator "calculator"
        "Run the Emacs calculator." t)
      (global-set-key (kbd "C-x <C-return>") 'calculator)))

(defun emacs-shell ()
  (interactive)
  (ielm))

(provide 'setup-tool)
