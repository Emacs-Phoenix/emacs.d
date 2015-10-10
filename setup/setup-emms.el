(add-to-list 'load-path "~/.emacs.d/site-lisp/emms/lisp")

(require 'emms-setup)
(require 'emms-cover)

(emms-standard)
(emms-default-players)

(setq emms-info-asynchronously nil)
(setq emms-playlist-buffer-name "*Music*")

;;;============emms-notify.el
(defvar terminal-notifier-command (executable-find "terminal-notifier") "The path to terminal-notifier.")
(defun terminal-notifier-notify (title subtitle message contentImage)
  "Show a message with `terminal-notifier-command`.
uses the TITLE SUBTITLE MESSAGE and CONTENTIMAGE."
  (start-process "terminal-notifier"
                 "*terminal-notifier*"
                 terminal-notifier-command

                 "-title" title
                 "-subtitle" subtitle
                 "-message" message
                 "-appIcon" contentImage
                 "-activate" "org.gnu.Emacs"
                 "-sender" "org.gnu.Emacs"
                 ))


(defun get-path-of-cover ()
  "Get directory of current emms album using current TRACK."
  (concat
   (file-name-directory
    (emms-browser-get-track-field
     (emms-playlist-current-selected-track)
     'name))
   "~/.emacs.d/images/nocover.gif"))


(defun emms-notify-do ()
  "Notify about current song playing."
  (interactive)
  (terminal-notifier-notify
   (emms-browser-get-track-field(emms-playlist-current-selected-track) 'info-title)
   (emms-browser-get-track-field(emms-playlist-current-selected-track) 'info-artist)
   (emms-browser-get-track-field(emms-playlist-current-selected-track) 'info-album)
   (get-path-of-cover))
  (message
   (concat
    (emms-browser-get-track-field(emms-playlist-current-selected-track) 'info-title)
    " - "
    (emms-browser-get-track-field(emms-playlist-current-selected-track) 'info-artist)
    " - "
    (emms-browser-get-track-field(emms-playlist-current-selected-track) 'info-album)
    ))
  )

(setq emms-browser-default-covers
      (list "~/.emacs.d/images/nocover.gif" nil nil))

(defadvice emms-browser-next-mapping-type
    (after no-album (current-mapping))
  (when (eq ad-return-value 'info-album)
    (setq ad-return-value 'info-title)))
(defun toggle-album-display ()
  (if (string= emms-browser-current-filter-name "singles")
      (ad-activate 'emms-browser-next-mapping-type)
    (ad-deactivate 'emms-browser-next-mapping-type)))

(add-hook 'emms-browser-filter-changed-hook 'toggle-album-display)


(require 'emms-mode-line-cycle)

(emms-mode-line 1)
(emms-playing-time 1)

;; If you use this package like `emms-mode-line-icon', you need to load it.
(require 'emms-mode-line-icon)
(custom-set-variables '(emms-mode-line-cycle-use-icon-p t))

(emms-mode-line-cycle 1)

;;;++++++++++++++++++++
(setq emms-last-played-format-alist
      '(((emms-last-played-seconds-today) . "%a %H:%M")
	(604800                           . "%a %H:%M") ; this week
	((emms-last-played-seconds-month) . "%d")
	((emms-last-played-seconds-year)  . "%m/%d")
	(t                                . "%Y/%m/%d")))

(eval-after-load "emms"
  '(progn

     (setq xwl-emms-playlist-last-track nil)
     (setq xwl-emms-playlist-last-indent "\\")

     (defun xwl-emms-track-description-function (track)
       "Return a description of the current track."
       (let* ((name (emms-track-name track))
              (type (emms-track-type track))
              (short-name (file-name-nondirectory name))
              (play-count (or (emms-track-get track 'play-count) 0))
              (last-played (or (emms-track-get track 'last-played) '(0 0 0)))
              (empty "..."))
         (prog1
             (case (emms-track-type track)
               ((file url)
                (let* ((artist (or (emms-track-get track 'info-artist) empty))
                       (year (emms-track-get track 'info-year))
                       (playing-time (or (emms-track-get track 'info-playing-time) 0))
                       (min (/ playing-time 60))
                       (sec (% playing-time 60))
                       (album (or (emms-track-get track 'info-album) empty))
                       (tracknumber (emms-track-get track 'info-tracknumber))
                       (short-name (file-name-sans-extension
                                    (file-name-nondirectory name)))
                       (title (or (emms-track-get track 'info-title) short-name))

                       ;; last track
                       (ltrack xwl-emms-playlist-last-track)
                       (lartist (or (and ltrack (emms-track-get ltrack 'info-artist))
                                    empty))
                       (lalbum (or (and ltrack (emms-track-get ltrack 'info-album))
                                   empty))

                       (same-album-p (and (not (string= lalbum empty))
                                          (string= album lalbum))))
                  (format "%10s  %3d   %-20s%-60s%-35s%-15s%s"
                          (emms-last-played-format-date last-played)
                          play-count
                          artist

                          ;; Combine indention, tracknumber, title.
                          (concat
                           (if same-album-p ; indention by album
                               (setq xwl-emms-playlist-last-indent
                                     (concat " " xwl-emms-playlist-last-indent))
                             (setq xwl-emms-playlist-last-indent "\\")
                             "")
                           (if (and tracknumber ; tracknumber
                                    (not (zerop (string-to-number tracknumber))))
                               (format "%02d." (string-to-number tracknumber))
                             "")
                           title        ; title
                           )

                          ;; album
                          (cond ((string= album empty) empty)
                                ;; (same-album-p "  ")
                                (t (concat "ã€Š" album "ã€‹")))

                          (or year empty)
                          (if (or (> min 0)  (> sec 0))
                              (format "%02d:%02d" min sec)
                            empty))))
               ((url)
                (concat (symbol-name type) ":" name))
               (t
                (format "%-3d%s"
                        play-count
                        (concat (symbol-name type) ":" name))))
           (setq xwl-emms-playlist-last-track track))))

     (setq emms-track-description-function
           'xwl-emms-track-description-function)
     ))

(provide 'setup-emms)
