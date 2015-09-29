(add-to-list 'load-path "~/.emacs.d/site-lisp/emms/lisp")
(require 'emms-setup)
(emms-standard)
(emms-default-players)


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
   "cover_small.jpg"))


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

(defgroup emms-setup nil
  "*The Emacs Multimedia System setup utility."
  :prefix "emms-setup"
  :group 'multimedia)

(defcustom emms-setup-default-player-list
  '(emms-player-mpg321
    emms-player-ogg123
    emms-player-mplayer-playlist
    emms-player-mplayer
    emms-player-vlc
    emms-player-vlc-playlist)
  "*Default list of players for emms-setup."
  :group 'emms-setup
  :type 'list)

;;;###autoload
(defun emms-minimalistic ()
  "An Emms setup script.
Invisible playlists and all the basics for playing media."
  (require 'emms-source-file)
  (require 'emms-source-playlist)
  (require 'emms-player-simple)
  (require 'emms-player-mplayer)
  (require 'emms-player-vlc))

;;;###autoload
(defun emms-standard ()
  "An Emms setup script.
Everything included in the `emms-minimalistic' setup, the Emms
interactive playlist mode, reading information from tagged
audio files, and a metadata cache."
  ;; include
  (emms-minimalistic)
  ;; define
  (eval-and-compile
    (require 'emms-playlist-mode)
    (require 'emms-info)
    (require 'emms-info-mp3info)
    (require 'emms-info-ogginfo)
    (require 'emms-cache))
  ;; setup
  (setq emms-playlist-default-major-mode 'emms-playlist-mode)
  (add-to-list 'emms-track-initialize-functions 'emms-info-initialize-track)
  (when (executable-find emms-info-mp3info-program-name)
    (add-to-list 'emms-info-functions 'emms-info-mp3info))
  (when (executable-find emms-info-ogginfo-program-name)
    (add-to-list 'emms-info-functions 'emms-info-ogginfo))
  (setq emms-track-description-function 'emms-info-track-description)
  (when (fboundp 'emms-cache)           ; work around compiler warning
    (emms-cache 1)))

;;;###autoload
(defun emms-all ()
  "An Emms setup script.
Everything included in the `emms-standard' setup and adds all the
stable features which come with the Emms distribution."
  ;; include
  (emms-standard)
  ;; define
  (eval-and-compile
    (require 'emms-mode-line)
    (require 'emms-mark)
    (require 'emms-tag-editor)
    (require 'emms-streams)
    (require 'emms-lyrics)
    (require 'emms-playing-time)
    (require 'emms-player-mpd)
    (require 'emms-player-xine)
    (require 'emms-playlist-sort)
    (require 'emms-browser)
    (require 'emms-mode-line-icon)
    (require 'emms-cue)
    (require 'emms-bookmarks)
    (require 'emms-last-played))
  ;; setup
  (emms-mode-line 1)
  (emms-mode-line-blank)
  (emms-lyrics 1)
  (emms-playing-time 1)
  (add-to-list 'emms-info-functions 'emms-info-cueinfo)
  (add-hook 'emms-player-started-hook 'emms-last-played-update-current))

;;;###autoload
(defun emms-devel ()
  "An Emms setup script.
Everything included in the `emms-all' setup and adds all the
features which come with the Emms distribution regardless of if
they are considered stable or not.  Use this if you like living
on the edge."
  ;; include
  (emms-all)
  ;; define
  (eval-and-compile
    (require 'emms-metaplaylist-mode)
    (require 'emms-stream-info)
    (require 'emms-score)
    (require 'emms-history)
    (require 'emms-i18n)
    (require 'emms-volume)
    (require 'emms-playlist-limit)
    (require 'emms-librefm-scrobbler)
    (require 'emms-librefm-stream))
  ;; setup
  (emms-score 1)
  (emms-playlist-limit 1))

;;;###autoload
(defun emms-default-players ()
  "Set `emms-player-list' to `emms-setup-default-player-list'."
  (setq emms-player-list
	emms-setup-default-player-list))


(provide 'setup-emms)
