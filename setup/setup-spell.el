;; norvig checker in elisp
;; algorithm was barely modified from 
;;   https://github.com/mikaelj/snippets/blob/master/lisp/spellcheck/spellcheck.lisp
;;
;; usage: 
;; 
;;  - You'll need a big text file of the english language
;;  
;;  - I suggest a novel or two concatenated together along with a dictionary
;;  
;;  - here is one file you could use: http://norvig.com/big.txt
;;
;;  - set `se-training-file' to the path of your file
;;
;;  - then enable se-spell-mode in a buffer;
;;
;;  - on misspelled words, use 'C-c s e' to fix them 
;;
;;  there is no way to add words or ignore words right now
;;  this is just a proof of concept.

(require 'pulse)
(require 'ido)
(require 'cl)

(defun se-file-words (file)
  (let ((words nil))
    (with-temp-buffer
      (insert-file-contents file)
      (goto-char 1)
      (while (re-search-forward "[a-z]+" nil t 1)
        (push (downcase (match-string 0)) words)))
    words))

(defun se-train (words)
  (let ((frequency (make-hash-table :test 'equal)))
    (dolist (word words)
      (setf (gethash word frequency) (1+ (gethash word frequency 1))))
    frequency))

(defvar se-training-file "~/Downloads/mydict.txt")

(defvar se-freq nil)

(defun se-retrain ()
  (setq se-freq (se-train (se-file-words se-training-file))))

(defvar se-alphabet "abcdefghijklmnopqrstuvwxyz")

;;; edits of one character
(defun se-edits-1 (word)
  (let* ((splits (loop for i from 0 upto (length word)
                       collecting (cons (subseq word 0 i) (subseq word i))))
         (deletes (loop for (a . b) in splits
                        when (not (zerop (length b)))
                        collect (concatenate 'string a (subseq b 1))))
         (transposes (loop for (a . b) in splits
                           when (> (length b) 1)
                           collect (concatenate 'string a (subseq b 1 2) (subseq b 0 1) (subseq b 2))))
         (replaces (loop for (a . b) in splits
                         nconcing (loop for c across se-alphabet
                                        when (not (zerop (length b)))
                                        collect (concatenate 'string a (string c) (subseq b 1)))))
         (inserts (loop for (a . b) in splits
                        nconcing (loop for c across se-alphabet
                                       collect (concatenate 'string a (string c) b)))))
    (nconc deletes transposes replaces inserts)))

(defun se-known-edits-2 (word)
  (let ((edits nil))
    (dolist (e1 (se-edits-1 word))
      (dolist (e2 (se-edits-1 e1))
        (let ((n (gethash e2 se-freq)))
          (when n 
            (push (list n e2) edits)))))
    edits))

(defun se-known (words)
  (let ((known nil))
    (dolist (word words)
      (let ((n (gethash word se-freq)))
        (when n
          (push (list n word) known))))
    known))

(defun se-correct (word)
  (let ((word (downcase word)))
    (let ((words (or (se-known (list word)) (se-known (se-edits-1 word)) (se-known-edits-2 word) (list (list 1 word)))))
      (subseq (sort words (lambda (a b) (> (car a) (car b)))) 0 (min (length words) 5)))))

(defun se-correct-word ()
  (interactive)
  (let* ((word (thing-at-point 'word t))
         (candidates (se-correct (downcase word))))
    (if (= (length candidates) 1)
        (if (and (gethash (downcase word) se-freq)
                 (equal word (cadar candidates)))
            (message "all good")
          (message "no alternatives found!"))
      (let ((chosen (ido-completing-read "choices: " (mapcar 'cadr candidates))))
        (let* ((bounds (bounds-of-thing-at-point 'word))
               (beg (car bounds))
               (end (cdr bounds)))
          (delete-region beg end)
          (insert chosen)
          (pulse-momentary-highlight-region beg (point))
          (forward-word -1)
          (forward-word 1))))))

(define-minor-mode se-spell-mode
  "simple on the fly spell checking in emacs lisp."
  :init-value nil
  :lighter "ses"
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "C-c s e") 'se-correct-word)
            map)
  (save-excursion
    (if se-spell-mode
        (progn (unless se-freq
                 (se-retrain))
               (progn (add-hook 'jit-lock-functions 'se-spell-mark-region t)
                      (se-spell-mark-region 1 (point-max))))
      (remove-hook 'jit-lock-functions 'se-spell-mark-region)
      (font-lock-fontify-region 1 (point-max)))))

(defun se-spell-mark-region (beg end)
  (save-excursion
    (goto-char beg)
    (while (re-search-forward "[a-zA-Z]+" end t 1)
      (unless (gethash (downcase (match-string 0)) se-freq)
        (let* ((bounds (bounds-of-thing-at-point 'word))
               (beg (car bounds))
               (end (cdr bounds)))
          (add-text-properties beg end (list 'se-spell-marked t 'face '(:foreground "red" :underline "red"))))))))

(provide 'setup-spell)
