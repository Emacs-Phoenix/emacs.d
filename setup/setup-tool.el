
;;Calculator计算器 Ctrl + Return
(if (locate-library "calculator")
    (progn
      (autoload 'calculator "calculator"
        "Run the Emacs calculator." t)
      (global-set-key [(control return)] 'calculator)))

(provide 'setup-tool)
