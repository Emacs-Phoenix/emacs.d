(defun emacs()
  (interactive)
  (call-process (emacsbin-path) nil 0 nil)
  (message "Started 'emacs' - it will be ready soon ..."))

(defun emacs-debug-init()
  (interactive)
  (call-process (emacsbin-path) nil 0 nil "--debug-init")
  (message "Started 'emacs --debug-init' - it will be ready soon ..."))

(defun emacs-reload()
  (interactive)
  (load-file user-init-file)
  (message ".emacs reloaded successfully"))

(defun emacs-Q() (interactive)
  (call-process (emacsbin-path) nil 0 nil "-Q")
  (message "Started 'emacs -Q' - it will be ready soon ..."))

(provide 'live)
