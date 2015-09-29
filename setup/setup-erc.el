
;;;autojoin
(defun myerc-join-channels (&rest channels)
  (mapc 'erc-join-channel channels))

(defun myerc-autojoin-channels (server nick)
  (cond
   ((string= erc-session-server "irc.freenode.net")
    (myerc-join-channels "#emacs" 
                         "#linuxba"))))
(add-hook 'erc-after-connect 'myerc-autojoin-channels)


(provide 'setup-erc)
