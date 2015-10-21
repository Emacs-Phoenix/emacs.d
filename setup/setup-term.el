(setq system-uses-terminfo nil)

;;# If you use Cocoa Emacs or Carbon Emacs
;;tic -o ~/.terminfo /Applications/Emacs.app/Contents/Resources/etc/e/eterm-color.ti

(add-hook 'term-mode-hook
          (lambda ()
            (setq term-buffer-maximum-size 10000)))


(defcustom term-unbind-key-list
  '("C-z" "C-x" "C-c" "C-h" "C-y" "<ESC>" "M-x")
  "The key list that will need to be unbind."
  :type 'list
  :group 'multi-term)

(defcustom term-bind-key-alist
  '(
    ("C-c C-c" . term-interrupt-subjob)
    ("C-p" . previous-line)
    ("C-n" . next-line)
    ("C-s" . isearch-forward)
    ("C-r" . isearch-backward)
    ("C-m" . term-send-raw)
    ("M-f" . term-send-forward-word)
    ("M-b" . term-send-backward-word)
    ("M-o" . term-send-backspace)
    ("M-p" . term-send-up)
    ("M-n" . term-send-down)
    ("M-M" . term-send-forward-kill-word)
    ("M-N" . term-send-backward-kill-word)
    ("M-r" . term-send-reverse-search-history)
    ("M-," . term-send-input)
    ("M-x" . smex)
    ("M-." . comint-dynamic-complete)
    ("<next>" . next-buffer)
    ("<prior>" . previous-buffer))
  "The key alist that will need to be bind.
If you do not like default setup, modify it, with (KEY . COMMAND) format."
  :type 'alist
  :group 'multi-term)


(add-hook 'term-mode-hook
          (lambda ()
            (add-to-list 'term-bind-key-alist '("M-[" . multi-term-prev))
            (add-to-list 'term-bind-key-alist '("M-]" . multi-term-next))
            (add-to-list 'term-bind-key-alist '("<next>" . next-buffer))
            (add-to-list 'term-bind-key-alist '("<prior>" . previous-buffer))))

;;You may want to simply switch between character mode and line mode while using the terminal. C-x C-j will activate term-line-mode, which treats the terminal buffer more like a normal text-buffer in which you can move the cursor and yank text. You can switch back to character mode with C-c C-k.

(add-hook 'term-mode-hook
          (lambda ()
            (define-key term-raw-map (kbd "C-y") 'term-paste)))



;;;=================================================
;;Those who are accustomed to use M-x shell may find M-x ansi-term does not adhere explicit-bash-args (e.g. to make the login-shell), nor .emacs_bash (or .emacs.d/init_bash.sh). Since M-x ansi-term does not support additional arguments to the shell, I’d write small replacement to M-x ansi-term to mimic M-x shell.
(defun term/shell (program &optional new-buffer-name)
  "Start a terminal-emulator in a new buffer.

    With a prefix argument, it prompts the user for the shell
    executable.

    If there is already existing buffer with the same name, switch to
    that buffer, otherwise it creates new buffer.

    Like `shell', it loads `~/.emacs_SHELLNAME' if exists, or
    `~/.emacs.d/init_SHELLNAME.sh'.

    The shell file name (sans directories) is used to make a symbol
    name such as `explicit-bash-args'.  If that symbol is a variable,
    its value is used as a list of arguments when invoking the
    shell."
  (interactive (let ((default-prog (or explicit-shell-file-name
                                       (getenv "ESHELL")
                                       shell-file-name
                                       (getenv "SHELL")
                                       "/bin/sh")))
                 (list (if (or (null default-prog)
                               current-prefix-arg)
                           (read-from-minibuffer "Run program: " default-prog)
                         default-prog))))

  ;; Pick the name of the new buffer.
  (setq term-ansi-buffer-name
        (if new-buffer-name
            new-buffer-name
          (if term-ansi-buffer-base-name
              (if (eq term-ansi-buffer-base-name t)
                  (file-name-nondirectory program)
                term-ansi-buffer-base-name)
            "shell/term")))

  (setq term-ansi-buffer-name (concat "*" term-ansi-buffer-name "*"))

  ;; In order to have more than one term active at a time
  ;; I'd like to have the term names have the *term-ansi-term<?>* form,
  ;; for now they have the *term-ansi-term*<?> form but we'll see...
  (when current-prefix-arg
    (setq term-ansi-buffer-name 
          (generate-new-buffer-name term-ansi-buffer-name)))

  (let* ((name (file-name-nondirectory program))
         (startfile (concat "~/.emacs_" name))
         (xargs-name (intern-soft (concat "explicit-" name "-args"))))
    (unless (file-exists-p startfile)
      (setq startfile (concat user-emacs-directory "init_" name ".sh")))

    (setq term-ansi-buffer-name
          (apply 'term-ansi-make-term term-ansi-buffer-name program
                 (if (file-exists-p startfile) startfile)
                 (if (and xargs-name (boundp xargs-name))
                     ;; `term' does need readline support.
                     (remove "--noediting" (symbol-value xargs-name))
                   '("-i")))))

  (set-buffer term-ansi-buffer-name)
  (term-mode)
  (term-line-mode)                      ; (term-char-mode) if you want

  ;; I wanna have find-file on C-x C-f -mm
  ;; your mileage may definitely vary, maybe it's better to put this in your
  ;; .emacs ...

  (term-set-escape-char ?\C-x)

  (switch-to-buffer term-ansi-buffer-name))

(global-set-key "\C-cd" 'term/shell)

(require 'shell-pop)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;;'(shell-pop-default-directory "/Users/kyagi/git")
 '(shell-pop-shell-type (quote ("ansi-term" "*ansi-term*" (lambda nil (ansi-term shell-pop-term-shell)))))
 '(shell-pop-term-shell "/bin/zsh")
 '(shell-pop-universal-key "C-t")
 '(shell-pop-window-size 30)
 '(shell-pop-full-span t)
 '(shell-pop-window-position "bottom"))


(define-key term-mode-map (kbd "<prior>") 'previous-buffer)
(define-key term-mode-map (kbd "<home>") 'beginning-of-buffer)
(define-key term-mode-map (kbd "<next>") 'next-buffer)
(define-key term-mode-map (kbd "<end>") 'end-of-buffer)

(provide 'setup-term)
