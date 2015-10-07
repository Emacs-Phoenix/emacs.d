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
;;=================end

;; (defgroup emms-setup nil
;;   "*The Emacs Multimedia System setup utility."
;;   :prefix "emms-setup"
;;   :group 'multimedia)

;; (defcustom emms-setup-default-player-list
;;   '(emms-player-mpg321
;;     emms-player-ogg123
;;     emms-player-mplayer-playlist
;;     emms-player-mplayer
;;     emms-player-vlc
;;     emms-player-vlc-playlist)
;;   "*Default list of players for emms-setup."
;;   :group 'emms-setup
;;   :type 'list)

;; ;;;###autoload
;; (defun emms-minimalistic ()
;;   "An Emms setup script.
;; Invisible playlists and all the basics for playing media."
;;   (require 'emms-source-file)
;;   (require 'emms-source-playlist)
;;   (require 'emms-player-simple)
;;   (require 'emms-player-mplayer)
;;   (require 'emms-player-vlc))

;; ;;;###autoload
;; (defun emms-standard ()
;;   "An Emms setup script.
;; Everything included in the `emms-minimalistic' setup, the Emms
;; interactive playlist mode, reading information from tagged
;; audio files, and a metadata cache."
;;   ;; include
;;   (emms-minimalistic)
;;   ;; define
;;   (eval-and-compile
;;     (require 'emms-playlist-mode)
;;     (require 'emms-info)
;;     (require 'emms-info-mp3info)
;;     (require 'emms-info-ogginfo)
;;     (require 'emms-cache))
;;   ;; setup
;;   (setq emms-playlist-default-major-mode 'emms-playlist-mode)
;;   (add-to-list 'emms-track-initialize-functions 'emms-info-initialize-track)
;;   (when (executable-find emms-info-mp3info-program-name)
;;     (add-to-list 'emms-info-functions 'emms-info-mp3info))
;;   (when (executable-find emms-info-ogginfo-program-name)
;;     (add-to-list 'emms-info-functions 'emms-info-ogginfo))
;;   (setq emms-track-description-function 'emms-info-track-description)
;;   (when (fboundp 'emms-cache)           ; work around compiler warning
;;     (emms-cache 1)))

;; ;;;###autoload
;; (defun emms-all ()
;;   "An Emms setup script.
;; Everything included in the `emms-standard' setup and adds all the
;; stable features which come with the Emms distribution."
;;   ;; include
;;   (emms-standard)
;;   ;; define
;;   (eval-and-compile
;;     (require 'emms-mode-line)
;;     (require 'emms-mark)
;;     (require 'emms-tag-editor)
;;     (require 'emms-streams)
;;     (require 'emms-lyrics)
;;     (require 'emms-playing-time)
;;     (require 'emms-player-mpd)
;;     (require 'emms-player-xine)
;;     (require 'emms-playlist-sort)
;;     (require 'emms-browser)
;;     (require 'emms-mode-line-icon)
;;     (require 'emms-cue)
;;     (require 'emms-bookmarks)
;;     (require 'emms-last-played))
;;   ;; setup
;;   (emms-mode-line 1)
;;   (emms-mode-line-blank)
;;   (emms-lyrics 1)
;;   (emms-playing-time 1)
;;   (add-to-list 'emms-info-functions 'emms-info-cueinfo)
;;   (add-hook 'emms-player-started-hook 'emms-last-played-update-current))

;; ;;;###autoload
;; (defun emms-devel ()
;;   "An Emms setup script.
;; Everything included in the `emms-all' setup and adds all the
;; features which come with the Emms distribution regardless of if
;; they are considered stable or not.  Use this if you like living
;; on the edge."
;;   ;; include
;;   (emms-all)
;;   ;; define
;;   (eval-and-compile
;;     (require 'emms-metaplaylist-mode)
;;     (require 'emms-stream-info)
;;     (require 'emms-score)
;;     (require 'emms-history)
;;     (require 'emms-i18n)
;;     (require 'emms-volume)
;;     (require 'emms-playlist-limit)
;;     (require 'emms-librefm-scrobbler)
;;     (require 'emms-librefm-stream))
;;   ;; setup
;;   (emms-score 1)
;;   (emms-playlist-limit 1))

;; ;;;###autoload
;; (defun emms-default-players ()
;;   "Set `emms-player-list' to `emms-setup-default-player-list'."
;;   (setq emms-player-list
;; 	emms-setup-default-player-list))



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


;;++++++++++++++++++++++++++++++++++++++++++++++
;; (require 'emms-setup)
;; (require 'emms-queue)
;; (require 'emms-playlist-mode)
;; (require 'emms-playlist-sort)
;; (require 'server)
;; (require 'emms-cover)
;; (require 'emms-history)
;; (require 'emms-mark)
;; (require 'emms-mobile-remote)
;; (ignore-errors ; Causes a stupid error
;;   (require 'thumbs))
;; (emms-minimalistic)

;; ;;; FUNCTIONS
;; (defun emms-google-for-lyrics ()
;;   (interactive)
;;   (browse-url
;;    (concat "http://www.google.com/search?q="
;;            (replace-regexp-in-string
;;             " +" "+"
;;             (concat "lyrics "
;;                     (delete ?- (emms-track-description
;;                                 (emms-playlist-current-selected-track))))))))

;; ;; Stolen and adapted from TWB
;; (defun my-emms-info-track-description (track)
;;   "Return a description of the current track."

;;   (let (( pmin (emms-track-get track 'info-playing-time-min))
;;         ( psec (emms-track-get track 'info-playing-time-sec))
;;         ( ptot (emms-track-get track 'info-playing-time))
;;         ( art  (emms-track-get track 'info-artist))
;;         ( tit  (emms-track-get track 'info-title))
;;         ( tname (file-name-base (emms-track-get track 'name)))
;;         time name)
;;     (cond ( (and pmin psec)
;;             (setq time (format " [%02d:%02d]" pmin psec)))
;;           ( ptot
;;             (setq time (format " [%02d:%02d]" (/ ptot 60) (% ptot 60)))))
;;     (cond ( (and art tit)
;;             (setq name (format "%s - %s" art tit)))
;;           ( t (setq name tname)))
;;     (concat name time)))
;; (setq emms-track-description-function 'my-emms-info-track-description)

;; (defun emms-playlist-get-filename-at-point ()
;;   (cdr (assoc 'name (rest (emms-playlist-track-at)))))

;; (defun emms-playlist-dired-jump ()
;;   (interactive)
;;   (dired-jump nil (emms-playlist-get-filename-at-point)))

;; (defun emms-playlist-delete ()
;;   (interactive)
;;   (let (buffer-read-only)
;;     (if (region-active-p)
;;         (progn
;;           (expand-region-selection)
;;           (delete-region (region-beginning) (region-end)))
;;       (delete-region (line-beginning-position)
;;                      (min (1+ (line-end-position))
;;                           (point-max))))))

;; (defun playlist-remove-known ()
;;   (goto-char (point-min))
;;   (while (not (eobp))
;;     (if (looking-at "/")
;;         (forward-line)
;;       (emms-playlist-mode-kill-track))))

;; (defun emms-playlist-cleanup ()
;;   (interactive)
;;   (assert (eq major-mode 'emms-playlist-mode))
;;   (setq buffer-read-only nil)
;;   (save-excursion
;;     (goto-char (point-min))
;;     (while (not (= (point) (point-max)))
;;       (back-to-indentation)
;;       (if (memq (get-text-property (point) 'face)
;;                 '(emms-browser-artist-face
;;                   emms-browser-album-face
;;                   emms-browser-year/genre-face))
;;           (delete-region (line-beginning-position)
;;                          (min (1+ (line-end-position))
;;                               (point-max)))
;;         (forward-line))))
;;   (setq buffer-read-only t))

;; (defun emms-browser-covers-thumbs (path size)
;;   (let (( file-name
;;           (concat (directory-file-name (file-name-directory path))
;;                   "/folder.jpg")))
;;     (when (file-exists-p file-name)
;;       (thumbs-make-thumb file-name))))

;; (defun emms-browser-dired-jump ()
;;   (interactive)
;;   (let* (( file1 (emms-browser-bdata-at-point))
;;          ( file2 (assoc 'data file1))
;;          ( file3 (cdr (assoc 'name (rest (car (cdr file2)))))))
;;     (when file3
;;       (dired-jump nil file3))))

;; (defun emms-start-server ()
;;   (unless (server-running-p)
;;     (setq server-name "emms")
;;     (server-start)))

;; (defun emms-track-description-and-time ()
;;   (if emms-player-playing-p
;;       (format "%s - %s %s"
;;               (emms-track-get
;;                (emms-playlist-current-selected-track)
;;                'info-artist)
;;               (emms-track-get
;;                (emms-playlist-current-selected-track)
;;                'info-title)
;;               (emms-format-time))
;;     ""))

;; (defun emms-add-dired-ask ()
;;   (interactive)
;;   (when (or (boundp 'emms-player-playing-p)
;;             (y-or-n-p "Start emms?"))
;;     (emms-add-dired)))

;; (defun emms-chanel-mplayer-output ()
;;   (let (( buffer
;;           (generate-new-buffer "*EMMS mplayer output*")))
;;     (set-process-buffer
;;      (get-process "emms-player-simple-process")
;;      buffer)))

;; (defun* memms-modeline ()
;;   (unless (emms-playlist-current-selected-track)
;;     (return-from memms-modeline "  -- EMMS --"))
;;   `(:eval
;;     (let (
;;           ( is-current
;;             (eq emms-playlist-buffer
;;                 (current-buffer)))
;;           ( info-artist
;;             (emms-track-get
;;              (emms-playlist-current-selected-track)
;;              'info-artist))
;;           ( info-title
;;             (emms-track-get
;;              (emms-playlist-current-selected-track)
;;              'info-title))
;;           ( info-filename
;;             (file-name-base
;;              (emms-track-get
;;               (emms-playlist-current-selected-track)
;;               'name))))
;;       (concat
;;        "  "
;;        (when is-current
;;          (propertize
;;           "C" 'face
;;           'font-lock-warning-face))
;;        (when emms-repeat-playlist
;;          (propertize "R" 'face `(:weight bold)))
;;        " "
;;        (propertize
;;         (cond ( (and emms-player-paused-p
;;                      emms-player-playing-p) "||")
;;               ( emms-player-playing-p       ">>")
;;               ( t                           "[]"))
;;         'face 'font-lock-keyword-face)
;;        (when emms-player-playing-p
;;          (format "  \\  %s  /  %s"
;;                  (if (and info-artist info-title)
;;                      (format "%s - %s" info-artist info-title)
;;                    info-filename)
;;                  (emms-format-time)))
;;        ))))

;; (defun emms-format-time ()
;;   "Display playing time on the mode line."
;;   (let* (( min (/ emms-playing-time 60))
;;          ( sec (% emms-playing-time 60))
;;          ( total-playing-time
;;            (or (emms-track-get
;;                 (emms-playlist-current-selected-track)
;;                 'info-playing-time)
;;                0))
;;          ( total-min-only (/ total-playing-time 60))
;;          ( total-sec-only (% total-playing-time 60)))
;;     (emms-replace-regexp-in-string
;;      " " "0"
;;      (if (or emms-playing-time-display-short-p
;;              ;; unable to get total playing-time
;;              (eq total-playing-time 0))
;;          (format "%2d:%2d" min sec)
;;        (format "%2d:%2d/%2s:%2s"
;;                min sec total-min-only total-sec-only)))))

;; (defun emms-mark-unmark-backward (arg)
;;   "Unmark one or more tracks and move the point past the tracks.
;; See `emms-mark-unmark-track' for further details."
;;   (interactive "p")
;;   (forward-line -1)
;;   (emms-mark-unmark-track arg))

;; (defun emms-playlist-options ()
;;   (es-define-keys emms-playlist-mode-map
;;                   (kbd "h") 'left-char
;;                   (kbd "j") (ilambda () (forward-line 1))
;;                   (kbd "k") (ilambda ()
;;                                      (forward-line -1)
;;                                      (beginning-of-line))
;;                   (kbd "l") 'right-char
;;                   (kbd "C-v") (ilambda ()
;;                                        (beginning-of-line)
;;                                        (emms-playlist-mode-yank))
;;                   (kbd "<M-down>") 'es-move-text-down-force
;;                   (kbd "<M-up>") 'es-move-text-up-force
;;                   (kbd "<mouse-2>") (lambda (e)
;;                                       (interactive "e")
;;                                       (mouse-set-point e)
;;                                       (emms-playlist-mode-play-current-track))
;;                   ;; (kbd "<mouse-5>") 'es-mouse-scroll-up
;;                   ;; (kbd "<mouse-4>") 'es-mouse-scroll-down
;;                   [remap undo] 'emms-playlist-mode-undo
;;                   [remap undo-tree-undo] 'emms-playlist-mode-undo
;;                   (kbd "=") 'emms-volume-raise
;;                   [remap cua-cut-region] 'emms-playlist-mode-kill
;;                   [remap delete-char] 'emms-playlist-delete
;;                   (kbd "C-d") 'emms-playlist-mode-kill
;;                   (kbd "C-x C-j") 'emms-playlist-dired-jump
;;                   (kbd "C-w") nil
;;                   (kbd "C-n") nil
;;                   (kbd "<backspace>") 'emms-mark-unmark-backward)
;;   ;; (stripe-buffer-mode 1)
;;   ;; (hl-line-mode 1)
;;   (stripe-listify-buffer)
;;   (setq cursor-type nil
;;         truncate-lines t)
;;   (setq mode-line-format '(:eval (memms-modeline))))
;; (add-hook 'emms-playlist-mode-hook 'emms-playlist-options)

;; (defun emms-browser-options ()
;;   (es-define-vim-movment emms-browser-mode-map)
;;   (es-define-keys emms-browser-mode-map
;;                   (kbd "C-M-a") 'emms-browser-prev-non-track
;;                   (kbd "C-M-e") 'emms-browser-next-non-track

;;                   (kbd "C-x C-j") 'emms-browser-dired-jump
;;                   (kbd "<mouse-2>") (lambda (e)
;;                                       (interactive "e")
;;                                       (mouse-set-point e)
;;                                       (emms-browser-add-tracks))
;;                   (kbd "<mouse-3>") (lambda (e)
;;                                       (interactive "e")
;;                                       (mouse-set-point e)
;;                                       (emms-browser-toggle-subitems))
;;                   (kbd "<tab>") 'emms-browser-toggle-subitems)
;;   (hl-line-mode 1)
;;   (setq cursor-type nil))
;; (add-hook 'emms-browser-show-display-hook 'emms-browser-options)

;; ;;; ADVICES

;; (defadvice emms-playing-time-display (around maybe activate)
;;   (when (and emms-player-playing-p
;;              (not emms-player-paused-p))
;;     ad-do-it))

;; (defadvice cua-cut-region (around emms-cut activate)
;;   (let* (( buffer-read-only
;;            (if (eq major-mode 'emms-playlist-mode)
;;                nil
;;              buffer-read-only)))
;;     (when (eq major-mode 'emms-playlist-mode)
;;       (expand-region-selection))
;;     ad-do-it))

;; (defadvice cua-copy-region (around emms-copy activate)
;;   (when (eq major-mode 'emms-playlist-mode)
;;     (expand-region-selection))
;;   ad-do-it)

;; (defun mu4e-win-conf-change ()
;;   (let (( buffers
;;           (remove-if-not
;;            'mvi-buffer-has-window-p
;;            (es-buffers-with-mode
;;             emms-playlist-default-major-mode))))
;;     (when buffers
;;       (emms-playlist-set-playlist-buffer
;;        (first buffers)))))

;; (defun music ()
;;   (interactive)
;;   (when (and (not emms-playlist-buffer)
;;              (es-buffers-with-mode
;;               emms-playlist-default-major-mode))
;;     (setq emms-playlist-buffer
;;           (first (es-buffers-with-mode
;;                   emms-playlist-default-major-mode))))
;;   (if (es-buffers-with-mode
;;        emms-playlist-default-major-mode)
;;       (switch-to-buffer emms-playlist-buffer)
;;     (emms))
;;   (unless (daemonp)
;;     (setq icon-title-format
;;           (setq frame-title-format
;;                 '(:eval (format "=:{ EMMS%s }:="
;;                                 (if emms-player-playing-p
;;                                     (concat ": "
;;                                             (emms-track-description
;;                                              (emms-playlist-current-selected-track)))
;;                                   "")
;;                                 )))))
;;   (emms-start-server)
;;   (setq-default mode-line-format nil)
;;   (mapc 'emms-mark-mode
;;         (es-buffers-with-mode 'emms-playlist-mode)))


;; ;;; REDEFINITIONS

;; (eval-after-load 'emms-playlist-mode
;;   '(progn
;;      ;; +Ignore errors
;;      (defun emms-playlist-mode-startup ()
;;        "Instigate emms-playlist-mode on the current buffer."
;;        ;; when there is neither a current emms track or a playing one...
;;        (when (not (or emms-playlist-selected-marker
;;                       emms-player-playing-p))
;;          ;; ...then stop the player.
;;          (emms-stop)
;;          ;; why select the first track?
;;          (when emms-playlist-buffer-p
;;            (ignore-errors
;;              (emms-playlist-select-first))))
;;        ;; when there is a selected track.
;;        (when emms-playlist-selected-marker
;;          (emms-playlist-mode-overlay-selected))
;;        (emms-with-inhibit-read-only-t
;;         (add-text-properties (point-min)
;;                              (point-max)
;;                              '(face emms-playlist-track-face)))
;;        (setq buffer-read-only t)
;;        (setq truncate-lines t)
;;        (setq buffer-undo-list nil))
;;      ))

;; (eval-after-load 'emms-queue
;;   '(defun emms-queue-target ()
;;      "Queue the track at `point'.
;; Append the track at point, adjusting the existing queue as necessary.
;; This will sort the queue so that the non-queued track is always last."
;;      (setq
;;       emms-queue-overlay-list
;;       (nreverse
;;        (if (eq emms-player-next-function 'emms-queue-or-next)
;;            (cons (emms-queue-add-track-overlay)
;;                  (nreverse emms-queue-overlay-list))
;;          (cons (emms-queue-add-track-overlay) emms-queue-overlay-list))))))

;; (eval-after-load 'emms-browser
;;   '(defun* emms-browse-by (type)
;;      "Render a top level buffer based on TYPE."
;;      ;; FIXME: assumes we only browse by info-*
;;      (let* ((name (substring (symbol-name type) 5))
;;             (modedesc (concat "Browsing by: " name))
;;             (hash (emms-browser-make-hash-by type)))
;;        (when emms-browser-current-filter-name
;;          (setq modedesc (concat modedesc
;;                                 " [" emms-browser-current-filter-name "]")))
;;        (when (get-buffer modedesc)
;;          (switch-to-buffer modedesc)
;;          (return-from emms-browse-by))
;;        ;; (emms-browser-clear)
;;        (emms-browser-create)
;;        (rename-buffer modedesc)
;;        (emms-browser-render-hash hash type)
;;        (setq emms-browser-top-level-hash hash)
;;        (setq emms-browser-top-level-type type)
;;        (unless (> (hash-table-count hash) 0)
;;          (emms-browser-show-empty-cache-message))
;;        (goto-char (point-min)))))

;; (define-emms-playlist-sort info-tracknumber)
;; (define-emms-simple-player spc '(file)
;;   (regexp-opt '(".spc" ".SPC")) "ospc" "-l" "-t " "3:00")

;; (setq emms-mode-line-titlebar-function nil
;;       emms-player-mpg321-parameters '("-o" "alsa")
;;       emms-show-format "NP: %s"
;;       emms-player-next-function 'emms-queue-or-next
;;       emms-source-file-default-directory "~/mp3s/complete_albums/"
;;       emms-lyric-display-p nil
;;       emms-playlist-buffer-name "*EMMS Playlist*"
;;       emms-playlist-mode-open-playlists t
;;       emms-stream-info-format-string "NS: %s"
;;       emms-stream-default-action "play"
;;       emms-stream-popup-default-height 120
;;       emms-source-file-directory-tree-function
;;       'emms-source-file-directory-tree-find
;;       emms-info-functions '(emms-info-libtag)
;;       emms-cover-nocover-image
;;       (es-emacs-path "default-cover.png")
;;       emms-cover-stopped-image
;;       (es-emacs-path "emms.png")
;;       emms-player-list
;;       '(emms-player-spc
;;         emms-player-mplayer-playlist
;;         emms-player-mplayer
;;         emms-player-timidity)
;;       emms-player-mplayer-parameters
;;       (append (list ;; "-nosub" "-noautosub"
;;                "-alang" "eng")
;;               emms-player-mplayer-parameters)
;;       emms-playlist-default-major-mode 'emms-mark-mode
;;       emms-repeat-playlist nil)

;; (emms-mode-line-disable)
;; (emms-playing-time-disable-display)
;; (emms-history-load)

;; (defun emms-source-add (source &rest args)
;;   "Add the tracks of SOURCE at the current position in the playlist."
;;   (let* (( window-buffers
;;            (mapcar 'window-buffer (window-list)))
;;          ( emms-playlists
;;            (emms-playlist-buffer-list))
;;          ( visible-emms-buffers
;;            (cl-intersection
;;             window-buffers
;;             emms-playlists))
;;          ( emms-playlist-buffer
;;            (cond ( (or (not visible-emms-buffers)
;;                        (memq emms-playlist-buffer
;;                              visible-emms-buffers))
;;                    emms-playlist-buffer)
;;                  ( t (car visible-emms-buffers)))))
;;     ;; Could be defadvice
;;     (with-current-emms-playlist
;;       (save-excursion
;;         (goto-char (point-max))
;;         (apply 'emms-playlist-current-insert-source source args))
;;       (when (or (not emms-playlist-selected-marker)
;;                 (not (marker-position emms-playlist-selected-marker)))
;;         (emms-playlist-select-first)))))

;;+++++++++/emms-mode-line-cycle

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
