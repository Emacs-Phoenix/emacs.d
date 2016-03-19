

;; after deleting a tag, indent properly
(defadvice sgml-delete-tag (after reindent activate)
  (indent-region (point-min) (point-max)))


(eval-after-load "sgml-mode"
  '(progn
     (require 'tagedit)
     (add-hook 'html-mode-hook (lambda () (tagedit-mode 1)))))


(tagedit-add-experimental-features)



(provide 'setup-html)
