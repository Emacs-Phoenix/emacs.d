(require 'elfeed)
(require 'elfeed-org)

(global-set-key (kbd "C-x w") 'elfeed)

(setq elfeed-feeds
      '(("http://nullprogram.com/feed/" blog emacs)
        "http://www.50ply.com/atom.xml"  ; no autotagging
        ("http://nedroid.com/feed/" webwomic)
        ("https://www.v2ex.com/feed/tab/tech.xml" v2ex)))

(global-set-key (kbd "C-x w") 'elfeed)

(elfeed-org)

(setq rmh-elfeed-org-files (list "~/.emacs.d/elfeed.org"))

(setf url-queue-timeout 10)

(provide 'setup-rss)
