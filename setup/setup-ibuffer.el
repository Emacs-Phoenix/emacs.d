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

;;========
;;ibuffer sort
(add-hook 'ibuffer-hook
          (lambda ()
            (ibuffer-projectile-set-filter-groups)
            (unless (eq ibuffer-sorting-mode 'alphabetic)
              (ibuffer-do-sort-by-alphabetic))))


(provide 'setup-ibuffer)
