(require 'elfeed)
(require 'elfeed-org)

(global-set-key (kbd "C-x w") 'elfeed)

;; (setq elfeed-feeds
;;       '("https://www.v2ex.com/feed/tab/tech.xml"
;;         "http://www.terminally-incoherent.com/blog/feed/"))

(setq elfeed-feeds
      '(("http://nullprogram.com/feed/" blog emacs)
        ("https://www.raspberrypi.org/feed/" rpi)
        ("http://nedroid.com/feed/" webwomic)
        ("https://www.v2ex.com/feed/tab/tech.xml" v2ex)))

(global-set-key (kbd "C-x w") 'elfeed)

(elfeed-org)

(setq rmh-elfeed-org-files (list "~/.emacs.d/elfeed.org"))

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
