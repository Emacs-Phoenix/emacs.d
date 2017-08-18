(require 'spaceline-config)
;; (spaceline-emacs-theme)
(spaceline-spacemacs-theme)

;; (spaceline-toggle-persp-name-off)
;; (spaceline-toggle-workspace-number-off)
;; (spaceline-toggle-evil-state-off)
;; (spaceline-toggle-auto-compile-off)
;; (spaceline-toggle-buffer-modified-off)
;; (spaceline-toggle-remote-host-off)
(spaceline-toggle-minor-modes-off)
;; (spaceline-toggle-process-off)
;; (spaceline-toggle-erc-track-off)
;; (spaceline-toggle-version-control-off)
;; (spaceline-toggle-org-clock-off)
;; (spaceline-toggle-selection-info-off)
;; (spaceline-toggle-buffer-encoding-abbrev-off)
;; (spaceline-compile nil nil)

(spaceline-compile '(((persp-name workspace-number window-number)
                      :fallback evil-state :separator "|" :face highlight-face)
                     anzu auto-compile
                     (buffer-modified buffer-size buffer-id remote-host)
                     major-mode
                     ((point-position line-column)
                      :separator " | ")
                     (process :when active)
                     ((flycheck-error flycheck-warning flycheck-info)
                      :when active)
                     (minor-modes :when active)
                     (mu4e-alert-segment :when active)
                     (erc-track :when active)
                     (version-control :when active)
                     (org-pomodoro :when active)
                     (org-clock :when active)
                     nyan-cat)

  '(which-function
    (python-pyvenv :fallback python-pyenv)
    (battery :when active)
    selection-info input-method
    (buffer-encoding-abbrev)
    (global :when active)
    buffer-position hud))

(require 'nyan-mode)
(nyan-mode t)

(provide 'setup-powerline)
