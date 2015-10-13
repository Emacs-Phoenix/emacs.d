
(defun node-js-eval-region-or-buffer ()
  "Evaluate the current buffer (or region if mark-active),
   and return the result into another buffer,
   which is to be shown in a window."
  (interactive)
  (let ((debug-on-error t) (start 1) (end 1))
    (cond
     (mark-active
      (setq start (point))
      (setq end (mark)))
     (t
      (setq start (point-min))
      (setq end (point-max))))
    (call-process-region
     start end     ; seems the order does not matter
     "node"        ; node.js
     nil           ; don't delete region
     "*node.js*"     ; output buffer
     nil)          ; no redisply during output
    (message "Region or buffer evaluated!")
    (setq deactivate-mark t))) ; deactive the region, regardless

(define-key global-map (kbd "C-c v") 'node-js-eval-region-or-buffer)


(provide 'setup-js2)
