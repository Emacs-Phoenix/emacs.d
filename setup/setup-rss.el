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

(provide 'setup-rss)
