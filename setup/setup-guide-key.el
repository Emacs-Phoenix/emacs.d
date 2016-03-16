(require 'guide-key)

(setq guide-key/guide-key-sequence '("C-x r"
                                     "C-x 4"
                                     "C-c p"
                                     "C-c C-r"
                                     "C-x C-m"))
(setq guide-key/idle-delay 0.01)


(guide-key-mode 1)  ; Enable guide-key-mode


(provide 'setup-guide-key)
