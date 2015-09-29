(setq mouse-wheel-scroll-amount '(6 ((shift) . 6))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 6) ;; keyboard scroll one line at a time


;; Run at full power please
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; Answering just 'y' or 'n' will do
;;(defalias 'yes-or-no-p 'y-or-n-p)
;; (defun my-yes-or-mumble-p (prompt)
;;   "PROMPT user with a yes-or-no question, but only test for yes."
;;   (if (string= "y"
;;                (downcase
;;                 (read-from-minibuffer
;;                  (concat prompt "(y or n) "))))
;;       t
;;     nil))

;;(defalias 'yes-or-no-p 'my-yes-or-mumble-p)

(defun my-y-or-n-p (prompt)
  "Ask user a \"y or n\" question.  Return t if answer is \"y\".
PROMPT is the string to display to ask the question.  It should
end in a space; `y-or-n-p' adds \"(y or n) \" to it.

No confirmation of the answer is requested; a single character is
enough.  SPC also means yes, and DEL means no.

To be precise, this function translates user input into responses
by consulting the bindings in `query-replace-map'; see the
documentation of that variable for more information.  In this
case, the useful bindings are `act', `skip', `recenter',
`scroll-up', `scroll-down', and `quit'.
An `act' response means yes, and a `skip' response means no.
A `quit' response means to invoke `keyboard-quit'.
If the user enters `recenter', `scroll-up', or `scroll-down'
responses, perform the requested window recentering or scrolling
and ask again.

Under a windowing system a dialog box will be used if `last-nonmenu-event'
is nil and `use-dialog-box' is non-nil."
  ;; ¡Beware! when I tried to edebug this code, Emacs got into a weird state
  ;; where all the keys were unbound (i.e. it somehow got triggered
  ;; within read-key, apparently).  I had to kill it.
  (let ((answer 'recenter)
	(padded (lambda (prompt &optional dialog)
		  (let ((l (length prompt)))
		    (concat prompt
			    (if (or (zerop l) (eq ?\s (aref prompt (1- l))))
				"" " ")
			    (if dialog "" "(y or n) "))))))
    (cond
     (noninteractive
      (setq prompt (funcall padded prompt))
      (let ((temp-prompt prompt))
	(while (not (memq answer '(act skip)))
	  (let ((str (read-string temp-prompt)))
	    (cond ((member str '("y" "Y")) (setq answer 'act))
                  ((member str '("" "")) (setq answer 'act))
                  ((member str '(nil nil)) (setq answer 'act))
		  ((member str '("n" "N")) (setq answer 'skip))
		  (t (setq temp-prompt (concat "Please answer y or n.  "
					       prompt))))))))
     ((and (display-popup-menus-p)
	   (listp last-nonmenu-event)
	   use-dialog-box)
      (setq prompt (funcall padded prompt t)
	    answer (x-popup-dialog t `(,prompt ("Yes" . act) ("No" . skip) ("". act) (nil . act)))))
     (t
      (setq prompt (funcall padded prompt))
      (while
          (let* ((scroll-actions '(recenter scroll-up scroll-down
                                            scroll-other-window scroll-other-window-down))
		 (key
                  (let ((cursor-in-echo-area t))
                    (when minibuffer-auto-raise
                      (raise-frame (window-frame (minibuffer-window))))
                    (read-key (propertize (if (memq answer scroll-actions)
                                              prompt
                                            (concat "Please answer y or n.  "
                                                    prompt))
                                          'face 'minibuffer-prompt)))))
            (setq answer (lookup-key query-replace-map (vector key) t))
            (cond
	     ((memq answer '(skip act)) nil)
	     ((eq answer 'recenter)
	      (recenter) t)
	     ((eq answer 'scroll-up)
	      (ignore-errors (scroll-up-command)) t)
	     ((eq answer 'scroll-down)
	      (ignore-errors (scroll-down-command)) t)
	     ((eq answer 'scroll-other-window)
	      (ignore-errors (scroll-other-window)) t)
	     ((eq answer 'scroll-other-window-down)
	      (ignore-errors (scroll-other-window-down)) t)
	     ((or (memq answer '(exit-prefix quit)) (eq key ?\e))
	      (signal 'quit nil) t)
	     (t t)))
        (ding)
        (discard-input))))
    (let ((ret (eq answer 'act)))
      (unless noninteractive
        (message "%s%c" prompt (if ret ?y ?n)))
      ret)))

(defalias 'yes-or-no-p 'my-y-or-n-p)

(provide 'behavior)
