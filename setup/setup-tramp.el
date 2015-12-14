(require 'tramp)
(require 'tramp-cache)

(setq tramp-default-method "ssh")
(setq tramp-debug-buffer t)
(setq tramp-verbose 9)
(setq tramp-default-method "ssh")
(setq tramp-password-prompt-regexp ".*[Pp]assword: *$")
(setq tramp-shell-prompt-pattern "^[^;$#>]*[;$#>] *")
(setq password-cache-expiry nil)


(provide 'setup-tramp)
