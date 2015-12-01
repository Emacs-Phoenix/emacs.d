(require 'elfeed)

(global-set-key (kbd "C-x w") 'elfeed)


(setq elfeed-feeds
      '(("http://nullprogram.com/feed/" blog emacs)
        ("https://www.raspberrypi.org/feed/" raspberry-pi)
        ("http://nedroid.com/feed/" webwomic)
        ("http://emacs-china.org/rss.xml" emacs emacs-china)
        ("http://emacsist.com/rss" emacs)
        ("http://segmentfault.com/feeds" segmentfault)
        ("http://www.infoq.com/cn/feed" infoq)
        ("http://blog.zhaojie.me/rss" blog)
        ;;("https://github.com/AbyChan.private.atom?token=AGowAFs_OGXG7dKf8q7hqH__kLXXUkkvks60Kz-LwA==" github)
        ;;("http://stackoverflow.com/feeds/tag?tagnames=javascript&sort=newest" stackoverflow javascript)
        ("http://stackoverflow.com/feeds/tag?tagnames=emacs&sort=newest" stackoverflow emacs)
        ("https://www.v2ex.com/feed/tab/tech.xml" v2ex)
        ("https://linuxtoy.org/feeds/all.atom.xml" linux)))

(global-set-key (kbd "C-x w") 'elfeed)

;;let timeout short becuase i'm in China
;;(setf url-queue-timeout 10)

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
