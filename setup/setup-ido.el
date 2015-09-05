(require 'ido)
(ido-mode t)

;;flx-ido
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

;;vertical
(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

(setq ido-use-faces t)
(set-face-attribute 'ido-vertical-first-match-face nil
                                        :background "#e5b7c0")
(set-face-attribute 'ido-vertical-only-match-face nil
                                        :background "#e52b50"
                                                            :foreground "white")
(set-face-attribute 'ido-vertical-match-face nil
                                        :foreground "#b00000")
(ido-vertical-mode 1)

;;ido-ubiquitous
(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

(require 'smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                  ; when Smex is auto-initialized on its first run.
;;set smex keybinding
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(require 'dash)
;;回家
(defun ehack/ido-go-straight-home ()
  (interactive)
  (cond
   ((looking-back "~/") (insert "projects/"))
   ((looking-back "/") (insert "~/"))
   (:else (call-interactively 'self-insert-command))))


(defun ehack-ido ()
  ;; Go straight home
  (define-key ido-file-completion-map (kbd "~") 'ehack/ido-go-straight-home)
  (define-key ido-file-completion-map (kbd "C-~") 'ehack/ido-go-straight-home)

  ;; Use C-w to go back up a dir to better match normal usage of C-w
  ;; - insert current file name with C-x C-w instead.
  (define-key ido-file-completion-map (kbd "C-w") 'ido-delete-backward-updir)
  (define-key ido-file-completion-map (kbd "C-x C-w") 'ido-copy-current-file-name)

  (define-key ido-file-dir-completion-map (kbd "C-w") 'ido-delete-backward-updir)
  (define-key ido-file-dir-completion-map (kbd "C-x C-w") 'ido-copy-current-file-name))

(add-hook 'ido-setup-hook 'ehack-ido)

(require 'ido-at-point)
(ido-at-point-mode)

(require 'bookmark)
  (setq enable-recursive-minibuffers t)
  (define-key ido-file-dir-completion-map (kbd "M-B") 'ido-goto-bookmark)
  (defun ido-goto-bookmark (bookmark)
    (interactive
     (list (bookmark-completing-read "Jump to bookmark"
      				   bookmark-current-bookmark)))
    (unless bookmark
      (error "No bookmark specified"))
    (let ((filename (bookmark-get-filename bookmark)))
      (if (file-directory-p filename)
  	(progn
  	  (ido-set-current-directory filename)
  	  (setq ido-text ""))
        (progn
  	(ido-set-current-directory (file-name-directory filename))))
      (setq ido-exit        'refresh
  	  ido-text-init   ido-text
  	  ido-rotate-temp t)
      (exit-minibuffer)))

 (defun ido-bookmark-jump (bname)
    "*Switch to bookmark interactively using `ido'."
    (interactive (list (ido-completing-read "Bookmark: " (bookmark-all-names) nil t)))
    (bookmark-jump bname))

; sort ido filelist by mtime instead of alphabetically
  (add-hook 'ido-make-file-list-hook 'ido-sort-mtime)
  (add-hook 'ido-make-dir-list-hook 'ido-sort-mtime)
  (defun ido-sort-mtime ()
    (setq ido-temp-list
          (sort ido-temp-list 
                (lambda (a b)
                  (time-less-p
                   (sixth (file-attributes (concat ido-current-directory b)))
                   (sixth (file-attributes (concat ido-current-directory a)))))))
    (ido-to-end  ;; move . files to end (again)
     (delq nil (mapcar
                (lambda (x) (and (char-equal (string-to-char x) ?.) x))
                ido-temp-list))))

(setq ido-auto-merge-work-directories-length -1)
;; disable auto searching for files unless called explicitly
(setq ido-auto-merge-delay-time 99999)
(define-key ido-file-dir-completion-map (kbd "C-c C-s") 
  (lambda() 
    (interactive)
    (ido-initiate-auto-merge (current-buffer))))

(provide 'setup-ido)
