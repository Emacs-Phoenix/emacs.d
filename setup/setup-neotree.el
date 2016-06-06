(require 'neotree)

(when neo-persist-show
  (add-hook 'popwin:before-popup-hook
            (lambda () (setq neo-persist-show nil)))
  (add-hook 'popwin:after-popup-hook
            (lambda () (setq neo-persist-show t))))

(global-set-key [f8] 'neotree-toggle)

(provide 'setup-neotree)
