(require 'elfeed)

(global-set-key (kbd "C-x w") 'elfeed)


(setq elfeed-feeds
      '(("http://nullprogram.com/feed/" blog emacs)
        ("https://www.raspberrypi.org/feed/" rpi)
        ("http://nedroid.com/feed/" webwomic)
        ("http://emacs-china.org/rss.xml" emacs emacs-china)
        ("http://planet.emacsen.org/atom.xml" emacs planet-emacs)
        ("http://stackoverflow.com/feeds/tag?tagnames=javascript&sort=newest" stackoverflow javascript)
        ("https://www.v2ex.com/feed/tab/tech.xml" v2ex)))

(global-set-key (kbd "C-x w") 'elfeed)


(setf url-queue-timeout 10)

(defun elfeed-search-format-date (date)
  (format-time-string "%Y-%m-%d %H:%M" (seconds-to-time date)))

(defun xcowsay (message)
  (call-process "xcowsay" nil nil nil message))

(defun elfeed-xcowsay ()
  (interactive)
  (let ((entry (elfeed-search-selected :single)))
    (xcowsay (elfeed-entry-title entry))))

(define-key elfeed-search-mode-map "x" #'elfeed-xcowsay)

(provide 'setup-rss)
