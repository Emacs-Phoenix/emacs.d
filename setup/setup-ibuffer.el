(defun delete-completion-window-buffer (&optional output)
  (interactive)                                                                                                
  (dolist (win (window-list))                                                                                  
    (when (string= (buffer-name (window-buffer win)) "*Completions*")                                          
      (delete-window win)                                                                                      
      (kill-buffer "*Completions*")))                                                                          
  output)                                                                                                      

(defun delete-ibuffer-window-buffer (&optional output)                                                                
  (interactive)                                                                                                
  (dolist (win (window-list))                                                                                  
    (when (string= (buffer-name (window-buffer win)) "*Ibuffer*")                                          
      (delete-window win)                                                                                      
      (kill-buffer "*Ibuffer*")))                                                                          
  output)                                                                                                      


(add-hook 'comint-preoutput-filter-functions 'delete-completion-window-buffer)
(add-hook 'comint-preoutput-filter-functions 'delete-ibuffer-window-buffer)

;;========
;;ibuffer sort
(add-hook 'ibuffer-hook
          (lambda ()
            (ibuffer-projectile-set-filter-groups)
            (unless (eq ibuffer-sorting-mode 'alphabetic)
              (ibuffer-do-sort-by-alphabetic))))

;;========
;;mouse click
(defun xah-ibuffer-keys ()
  "Modify keymaps used by `ibuffer'."
  (local-set-key (kbd "<down-mouse-1>") 'ibuffer-visit-buffer-other-window))

;;TODO: readme
;; ||||
;; (defun xah-ibuffer-keys2 ()
;;   "Modify keymaps used by `ibuffer'."
;;   (local-set-key (kbd "<down-mouse-1>")
;;                  (lambda (event)
;;                    (interactive "e")
;;                    ibuffer-visit-buffer)))


(add-hook 'ibuffer-hook 'xah-ibuffer-keys)


;;Running the command ibuffer-auto-mode in an Ibuffer buffer makes it refresh the display after each interactive command.
(add-hook 'ibuffer-mode-hook (lambda () (ibuffer-auto-mode 1)))

(provide 'setup-ibuffer)
